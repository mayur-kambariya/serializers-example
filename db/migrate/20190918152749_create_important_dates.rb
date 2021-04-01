class CreateImportantDates < ActiveRecord::Migration[5.2]
  def change
    create_table :important_dates do |t|
      t.string :name
      t.integer :user_id
      t.integer :friend_id
      t.datetime :date
      t.string :category
      t.boolean :reminder
      t.text :note

      t.timestamps
    end
  end
end
