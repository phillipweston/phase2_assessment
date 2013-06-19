class Route < ActiveRecord::Base
	has_many :trips
	has_many :users, :through => :trips

  # Remember to create a migration!
end
