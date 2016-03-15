require 'spec_helper'

describe "/applications" do 

  it "creates new app if params are valid" do 
    post("/applications", {:name => 'test app'}) do |res|
      res.must_be :success?
      res["name"].must_equal "test app"
      res["token"].wont_be_nil
    end
  end

  it 'does not create new app if the params are invalid' do 
    post("/applications", Hash.new) do |res|
      res.wont_be :success?
      res["errors"].must_equal "name param is missing"
    end
  end


end
