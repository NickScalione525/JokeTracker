class UserController < ApplicationController

    #  get /users/new
    get '/users/signup' do 
        if session[:user_id]
            redirect "/users/#{session[:user_id]}"
        end
        erb :'/users/signup'
    end

    post '/users/signup' do 
      user = User.create(
          username: params[:username], 
          password: params[:password]
        )
        if user.id
        session[:user_id] = user.id
        redirect to "/users/#{user.id}"
        else
            erb :'/users/signup'
end
end

    get '/users/login' do
     erb :'/users/login'
    end

    post '/users/login' do
        user = User.find_by(username: params[:username])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect to "/users/#{user.id}"
        else
            redirect to "/users/login"
    end
end

    get '/users/:id' do
        @user = User.find_by(id: params[:id])
        erb :'/users/show'
    end


    get '/users/logout' do
        session.clear
        redirect to '/users/login   '
    end
    
 

end