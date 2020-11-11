# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

Ingredient.delete_all
Recipe.delete_all

RecipeLoaderService.new.load_file(Rails.root.join("db", "seeds_recipes.json"))
