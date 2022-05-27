require 'sinatra'
require 'json'
require 'pg'


get '/' do
  arr_cakes = []

  begin
    # Connecting to database
    connection = PG.connect :dbname => 'cakes', :user => 'postgres'
    arr_cakes = connection.exec 'SELECT * FROM cakes'
  end

  erb :index
end
