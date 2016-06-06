class ChangeDateTypeForContacts < ActiveRecord::Migration
  def self.up
    change_table :contacts do |t|
      t.change :date, :string
    end
  end
  def self.down
    change_table :contacts do |t|
      t.change :date, :string
    end
  end
end
