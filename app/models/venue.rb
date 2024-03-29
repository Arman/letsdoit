class Venue < ActiveRecord::Base
  attr_accessible :name, :description, :address_line_1, :address_line_2, :city, :state, :latitude, :longitude, :category_ids
  # :phone, :url, 

  acts_as_gmappable :process_geocoding => false, :lat => "latitude", :lng => "longitude" 

  geocoded_by :full_address
  after_validation :geocode, :if => :address_line_1_changed?

  # belongs_to :created_by, :class_name => "User", :foreign_key => 
  #                    "created_by"

=begin
  has_many :reviews
  accepts_nested_attributes_for :reviews
  
  has_many :reviewers, :through => :reviews
=end


  has_many :venues_categories
  has_many :categories, :through => :venues_categories
  accepts_nested_attributes_for :venues_categories

  has_many :activities
                  
  validates :name,  :presence => true,
                    :length   => { :maximum => 150 }
                                    
  # validates :created_by,  :presence => true

  # equivalent of the method below
  #scope :contains_keyword, lambda {|keyword| where("name like ? OR description like ?", "%#{keyword}%", "%#{keyword}%") unless keyword.blank? }

  def self.contains_keyword(keyword)
    if keyword.empty? || keyword.blank?
      scoped
    else
      where("name like ? OR description like ?", "%#{keyword}%", "%#{keyword}%")
    end
  end

  def self.in_category(category_id)
    if category_id.empty? || category_id.blank?
      scoped
    else
      joins(:categories).where("categories.id = ?", category_id)
    end
  end

  def self.near_location(location)
    if location.empty? || location.blank?
      scoped
    else
      near(location, 50, :order => :distance)
    end
  end

  def full_address
    "#{self.address_line_1}, #{self.address_line_2}, #{self.city}, #{self.state}"
  end

  def gmaps4rails_address
    #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
     "#{self.address_line_1}, #{self.address_line_2}, #{self.city}, #{self.state}"
  end
  
  def gmaps4rails_infowindow
    # add here whatever html content you desire, it will be displayed when users clicks on the marker
    "#{self.name}" 
  end

=begin
  def avg_score
    !self.reviews.blank? ? (self.reviews.average(:score).round(1)): 0
  end
=end
                   

end
