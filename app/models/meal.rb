class Meal < ApplicationRecord
has_many :recipe, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
