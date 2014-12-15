class CreateUrl < ActiveRecord::Migration
  def change
    create_table :url do |t|
  		t.string :name, null:false
  		t.integer :user_id
  		t.integer :count_id
  		t.integer :share_id
  	end
  end
end  