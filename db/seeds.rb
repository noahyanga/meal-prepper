# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

require 'csv'

# Clear previous data
Meal.destroy_all
Recipe.destroy_all
Ingredient.destroy_all
Store.destroy_all
RecipeIngredient.destroy_all
StoreIngredient.destroy_all

# hold created records
meals = []
recipes = []
ingredients = []
stores = []

CSV.foreach(Rails.root.join('db', 'meals.csv'), headers: true) do |row|
  meal = Meal.create!(
    name: row['name'],
    description: row['description']
  )
  meals << meal
end

CSV.foreach(Rails.root.join('db', 'ingredients.csv'), headers: true) do |row|
  ingredient = Ingredient.create!(
    name: row['name'],
    measurement_unit: row['measurement_unit']
  )
  ingredients << ingredient
end

CSV.foreach(Rails.root.join('db', 'recipes.csv'), headers: true) do |row|
  recipe = Recipe.create!(
    title: row['title'],
    instructions: row['instructions'],
    meal_id: row['meal_id']
  )
  recipes << recipe
end

CSV.foreach(Rails.root.join('db', 'stores.csv'), headers: true) do |row|
  store = Store.create!(
    name: row['name']
  )
  stores << store
end

CSV.foreach(Rails.root.join('db', 'recipe_ingredients.csv'), headers: true) do |row|
  recipe_id = row['recipe_id'].to_i
  ingredient_id = row['ingredient_id'].to_i

  if recipes.map(&:id).include?(recipe_id) && ingredients.map(&:id).include?(ingredient_id)
    RecipeIngredient.create!(
      recipe_id: recipe_id,
      ingredient_id: ingredient_id
    )
  end
end

CSV.foreach(Rails.root.join('db', 'store_ingredients.csv'), headers: true) do |row|
  store_id = row['store_id'].to_i
  ingredient_id = row['ingredient_id'].to_i

  if stores.map(&:id).include?(store_id) && ingredients.map(&:id).include?(ingredient_id)
    StoreIngredient.create!(
      store_id: store_id,
      ingredient_id: ingredient_id
    )
  end
end

puts "Database seeded successfully."

