class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
  		t.string :name, null:false
  		t.integer :user_id
  		t.integer :count, default: 0
  		t.timestamps
  	end
  end
end  