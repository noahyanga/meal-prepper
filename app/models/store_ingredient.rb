class StoreIngredient < ApplicationRecord
  belongs_to :store
  belongs_to :ingredient
end
