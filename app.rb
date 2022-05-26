require 'sinatra'
require 'json'

# Reading contents from file into array
def read_file(file)
  file = File.open(file, "r")
  contents = file.readlines
  file.close
  contents
end

# Creating json file from cake.list
get '/cakes.json' do
  # Lines is only array with just the cake names
  lines = read_file("cake.list")
  lines.map!{|x| x.chomp }.to_json
end

# Creating index route
get '/' do
  erb :index
end
