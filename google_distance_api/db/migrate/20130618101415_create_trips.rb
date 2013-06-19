class CreateTrips < ActiveRecord::Migration
  def change
  	create_table :trips do |t|
      t.references :route
  		t.references :user
  		t.integer	:times, default: 0
  		t.timestamps
  	end
  end
end
