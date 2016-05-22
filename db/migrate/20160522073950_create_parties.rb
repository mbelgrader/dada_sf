class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.integer :guests
      t.date :date
      t.time :time
      t.string :size
      t.text :info

      t.timestamps null: false
    end
  end
end
