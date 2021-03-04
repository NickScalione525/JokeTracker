class UserController < ApplicationController

    #  get /users/new
    get '/users/signup' do 
        erb :'/users/signup'
    end

    post '/users/signup' do 
      @user = User.create(username: params[:username], password: params[:password])
      redirect to "/users/#{@user.id}"
    end

    get '/users/:id' do
        @user = User.find(params[:id])
    end

end