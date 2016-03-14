require File.expand_path('../models/application', __FILE__)
require File.expand_path('../models/comment', __FILE__)

module CommentService

  class App < Sinatra::Base

    helpers do 
      def respond_with(data)
        content_type :json
        [JSON.generate(data)]
      end
    end

    post '/applications' do 
      content_type :json

      json_input = JSON.parse(request.body.read)
      application_name = json_input['name']
      application = Application.new 
      application.name = application_name
      if application.save
        respond_with({:success => true, :data => {:name => application.name, :token => application.token}})
      else
        respond_with({:success => false, :data => {:errors => application.errors}})
      end
    end
  end

end



