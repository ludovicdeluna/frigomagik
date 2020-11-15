class RecipeFinderService
  Result = Struct.new(:id, :name, :found)

  def can_cook_with(ingredients, pagemax: 20)
    Recipe.
      with_ingredients(ingredients).
      limit(pagemax).
      scoring.
      map { |(id, name), found| Result.new(id, name, found) }
  end
end
