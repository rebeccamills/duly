class CreateCount < ActiveRecord::Migration
  def change
  create_table :count do |t|
  		t.string :name, null:false
  		t.integer :url_id
  	end
  end
end
