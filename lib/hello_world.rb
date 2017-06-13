require 'sinatra'

set :port, 4000
get '/' do
  'Hello World!'
end

get '/set' do
  @somekey = params[:somekey]
end
