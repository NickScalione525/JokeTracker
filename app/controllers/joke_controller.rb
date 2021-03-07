class JokeController < ApplicationController

    get '/jokes' do
        @jokes = Joke.all
        erb :'/jokes/index'
    end

    get '/jokes/new' do
        erb :'/jokes/new'
    end

post '/jokes' do
    joke = Joke.create(title: params[:title], genre: params[:genre], punchline: params[:punchline], characters: params[:characters], setting: params[:setting])   
    user = User.find_by(id: session[:user_id])
    user.jokes << joke
    redirect to "jokes/#{joke.id}"

end

get '/jokes/:id' do
    @joke = Joke.find_by(id: params[:id])
    erb :'/jokes/show'
end


get '/jokes/:id/edit' do
    @joke = Joke.find_by(id: params[:id])  
    erb :'/jokes/edit'
end

patch '/jokes/:id' do
    @joke = Joke.find(params[:id])
    @joke.update(title: params[:title], genre: params[:genre], punchline: params[:punchline], characters: params[:characters], setting: params[:setting])
    erb :'jokes/show'
end

delete '/jokes/:id/delete' do
    if logged_in?
      @joke = Joke.find_by_id(params[:id])
      if @joke && @joke.user == current_user
        @joke.delete
      end
      redirect to '/jokes'
    else
      redirect to '/login'
    end
  end
end