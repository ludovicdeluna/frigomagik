# frozen_string_literal: true
require "json"

class RecipeLoader
  def load_file(path)
    ActiveRecord::Base.transaction do
      File.
        readlines(path).
        each.
        with_index(&method(:parse_and_store))
    end
  end

  private

  def parse_and_store(json, line)
    return unless json[0] == "{"

    record = JSON.parse(json)
    store_recipe(record)

   rescue JSON::ParserError => err
     raise "JSON Parse error at line #{line}. Message: #{err.message}.\nInput: #{str.inspect}"
  end

  def store_recipe(record)
    recipe = Recipe.create!(
      name: record["name"],
      author: record["author"],
      author_tip: record["author_tip"],
      budget: record["budget"],
      difficulty: record["difficulty"],
      people_quantity: record["people_quantity"],
      cook_time: record["cook_time"],
      prep_time: record["prep_time"],
      total_time: record["total_time"],
      image_url: record["image"]
    )

    record.fetch("ingredients").each do |quantity_and_name|
      Ingredient.create!(
        recipe_id: recipe.id,
        qte_name: quantity_and_name
      )
    end
  end
end
