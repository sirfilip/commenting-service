require 'bundler'
Bundler.require(:default, :test) 

require 'minitest/autorun'
require 'httparty'
require 'json'

require 'yaml'
config = YAML.load(File.read(File.expand_path('../../config.yaml', __FILE__)))

Sequel.connect(config['database']['test'])

class ApiResponse
  def initialize(response)
    @response = response
  end

  def success?
    @response.parsed_response["success"]
  end

  def [](param) 
    @response.parsed_response["data"][param]  
  end
end

class Minitest::Test

  BASE_URI = 'http://localhost:9393'

  def post(path, data={})
    response = HTTParty.post("#{BASE_URI}/#{path}", :body => data.to_json, :headers => {"Content-type" => "application/json"})
    yield ApiResponse.new(response) if block_given?
  end

  def get(path, data={}) 
    response = HTTParty.get("#{BASE_URI}/#{path}", :query => data, :headers => {"Content-type" => "application/json"})
    yield ApiResponse.new(response) if block_given?
  end

end
