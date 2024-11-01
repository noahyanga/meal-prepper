class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
    @top_recipes = Recipe.order(created_at: :desc).limit(5)
  end

  def show
  end
end
