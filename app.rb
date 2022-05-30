require 'sinatra'
require 'json'
require 'pg'


arr_cakes = []
# Connecting to the database "cakes"
connection = PG.connect :dbname => 'cakes', :user => 'postgres'
# Reading from the database into s_cakes
s_cakes = connection.exec 'SELECT * FROM cakes'
# Pushing data from cakes db into arr_cakes
s_cakes.each do |cake|
  arr_cakes.push({ id: cake['cake_id'], name: cake['cake_name'] })
end

# Index page to show all of the cakes
get '/' do
  arr_cakes.to_json
end

# Showing cake based off of cake's id
get '/cakes/:id' do
  cakeid = params["id"]
  cake_to_show = ""
  arr_cakes.each { |cake| cake_to_show = cake if cakeid == cake[:id] }
  cake_to_show.to_s
end

# Creating cake with attribute name
post '/create' do
  
end