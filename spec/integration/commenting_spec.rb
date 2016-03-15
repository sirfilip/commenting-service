require 'spec_helper' 

describe '/comments' do 

  it 'requires application token and entity id' do 
    skip
    get('/comments') do |res|
      res.wont_be :success?
      res["errors"].must_equal "Missing application token param missing or invalid"
    end
  end


end
