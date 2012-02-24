class Category < ActiveRecord::Base
	
	has_many :venues_categories
  has_many :venues, :through => :venues_categories

  has_many :activities

end
