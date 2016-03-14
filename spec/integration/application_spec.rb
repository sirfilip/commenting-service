require 'spec_helper'

require 'comment_service/app'


describe "/applications" do 
  include Rack::Test::Methods

  def app
    CommentService::App.new 
  end

  it "creates new app if params are valid" do 
    post '/applications', {:name => 'test app'}.to_json, {"CONTENT_TYPE" => "application/json"}
    last_response.must_be :ok?
  end


end
