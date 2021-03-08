require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'laugher'
  end

  register Sinatra::Flash


  get "/" do
    erb :welcome
  end


  helpers do
    
  def current_user
    user = User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def joke_belongs_to_current_user
    @joke && @joke.user_id == current_user.id
  end

  def logged_in?
    !!current_user
  end
  def redirect_if_not_logged_in
    redirect to '/login' unless current_user
end
end
end
