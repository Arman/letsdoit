class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.integer :access
      t.text :description
      t.string :address_line_1
      t.string :address_line_2
      t.string :city
      t.string :state
      t.string :zip_code
      t.float :latitude
      t.float :longitude
      t.timestamps
    end
  end
end
