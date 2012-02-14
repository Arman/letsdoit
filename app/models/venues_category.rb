class VenuesCategory < ActiveRecord::Base
	attr_accessible :category_id, :venue_id

  belongs_to :category
  belongs_to :venue

  default_scope order('name ASC')

end