class Activity < ActiveRecord::Base

	belongs_to :organizer, :class_name => 'User'

	belongs_to :venue

	belongs_to :category

end
