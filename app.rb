require 'sinatra'
require 'json'

# Reading contents from file into array
def read_file(file)
  file = File.open(file, "r")
  contents = file.readlines
  file.close
  contents
end

# get '/' do

#   lines = read_file("cake.list")
#   # Adding number of cake to front of each cake's name
#   lines.each.with_index(1) do |line, index|
#     line.insert(0, index.to_s+": ")
#     # Aligning all indices
#     line.insert(0, "&nbsp&nbsp") if (index.between?(1,9))
#     line.insert(0, "&nbsp") if (index.between?(10,99))
#   end

#   # Replace /n with br/ so newline visible on webpage
#   lines.to_s.gsub('\n', '<br/>')
#   lines.join("<br/>")

#   puts lines

# end



# Creating json file from cake.list
get '/cakes.json' do

  # Lines is only array with just the cake names
  lines = read_file("cake.list")
  new_lines = []
  lines.each {|line| new_lines.push(line.chomp)}


  # lines.each.with_index(1) do |line, index|
  #   line.insert(0, index.to_s+":\"")
  # end
  # lines.each.with_index do |line, index|
  #   if index == lines.length-1
  #     # Do nothing here
  #   else
  #     line.insert(-2, "\", ")
  #   end
  #   line.insert(-2, "\"") if index == lines.length-1
  # end
  # lines.insert(0, "{\n")
  # lines.push("}")
  # lines = lines.join("")
  # lines = lines.gsub("\n", "<br/>")

  lines.to_json
end

# Creating index route
get '/' do
  erb :index
end
