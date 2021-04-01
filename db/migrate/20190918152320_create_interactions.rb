class CreateInteractions < ActiveRecord::Migration[5.2]
  def change
    create_table :interactions do |t|
      t.integer :friend_id
      t.integer :user_id
      t.datetime :date
      t.text :note
      t.string :category

      t.timestamps
    end
  end
end
