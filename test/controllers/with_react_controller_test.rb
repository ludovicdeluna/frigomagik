require 'test_helper'

class WithReactControllerTest < ActionDispatch::IntegrationTest
  test "should get react page (no service side rendering)" do
    get with_react_url
    assert_response :success
  end
end
