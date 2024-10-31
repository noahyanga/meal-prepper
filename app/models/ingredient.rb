class Ingredient < ApplicationRecord
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients
  
  has_many :store_ingredients 
  has_many :stores, through: :store_ingredients 


  validates :name, presence: true, uniqueness: true
  validates :measurement_unit, presence: true
end
