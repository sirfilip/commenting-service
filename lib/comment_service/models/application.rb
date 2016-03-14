require 'securerandom'

class Application < Sequel::Model 
  plugin :validation_helpers
  plugin :instance_hooks

  def before_validation
    self.token = SecureRandom.urlsafe_base64 if self.token.to_s.empty?
  end


  def validate
    super
    validates_presence [:name, :token]
    validates_unique :token
  end

end
