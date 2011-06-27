require 'test_helper'

class XmlfilesControllerTest < ActionController::TestCase
  setup do
    @xmlfile = xmlfiles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:xmlfiles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create xmlfile" do
    assert_difference('Xmlfile.count') do
      post :create, :xmlfile => @xmlfile.attributes
    end

    assert_redirected_to xmlfile_path(assigns(:xmlfile))
  end

  test "should show xmlfile" do
    get :show, :id => @xmlfile.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @xmlfile.to_param
    assert_response :success
  end

  test "should update xmlfile" do
    put :update, :id => @xmlfile.to_param, :xmlfile => @xmlfile.attributes
    assert_redirected_to xmlfile_path(assigns(:xmlfile))
  end

  test "should destroy xmlfile" do
    assert_difference('Xmlfile.count', -1) do
      delete :destroy, :id => @xmlfile.to_param
    end

    assert_redirected_to xmlfiles_path
  end
end
