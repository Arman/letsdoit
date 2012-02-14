class CreateVenuesCategories < ActiveRecord::Migration  
  def self.up
    create_table :venues_categories do |t|
      t.integer :category_id
      t.integer :venue_id
 
      t.timestamps
    end
  end
 
  def self.down
    drop_table :venues_categories
  end

end
