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
  new_lines = []
  lines.each {|line| new_lines.push(line.chomp)}

  lines.to_json
end

# Creating index route
get '/' do
  erb :index
end
