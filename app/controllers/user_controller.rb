class UserController < ApplicationController
    
    get '/' do
        erb :index
    end
    
    get '/signup' do
        if Helpers.logged_in?(session)
            redirect to '/teams'
        else
            erb :'users/user_signup'
        end
    end
    
    post '/signup' do
        user = User.create(username: params[:username], email: params[:email], password: params[:password])
        session[:user_id] = user.id
        if Helpers.logged_in?(session)
            redirect to '/users/user_index'
        else
            erb :'/users/signup_error'
        end
    end
    
    get '/login' do
        if Helpers.logged_in?(session)
          redirect to '/teams'
        else 
          erb :'/users/user_login'
        end
    end
    
    post '/login' do
        user = User.find_by(username: params[:username])

        if user && user.authenticate(params[:password])
          session[:user_id] = user.id
          redirect to '/teams'
        else
          erb :'/users/login_error'
        end
    end
    
    get '/users/:slug' do
        @user = User.find_by_slug(params[:slug])
        erb :'/users/user_index'
    end
    
    delete '/session' do
        session.clear
        redirect "/"
    end
    
end