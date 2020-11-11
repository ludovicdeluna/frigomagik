class RecipeFinderService
  def can_cook_with(ingredients, pagemax: 20)
    ingredients.
      map { |name| "%#{name}%"}.
      then { |list| Recipe.where.not(id: Ingredient.not_in(list).by_recipe_id).limit(pagemax) }
  end
end
