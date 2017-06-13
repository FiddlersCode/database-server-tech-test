ENV['RACK_ENV'] = 'test'

require 'hello_world'
require 'rspec'
require 'rack/test'

describe 'The HelloWorld App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'says hello' do
    get '/'
    expect(last_response.status).to eq(200)
    expect(last_response.body).to eq('Hello World!')
  end

  it 'has a set route' do
    get '/set' do
      expect(last_response.status).to eq(200)
    end
  end

  it 'can store params' do
    get '/set', :somekey => "taco" do
      expect(last_response.body).to include("taco")
    end
  end

  it 'can retrieve params' do
    get '/set', :somekey => "taco" do
      get '/get', :key => "somekey"
      expect(last_response.body).to include("taco")
      p last_response.body
    end
  end

end
