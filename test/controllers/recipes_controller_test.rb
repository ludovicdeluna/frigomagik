require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get recipes_show_url(id: recipes(:recipe_two_ingredients).id)
    assert_response :success
  end

  test "should get search" do
    post recipes_search_url
    assert_response :success
  end

end
