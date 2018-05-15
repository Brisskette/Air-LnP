class AddTitleToLands < ActiveRecord::Migration[5.1]
  def change
    add_column :lands, :title, :string
  end
end
