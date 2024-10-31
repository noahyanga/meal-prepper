class Ingredient < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :measurement_unit, presence: true
end
