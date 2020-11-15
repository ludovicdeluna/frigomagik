class Ingredient < ApplicationRecord
  belongs_to :recipe

  scope :not_in, ->(ingredients) { where.not("qte_name ilike any (array[?])", Array(ingredients)) }
  scope :by_recipe_id, -> { group(:recipe_id).pluck(:recipe_id) }
  scope :with, -> (ingredients) { where("qte_name ilike any(Array[?])", to_list(ingredients)) }

  def self.to_list(ingredients)
    Array(ingredients).map { |name| "%#{name}%"}
  end
end
