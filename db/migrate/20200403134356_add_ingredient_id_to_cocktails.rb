class AddIngredientIdToCocktails < ActiveRecord::Migration[6.0]
  def change
    add_column :cocktails, :ingredient_id, :integer
  end
end
