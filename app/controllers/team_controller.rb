class TeamController < ApplicationController
    
  get '/teams' do
      @teams = Team.all
      if Helpers.logged_in?(session)
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
      @team = Team.create(name: params[:name],chaser: params[:chaser],beater: params[:beater],keeper: params[:keeper],seeker: params[:seeker], user_id: session[:user_id])
      @team.user = Helpers.current_user(session)
      @team.save
      redirect '/teams'
  end
  
  get '/teams/:id' do
    if Helpers.logged_in?(session)
      @team = Team.find_by(id: params[:id])
      erb :'teams/show_team'
    else
      redirect to '/login'
    end
  end


  get '/teams/:id/edit' do 
      if Helpers.logged_in?(session) 
        @team = Team.find_by(id: params[:id])
          erb :'teams/edit_team'
      else
          redirect '/login'
      end
  end

  patch '/teams/:id' do
    @team = Team.find_by(id: params[:id])
    if Helpers.current_user(session) == @team.user
      @team.update(params[:team])
      @team.save
        redirect to "/teams/#{@team.id}"
    else
        erb :'/teams/team_error'
    end
  end

  delete '/teams/:id/delete' do
    @team = Team.find_by(id: params[:id])
    if Helpers.current_user(session) == @team.user
          @team.delete
          redirect '/teams'
    else
       erb :'/teams/team_error'
    end
  end
  
  post '/teams/:id' do
    @team = Team.find_by(params[:username])
    @team.save
    redirect to "teams/#{@team.id}"
  end

end