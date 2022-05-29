require 'sinatra'
require 'json'
require 'pg'


get '/cakes.json' do
  arr_cakes = []
  # Connecting to the database "cakes"
  connection = PG.connect :dbname => 'cakes', :user => 'postgres'
  # Reading from the database into s_cakes
  s_cakes = connection.exec 'SELECT * FROM cakes'
  # Pushing data from cakes db into arr_cakes
  s_cakes.each do |cake|
    arr_cakes.push({ id: cake['cake_id'], name: cake['cake_name'] })
  end
  arr_cakes.to_json
end

# Index page to show all of the cakes
get '/' do
  erb :index
end
