class TeamController < ApplicationController
    
    get '/teams' do
        if Helpers.logged_in?(session)
          @teams = Team.all
          erb :'teams/teams_index'
        else
          redirect to '/login'
        end
    end
    
end