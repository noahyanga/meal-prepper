class MealController < ApplicationController
  def index
    @meals = Meal.all.limit(10) 
    @top_meals = Meal.order(created_at: :desc).limit(5)
  end

  def show
    @meal = Meal.find(params[:id])
  end
end
