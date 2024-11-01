class HomeController < ApplicationController
  def index
    @meals = Meal.limit(10) 
    @ingredients = Ingredient.limit(10)
  end
end
