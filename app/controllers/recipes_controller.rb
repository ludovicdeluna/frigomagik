class RecipesController < ApplicationController
  def show
  end

  def search
    ingredients = (params[:ingredients] || "").split(',').map(&:strip).compact
    @recipes = RecipeFinderService.new.can_cook_with(ingredients + %w(sel poivre huile))
    @ingredients = ingredients.join(", ")
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
