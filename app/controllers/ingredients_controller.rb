class IngredientsController < ApplicationController
  def index
    @ingredient = Ingredient.all
    @top_ingredients = Ingredient.order(created_at: :desc).limit(5)
  end

  def show
  end
end
