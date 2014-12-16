class User < ActiveRecord::Base
  # We need these 2 lines to let SimpleAuthentication know that this
  # model is the one we want to authenticate in the database
  Sinatra::SimpleAuthentication.require_adapter
  include Sinatra::SimpleAuthentication::Models::ActiveRecord::Adapter
  has_many :links 
end

# class User < ActiveRecord::Base
	#attr_accessor :password

	#before_save :encrypt_password


	

	# def authenticate(password)
 #    	if BCrypt::Password.new(self.password) == password
 #      	return self
 #    	else
 #      	return nil
 #    	end
 # 	 end

 #  def encrypt_password
 #    if password.present?
 #      return self.password = BCrypt::Password.create(password)
 #    end
 #  end