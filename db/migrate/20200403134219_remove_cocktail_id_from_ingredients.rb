class RemoveCocktailIdFromIngredients < ActiveRecord::Migration[6.0]
  def change
    remove_column :ingredients, :cocktail_id, :integer
  end
end
