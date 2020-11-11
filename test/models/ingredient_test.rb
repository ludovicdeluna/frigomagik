require 'test_helper'

class IngredientTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  describe "hello" do
    it "test me" do
      rec = Recipe.first
      STDERR.puts rec.inspect
      STDERR.puts rec.ingredients.count
      _(true).must_equal false
    end
  end
end
