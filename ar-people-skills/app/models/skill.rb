class Skill < ActiveRecord::Base
	has_many :proficiencies
	has_many :users, :through => :proficiencies

	validates :name, :uniqueness => true

  def user_with_proficiency(score)
		user_id = Proficiency.where('skill_id = ? AND score = ?', self.id, score).first.user_id
		User.find(user_id)
  end

end
