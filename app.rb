require 'sinatra'

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
    if (index.between?(1,9)==true) then line.insert(0, "&nbsp&nbsp") end
    if (index.between?(10,99)==true) then line.insert(0, "&nbsp") end
  end

  # Replace /n with br/ so newline visible on webpage
  lines.to_s.gsub('\n', '<br/>')
  lines.join("<br/>")

end