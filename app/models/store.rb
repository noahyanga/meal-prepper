class Store < ApplicationRecord
  has_many :store_ingredients
  has_many :ingredient, through: :store_ingredients

  validates :name, presence: true, uniqueness: true
end
