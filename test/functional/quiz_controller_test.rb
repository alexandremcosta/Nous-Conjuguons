require 'test_helper'

class QuizControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get eval" do
    get :eval
    assert_response :success
  end

end
