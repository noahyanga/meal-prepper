class Recipe < ApplicationRecord
  belongs_to :meal, optional: true
  has_many :recipe_ingredients, dependent: :destroy
  has_many :ingredient, through: :recipe_ingredients

  validates :title, presence: true, uniqueness: true
  validates :instructions, presence: true
end
