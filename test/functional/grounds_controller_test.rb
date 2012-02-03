require 'test_helper'

class GroundsControllerTest < ActionController::TestCase
  setup do
    @ground = grounds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:grounds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ground" do
    assert_difference('Ground.count') do
      post :create, ground: @ground.attributes
    end

    assert_redirected_to ground_path(assigns(:ground))
  end

  test "should show ground" do
    get :show, id: @ground.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ground.to_param
    assert_response :success
  end

  test "should update ground" do
    put :update, id: @ground.to_param, ground: @ground.attributes
    assert_redirected_to ground_path(assigns(:ground))
  end

  test "should destroy ground" do
    assert_difference('Ground.count', -1) do
      delete :destroy, id: @ground.to_param
    end

    assert_redirected_to grounds_path
  end
end
