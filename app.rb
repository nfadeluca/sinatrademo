require 'sinatra'

# Reading contents from file into array
def read_file(file)
  file = File.open(file, "r")
  contents = file.readlines
  file.close
  return contents
end

x = read_file("cake.list")

# Adding number of cake to front of each cake's name
num = 1
x.each { 
  |x|
  x.insert(0, num.to_s+": ")
  num+=1
}

get '/' do
  # Replace /n with br/ so newline visible on webpage
  x.to_s.gsub('\n', '<br/>')
  x.join("<br/>")
end