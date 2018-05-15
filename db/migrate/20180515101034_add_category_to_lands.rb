class AddCategoryToLands < ActiveRecord::Migration[5.1]
  def change
    add_column :lands, :category, :string
  end
end
