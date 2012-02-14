class Category < ActiveRecord::Base
	
  has_many :venues, :through => :venues_categories

end
