class SearchesController < ApplicationController

  def new
    @subtitle = "Search"
    @activities ||= find_activities
    #@json = @activities.to_gmaps4rails
  end

  private

  def find_activities
    
    if !params[:search_near].blank? && !params[:category_id].blank?
      @case = "Case 1"
      Activity.contains_keyword(params[:search_for]).in_category(params[:category_id]).near_location(params[:search_near])
    elsif !params[:category_id].blank?
      @case = "Case 2"
      Activity.contains_keyword(params[:search_for]).in_category(params[:category_id])
    elsif !params[:search_near].blank?
      @case = "Case 3"
      Activity.contains_keyword(params[:search_for]).near_location(params[:search_near]) 
    else 
      @case = "Case 4"
            #Activity.contains_keyword(params[:search_for]).in_category(params[:category_id])
      Activity.contains_keyword(params[:search_for]).near_location(params[:search_near])

    end
  end

end
