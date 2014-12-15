class CreateUser < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :username, null: false
  		t.string :password, null: false
  		t.integer :url_id
  		t.integer :share_id
  		t.timestamps 
  	end
  end
end