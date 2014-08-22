class ChangeDateColumnInRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :date
    add_column :recipes, :date, :date
  end
end
