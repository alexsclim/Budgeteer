require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Home | Budgeteer"
  end

  test "should get settings" do
    get :settings
    assert_response :success
    assert_select "title", "Settings | Budgeteer"
  end

  test "should get budget" do
    get :budget
    assert_response :success
    assert_select "title", "Budgets | Budgeteer"
  end
end
