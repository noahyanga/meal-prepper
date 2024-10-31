class CreateStoreIngredients < ActiveRecord::Migration[7.2]
  def change
    create_table :store_ingredients do |t|
      t.references :store, null: false, foreign_key: true
      t.references :ingredient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
