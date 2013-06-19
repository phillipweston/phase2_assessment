class Event < ActiveRecord::Base
	# a. The events date is empty, in the past, or is not valid.
	# b. The events title is already taken or empty.
	# c. The event organizers name is empty.
	# d. The event organizers email address is invalid.

	# t.string :organizer_name, :organizer_email, :title
  # t.date :date

	validates :date, :title, :organizer_name, :presence => true
	validates :title, :uniqueness => true

	validates :organizer_email, :format => { :with => /\w+@\w+\.[a-zA-Z]{2,3}/,
		:message => "must be valid" }

	after_validation :date_in_future?

	def date_in_future?
		return false if self.date.nil?
		if self.date < Date.today
			errors.add(:date, "must be in the future.")
			return false
		end
	end

end
