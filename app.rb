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

# Showind based off of cake's id
get '/cakes/:id' do
  cakeid = params["id"].to_s
  cake_to_show = ""
  arr_cakes.each {|cake|
    
  }
end