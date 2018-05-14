class CreateLands < ActiveRecord::Migration[5.1]
  def change
    create_table :lands do |t|
      t.references :user, foreign_key: true
      t.text :description
      t.integer :price
      t.integer :surface
      t.text :address

      t.timestamps
    end
  end
end
