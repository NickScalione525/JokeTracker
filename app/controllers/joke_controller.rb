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
    @joke = Joke.find_by(id: params[:id])
    if @joke.user_id == session[:user_id]
    @joke.update(title: params[:title], genre: params[:genre], punchline: params[:punchline], characters: params[:characters], setting: params[:setting])
    end
    erb :'jokes/show'
end

delete '/jokes/:id' do
    @joke = Joke.find_by(id: params[:id])
    if @joke.user_id == session[:user_id]
      @joke.delete
      redirect('/jokes')
    else
      erb :'jokes/show'
    end
  end
end