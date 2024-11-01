class MealsController < ApplicationController
  def index
    @meals = Meal.all.limit(10) 
    @top_meals = Meal.order(created_at: :desc).limit(5)
  end

  def show
    @meal = Meal.find(params[:id])
  end

  def search
    Rails.logger.debug("Search parameters: #{params[:query]}")
    wildcard_search = "%#{params[:query]}%"
    @meals = Meal.where("name LIKE ?", wildcard_search)
    
    render :search
  end
end
