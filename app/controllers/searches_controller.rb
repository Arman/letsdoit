class SearchesController < ApplicationController

  def new
    @subtitle = "Search"
    @activities ||= find_activities
    #@json = @activities.to_gmaps4rails
  end

  private

  def find_activities
    
    if !params[:search_near].blank? && !params[:category_id].blank?
      Activity.contains_keyword(params[:search_for]).in_category(params[:category_id]).near_location(params[:search_near])
    elsif !params[:category_id].blank?
      Activity.contains_keyword(params[:search_for]).in_category(params[:category_id])
    elsif !params[:search_near].blank?
      Activity.contains_keyword(params[:search_for]).near_location(params[:search_near])
    else 
      Activity.contains_keyword(params[:search_for]).in_category(params[:category_id])
    end
  end

end
