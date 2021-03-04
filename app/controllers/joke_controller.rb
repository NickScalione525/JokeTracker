class JokeController < ApplicationController


get '/jokes/new' do
erb :'/jokes/new'
end

post '/jokes' do
   @joke = Joke.create(title: params[:title], genre: params[:genre], punchline: params[:punchline], characters: params[:characters], setting: params[:setting])   

    redirect to "/jokes/#{@joke.id}"

end

get '/jokes/:id' do
    @joke = Joke.find(params[:id])
    erb :'/jokes/show'
end

get '/jokes' do
    @jokes = Joke.all
    erb :'/jokes/index'
end

get '/jokes/:id/edit' do
    @joke = Joke.find(params[:id])  
    erb :'/jokes/edit'
end

post '/jokes/:id' do
    @joke = Joke.find(params[:id])
    @joke.update(title: params[:title], genre: params[:genre], punchline: params[:punchline], characters: params[:characters], setting: params[:setting])
    redirect to "/jokes/#{@joke.id}"
end

delete '/jokes/:id' do
    @joke = Joke.find(params[:id])
    @joke.destroy
    redirect '/jokes'
end

end