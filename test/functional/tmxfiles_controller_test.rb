require 'test_helper'

class TmxfilesControllerTest < ActionController::TestCase
  setup do
    @tmxfile = tmxfiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tmxfiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tmxfile" do
    assert_difference('Tmxfile.count') do
      post :create, :tmxfile => @tmxfile.attributes
    end

    assert_redirected_to tmxfile_path(assigns(:tmxfile))
  end

  test "should show tmxfile" do
    get :show, :id => @tmxfile.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tmxfile.to_param
    assert_response :success
  end

  test "should update tmxfile" do
    put :update, :id => @tmxfile.to_param, :tmxfile => @tmxfile.attributes
    assert_redirected_to tmxfile_path(assigns(:tmxfile))
  end

  test "should destroy tmxfile" do
    assert_difference('Tmxfile.count', -1) do
      delete :destroy, :id => @tmxfile.to_param
    end

    assert_redirected_to tmxfiles_path
  end
end
