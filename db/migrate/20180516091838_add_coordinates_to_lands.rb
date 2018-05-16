class AddCoordinatesToLands < ActiveRecord::Migration[5.1]
  def change
    add_column :lands, :latitude, :float
    add_column :lands, :longitude, :float
  end
end
