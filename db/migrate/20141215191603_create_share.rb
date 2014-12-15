class CreateShare < ActiveRecord::Migration
  def change
  create_table :share do |t|
  		t.string :name, null:false
  		t.integer :user_id
  		t.integer :url_id
  	end
  end
end
