require 'sinatra'
require 'sinatra/activerecord'
require './models'

set :database_file, Dir.pwd+"/config/database.yml"

get '/' do
  @cakes = Cake.all
  erb :index
end

get '/new' do
  erb :new
end

get '/show/:id' do
  id = params[:id]
  @cake = Cake.find(id)
  erb :show
end

get '/edit/:id' do
  id = params[:id]
  @cake = Cake.find(id)
  erb :edit
end

post '/new' do
  cake_name = params[:name]
  Cake.create({cake_name: cake_name})
  redirect '/'
end

put '/edit/:id' do
  id = params[:id]
  @cake = Cake.find(id)
  Cake.update(id, cake_name: params[:cakename])
  redirect '/'
end

delete '/show/:id' do
  id = params[:id]
  @cake = Cake.find(id)
  @cake.destroy
  redirect '/'
end