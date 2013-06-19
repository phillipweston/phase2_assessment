class Trip < ActiveRecord::Base
	belongs_to :route
	belongs_to :user

	
  # Remember to create a migration!
end
