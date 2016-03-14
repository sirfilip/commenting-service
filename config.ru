require 'bundler'
Bundler.require

require 'yaml'

config = YAML.load(File.read(File.expand_path('../config.yaml', __FILE__)))
Sequel.connect(config['database']['dev'])

require File.expand_path('../lib/comment_service/app', __FILE__)

run CommentService::App.new
