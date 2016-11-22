class AddConfirmationToContacts < ActiveRecord::Migration
  def change
    add_column :contacts, :confirmed, :string
    add_column :parties, :confirmed, :string
  end
end
