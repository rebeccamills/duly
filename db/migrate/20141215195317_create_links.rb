class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
  		t.string :name
  		t.string :long_url, null: false
  		t.integer :user_id, null: false
  		t.integer :count, default: 0
  		t.timestamps
  	end
  end
end  