class AddFacilityToLands < ActiveRecord::Migration[5.1]
  def change
    add_column :lands, :facility, :string
  end
end
