require 'faker'
require 'csv'

CSV.open("meals.csv", "w") do |csv|
  csv << ["id", "name", "description"]
  10.times do |i|
    csv << [i + 1, Faker::Food.dish, Faker::Food.description]
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
  20.times do |i|
    csv << [i + 1, Faker::Food.dish, Faker::Lorem.paragraph, rand(1..10)]
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
    csv << [rand(1..20), rand(1..15)]
  end
end

CSV.open("store_ingredients.csv", "w") do |csv|
  csv << ["store_id", "ingredient_id"]
  20.times do
    csv << [rand(1..5), rand(1..15)]
  end
end

puts "CSV files generated successfully"