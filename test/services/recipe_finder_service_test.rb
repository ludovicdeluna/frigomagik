require 'test_helper'

class RecipeFinderServiceTest < ActiveSupport::TestCase
  describe "#can_cook_with" do
    subject { RecipeFinderService.new.can_cook_with(ingredients) }
    let(:ingredients) { %w(courgette mouton ritz) }

    it "find recipes having all ingredients provided" do
      _(subject.count).must_equal 2

      _(subject.first.id).must_equal recipes(:recipe_four_ingredients).id
      _(subject.first.name).must_equal recipes(:recipe_four_ingredients).name
      _(subject.first.found).must_equal 3
    end
  end
end
