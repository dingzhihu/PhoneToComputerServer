#!/usr/bin/env ruby -w

require 'sinatra'
require 'haml'

get "/uploadfile" do
  haml :uploadfile
end


post "/uploadfile" do
  p params

  File.open('uploads/' + params['myfile'][:filename], 'w') do |f|
    f.write(params['myfile'][:tempfile].read)
  end
  return "the file was successfully uploaded!"
end

post "/uploadtext" do
  p params

  timestamp = Time.now.to_i
  File.open('uploads/' + "#{timestamp}.txt", 'w') do |f|
    f.write(params['text'])
  end
  return 'text was successfully uploaded!'
  
end
