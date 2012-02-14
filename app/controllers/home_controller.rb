class HomeController < ApplicationController
   
  def index
    
    @subtitle = "Home"

    @top_categories = Category.all.sort! { |a,b| b.venues.size <=> a.venues.size }.take(6)

    @categories = Category.order(:name)

    @new_venues = Venue.order(:created_at).take(12)
  
  end

end
