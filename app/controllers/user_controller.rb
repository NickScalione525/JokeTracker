class UserController < ApplicationController

    #  get /users/new
    get '/users/signup' do 
        erb :'/users/signup'
    end


end