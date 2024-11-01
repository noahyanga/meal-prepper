require 'faker'
require 'csv'
require 'set'  

# Generate meals
meals = []
unique_meals = Set.new
CSV.open("meals.csv", "w") do |csv|
  csv << ["id", "name", "description"]

  while meals.size < 10
    meal_name = Faker::Food.dish
    meal_description = Faker::Food.description

    # Ensure uniqueness 
    unless unique_meals.include?("#{meal_name} - #{meal_description}")
      unique_meals.add("#{meal_name} - #{meal_description}")
      meals << { id: meals.size + 1, name: meal_name, description: meal_description }
      csv << [meals.size, meal_name, meal_description]
    end
  end
end

CSV.open("ingredients.csv", "w") do |csv|
  csv << ["id", "name", "measurement_unit"]
  15.times do |i|
    csv << [i + 1, Faker::Food.ingredient, Faker::Food.metric_measurement]
  end
end

CSV.open("recipes.csv", "w") do |csv|
  csv << ["id", "title", "instructions", "meal_id"]
  unique_titles = []

  20.times do |i|
    title = Faker::Food.dish
    # Ensure uniqueness for recipe titles
    while unique_titles.include?(title)
      title = Faker::Food.dish
    end
    unique_titles << title

    instructions = [
      "Preheat the oven to 350 degrees.",
      "Mix the ingredients in a bowl.",
      "Bake for 30 minutes or until golden.",
      "Let cool before serving.",
      "Garnish with fresh herbs."
    ].sample(3).join(" ")

    meal_id = rand(1..10) 
    csv << [i + 1, title, instructions, meal_id]
  end
end

CSV.open("stores.csv", "w") do |csv|
  csv << ["id", "name"]
  5.times do |i|
    csv << [i + 1, Faker::Company.name]
  end
end

CSV.open("recipe_ingredients.csv", "w") do |csv|
  csv << ["recipe_id", "ingredient_id"]
  20.times do
    csv << [rand(1..20), rand(1..15)]  # 20 recipes and 15 ingredients
  end
end

CSV.open("store_ingredients.csv", "w") do |csv|
  csv << ["store_id", "ingredient_id"]
  20.times do
    csv << [rand(1..5), rand(1..15)]  # 5 stores and 15 ingredients
  end
end

puts "CSV files generated successfully"
