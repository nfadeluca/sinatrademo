require 'sinatra'

configure :development do
  set :database, 'sqlite3:db/cakes.db'
end