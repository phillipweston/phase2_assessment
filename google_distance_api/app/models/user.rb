class User < ActiveRecord::Base
	has_many :trips
	has_many :routes, :through => :trips
	
	has_secure_password
  #TODO : Use bcrypt to store hashed passwords and authenticate users
end
