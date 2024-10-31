class Recipe < ApplicationRecord
  validates: title, presence: true, uniqueness: true
  validates: instructions, presence: true
end
