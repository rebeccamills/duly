class CreateEntries < ActiveRecord::Migration
  def change
    create_table :entries do |t|
      t.string :author
      t.string :string
      t.string :photo_url
      t.string :string
      t.string :date_taken
      t.string :date

      t.timestamps null: false
    end
  end
end
