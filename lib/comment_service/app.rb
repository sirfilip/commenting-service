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

      begin
      json_input = JSON.parse(request.body.read)

      application_name = json_input.fetch('name', nil)
      application = Application.new(:name => application_name) 
      application.save
      respond_with({:success => true, :data => {:name => application.name, :token => application.token}})
      rescue Sequel::ValidationFailed => e
        respond_with({:success => false, :data => {:errors => e.message}})
      rescue JSON::ParserError => e
        respond_with({:success => false, :data => {:errors => e.message}})
      end
    end
  end

end



