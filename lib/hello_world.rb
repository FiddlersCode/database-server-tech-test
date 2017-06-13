require 'sinatra'
enable :sessions
set :port, 4000
get '/' do
  'Hello World!'
end

get '/set' do
  session[:somekey] = params[:somekey]
end

get '/get' do
  @key = session[:somekey]
end
