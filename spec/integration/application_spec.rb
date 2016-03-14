require 'spec_helper'

require 'comment_service/app'


describe "/applications" do 

  it "creates new app if params are valid" do 
    response = post("/applications", {:name => 'test app'})
    response["success"].must_equal true
    response["data"]["name"].must_equal "test app"
    response["data"]["token"].wont_be_nil
  end


end
