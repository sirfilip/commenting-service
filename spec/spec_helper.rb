require 'bundler'
Bundler.require 

require 'minitest/autorun'
require 'rack/test'
require 'json'

require 'yaml'
config = YAML.load(File.read(File.expand_path('../../config.yaml', __FILE__)))

Sequel.connect(config['database']['test'])
