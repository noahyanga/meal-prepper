class MealController < ApplicationController
  def index
     @meals = Meal.all.limit(10) 
  end

  def show
  end
end
