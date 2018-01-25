class TeamController < ApplicationController
    
    get '/teams' do
        if Helpers.logged_in?(session)
          @teams = Team.all
          erb :'teams/teams_index'
        else
          redirect to '/login'
        end
    end
    
    get '/teams/new' do
        if Helpers.logged_in?(session)
          erb :'/teams/create_team'
        else
          redirect to '/login'
        end
    end
    
    post '/teams' do
        team = Team.create(name: params[:name],chaser: params[:chaser],beater: params[:beater],keeper: params[:keeper],seeker: params[:seeker], user_id: session[:user_id])
    
        if team.name != ""
          redirect to "teams/#{team.id}"
        else
          redirect to '/teams/new'
        end
  end
    
end