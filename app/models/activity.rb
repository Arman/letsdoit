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


def self.contains_keyword(keyword)
    if keyword.empty? || keyword.blank?
      scoped
    else
      where("activities.name like ? OR activities.description like ?", "%#{keyword}%", "%#{keyword}%")
    end
  end

  def self.in_category(category_id)
    if category_id.empty? || category_id.blank?
      scoped
    else
      joins(:category).where("categories.id = ?", category_id)
    end
  end

scope :near_location, lambda { |location| joins(:venues) & Venue.near(location, 50, :order => :distance) unless location.blank? }

scope :by_keyword, lambda { |keyword| where(:name => keyword) unless keyword.blank? }

=begin

scope :near_location, lambda {
    joins(:venues) & Venue.near(lambda, 50, :order => :distance)
  }

def self.near_location(location)
    if location.empty? || location.blank? 
      scoped
    else
      Venue.near(location, 50, :order => :distance)
    end
  end
=end

end
