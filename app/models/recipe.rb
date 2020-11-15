class Recipe < ApplicationRecord
  has_many :ingredients
  scope :with_ingredients, ->(ingredients) { joins(:ingredients).merge(Ingredient.with(ingredients)) }
  scope :scoring, -> { group(:id, :name).order(count: :desc).size }
end
