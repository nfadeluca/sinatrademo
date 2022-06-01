require 'sinatra'

configure :development do
  set :database, 'sqlite3:db/development.db'
end