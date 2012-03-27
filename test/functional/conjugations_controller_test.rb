require 'test_helper'

class ConjugationsControllerTest < ActionController::TestCase
  setup do
    @conjugation = conjugations(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:conjugations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create conjugation" do
    assert_difference('Conjugation.count') do
      post :create, conjugation: @conjugation.attributes
    end

    assert_redirected_to conjugation_path(assigns(:conjugation))
  end

  test "should show conjugation" do
    get :show, id: @conjugation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @conjugation
    assert_response :success
  end

  test "should update conjugation" do
    put :update, id: @conjugation, conjugation: @conjugation.attributes
    assert_redirected_to conjugation_path(assigns(:conjugation))
  end

  test "should destroy conjugation" do
    assert_difference('Conjugation.count', -1) do
      delete :destroy, id: @conjugation
    end

    assert_redirected_to conjugations_path
  end
end
