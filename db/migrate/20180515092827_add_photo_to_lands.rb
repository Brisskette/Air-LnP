class AddPhotoToLands < ActiveRecord::Migration[5.1]
  def change
    add_column :lands, :photo, :string
  end
end
