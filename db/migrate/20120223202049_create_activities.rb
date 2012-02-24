class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.datetime :starts_at
      t.datetime :ends_at
      t.integer :venue_id
      t.integer :category_id
      t.integer :organizer_id

      t.timestamps
    end
  end
end
