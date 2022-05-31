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

# Creating cake with attribute name given HTTP request with JSON body
post '/' do
  body = JSON.parse(request.body.read)
  arr_cakes.push({id: body["id"], name: body["name"]})
  # Kind of funky I know, will look into better ways of doing this... (Inserting into database)
  connection.exec("INSERT INTO cakes VALUES (" + "\'" + body["id"] + "\'" + ", " + "\'" +body["name"]+"\'"+ ");")
  arr_cakes.to_json
end

# Creating route to update cake based off of id given HTTP request with JSON body
put '/cakes/:id' do
  # Param passed into URL
  cakeid = params["id"]
  body = JSON.parse(request.body.read)
  cake_to_edit = ""
  arr_cakes.each { |cake| cake_to_edit = cake if cakeid == cake[:id] }
  cake_to_edit[:id] = body["id"]
  cake_to_edit[:name] = body["name"]
  # Updating database from postgres
  connection.exec("UPDATE cakes SET cake_name = " +"\'"+ body["name"] +"\'"+ " WHERE cake_id = " + "\'"+cakeid+"\';")
  connection.exec("UPDATE cakes SET cake_id = " +"\'"+ body["id"] +"\'"+ " WHERE cake_id = " + "\'"+cakeid+"\';")
  cake_to_edit.to_json
end