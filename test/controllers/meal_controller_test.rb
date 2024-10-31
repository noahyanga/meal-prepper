require "test_helper"

class MealControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get meal_index_url
    assert_response :success
  end

  test "should get show" do
    get meal_show_url
    assert_response :success
  end
end
