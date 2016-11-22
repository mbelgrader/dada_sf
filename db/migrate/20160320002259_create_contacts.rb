class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.integer :guests
      t.date :date
      t.time :time

      t.timestamps null: false
    end
  end
end
