class CreateProficiencies < ActiveRecord::Migration
  def change
  	create_table :proficiencies  do |t|
  		t.integer		:user_id, 	:null => false
  		t.integer		:skill_id,	:null => false
  		t.integer		:score,		:default => 0
  	end
  end
end
