class CreateRecipes < ActiveRecord::Migration[7.2]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :instructions
      t.integer :meal_id

      t.timestamps
    end
  end
end
