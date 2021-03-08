class JokeController < ApplicationController

    get '/jokes' do
      redirect_if_not_logged_in
        @jokes = Joke.all
        erb :'/jokes/index'
    end

    get '/jokes/new' do
      redirect_if_not_logged_in
        erb :'/jokes/new'
    end

post '/jokes' do
    joke = Joke.create(title: params[:title], genre: params[:genre], punchline: params[:punchline], characters: params[:characters], setting: params[:setting])   
    user = User.find_by(id: session[:user_id])
    user.jokes << joke
    redirect to "jokes/#{joke.id}"

end

get '/jokes/:id' do
  redirect_if_not_logged_in
    @joke = Joke.find_by(id: params[:id])
    erb :'/jokes/show'
end


get '/jokes/:id/edit' do
  redirect_if_not_logged_in
    @joke = Joke.find_by(id: params[:id])  
     if !@joke || @joke.user_id != session[:user_id]
      redirect to '/jokes'
     end
    erb :'/jokes/edit'
end

patch '/jokes/:id' do
  redirect_if_not_logged_in
    @joke = Joke.find_by(id: params[:id])
    if @joke.user_id == session[:user_id]
    @joke.update(title: params[:title], genre: params[:genre], punchline: params[:punchline], characters: params[:characters], setting: params[:setting])
    end
    erb :'jokes/show'
end

delete '/jokes/:id' do
  redirect_if_not_logged_in
    @joke = Joke.find_by(id: params[:id])
    if @joke.user_id == session[:user_id]
      @joke.delete
      redirect('/jokes')
    else
      erb :'jokes/show'
    end
  end
end