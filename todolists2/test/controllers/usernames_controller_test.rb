require 'test_helper'

class UsernamesControllerTest < ActionController::TestCase
  setup do
    @username = usernames(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:usernames)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create username" do
    assert_difference('Username.count') do
      post :create, username: { password_digest: @username.password_digest }
    end

    assert_redirected_to username_path(assigns(:username))
  end

  test "should show username" do
    get :show, id: @username
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @username
    assert_response :success
  end

  test "should update username" do
    patch :update, id: @username, username: { password_digest: @username.password_digest }
    assert_redirected_to username_path(assigns(:username))
  end

  test "should destroy username" do
    assert_difference('Username.count', -1) do
      delete :destroy, id: @username
    end

    assert_redirected_to usernames_path
  end
end
