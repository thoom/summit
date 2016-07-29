require 'sinatra'
require 'json'

helpers do
  def json(*args)
    headers 'Content-Type' => 'application/json'
    hash = args.length == 1 ? args.shift : args
    if hash
      body hash.to_json
    else
      body {}.to_json
    end
  end
end

get '/*', provides: 'json' do
  json salutation: 'Hello', instruction: 'Mount your app file to /app'
end

get '/*' do
  'Hello. Mount your app file to /app'
end
