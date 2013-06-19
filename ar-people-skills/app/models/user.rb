class User < ActiveRecord::Base
	has_many :proficiencies
	has_many :skills, :through => :proficiencies


	def proficiency_for(skill)
		Proficiency.where("user_id = ? AND skill_id = ?", self.id, skill.id)[0].score
	end

	def set_proficiency_for(skill, proficiency)
		user = Proficiency.where("user_id = ? AND skill_id = ?", self.id, skill.id)[0]
		user.score = proficiency
		user.save
	end

end
