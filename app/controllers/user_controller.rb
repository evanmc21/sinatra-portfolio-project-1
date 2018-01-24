class UserController < ApplicationController
    
    get '/' do
        erb :index
    end
    
    get '/login' do
        erb :'users/user_login'
    end
    
    get '/signup' do
       erb :'users/user_signup' 
    end
    
end