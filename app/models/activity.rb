=begin 
  create_table "activities", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.integer  "venue_id"
    t.integer  "category_id"
    t.integer  "organizer_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end
=end 

class Activity < ActiveRecord::Base

 attr_accessible :name, :description, :starts_at, :ends_at, :venue_id, :category_id, :organizer_id
 

	belongs_to :organizer, :class_name => 'User'

	belongs_to :venue

	belongs_to :category

	validates :organizer_id,  :presence => true
	validates :venue_id,  :presence => true
	validates :category_id,  :presence => true


end
