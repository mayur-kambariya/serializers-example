class CreateFriends < ActiveRecord::Migration[5.2]
  def change
    create_table :friends do |t|
      t.integer :user_id
      t.string :name
      t.string :pronouns
      t.text :appreciation
      t.boolean :starred, default: false

      t.timestamps
    end
  end
end
