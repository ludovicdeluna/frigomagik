class RecipesController < ApplicationController
  def search
    ingredients = (params[:ingredients] || "").split(',').map(&:strip).compact
    @recipes = RecipeFinderService.new.can_cook_with(ingredients)
    @ingredients = ingredients.join(", ")
    @nbs_ingredients = ingredients.size
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
