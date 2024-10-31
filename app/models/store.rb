class Store < ApplicationRecord
  validates :name, presence: true, uniquenes: true
end
