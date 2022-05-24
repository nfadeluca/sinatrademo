require 'sinatra'
require 'json'

# Reading contents from file into array
def read_file(file)
  file = File.open(file, "r")
  contents = file.readlines
  file.close
  contents
end

get '/' do

  lines = read_file("cake.list")
  # Adding number of cake to front of each cake's name
  lines.each.with_index(1) do |line, index|
    line.insert(0, index.to_s+": ")
    # Aligning all indices
    line.insert(0, "&nbsp&nbsp") if (index.between?(1,9))
    line.insert(0, "&nbsp") if (index.between?(10,99))
  end

  # Replace /n with br/ so newline visible on webpage
  lines.to_s.gsub('\n', '<br/>')
  lines.join("<br/>")

  puts lines

end



# Creating json file from cake.list
get '/cakes.json' do
  lines = read_file("cake.list")
  lines.each.with_index(1) do |line, index|
    # Aligning all indices
    line.insert(0, "{\"name\":\"")
  end
  lines.each.with_index(1) do |line, index|
    line.insert(-2, "\"}")
  end
  
  contents = JSON.parse(lines.to_s)
end

get '/index' do
  erb :index
end
