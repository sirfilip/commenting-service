require 'bundler'
Bundler.require(:default, :test) 

require 'minitest/autorun'
require 'httparty'
require 'json'

require 'yaml'
config = YAML.load(File.read(File.expand_path('../../config.yaml', __FILE__)))

Sequel.connect(config['database']['test'])

class Minitest::Test

  BASE_URI = 'http://localhost:9292'

  def post(path, data)
    response = HTTParty.post("#{BASE_URI}/#{path}", :body => data.to_json, :headers => {"Content-type" => "application/json"})
    response.parsed_response
  end

end
