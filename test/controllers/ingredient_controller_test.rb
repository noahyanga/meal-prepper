require "test_helper"

class IngredientControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ingredient_index_url
    assert_response :success
  end

  test "should get show" do
    get ingredient_show_url
    assert_response :success
  end
end
