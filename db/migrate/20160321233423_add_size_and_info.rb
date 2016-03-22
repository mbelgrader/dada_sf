class AddSizeAndInfo < ActiveRecord::Migration
  def change
    add_column :contacts, :size, :string
    add_column :contacts, :info, :text
  end
end
