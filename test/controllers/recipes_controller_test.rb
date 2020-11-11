require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get recipes_show_url
    assert_response :success
  end

  test "should get search" do
    get recipes_search_url
    assert_response :success
  end

end
