require 'test_helper'

class RecipeFinderServiceTest < ActiveSupport::TestCase
  describe "#can_cook_with" do
    subject { RecipeFinderService.new.can_cook_with(ingredients) }
    let(:ingredients) { %w(courgette mouton sel poivre) }

    it "find recipes having all ingredients provided" do
      _(subject.count).must_equal 1
      _(subject.first.id).must_equal recipes(:recipe_two_ingredients).id
    end
  end
end
