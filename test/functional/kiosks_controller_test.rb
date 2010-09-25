require 'test_helper'

class KiosksControllerTest < ActionController::TestCase
  setup do
    @kiosk = kiosks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:kiosks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create kiosk" do
    assert_difference('Kiosk.count') do
      post :create, :kiosk => @kiosk.attributes
    end

    assert_redirected_to kiosk_path(assigns(:kiosk))
  end

  test "should show kiosk" do
    get :show, :id => @kiosk.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @kiosk.to_param
    assert_response :success
  end

  test "should update kiosk" do
    put :update, :id => @kiosk.to_param, :kiosk => @kiosk.attributes
    assert_redirected_to kiosk_path(assigns(:kiosk))
  end

  test "should destroy kiosk" do
    assert_difference('Kiosk.count', -1) do
      delete :destroy, :id => @kiosk.to_param
    end

    assert_redirected_to kiosks_path
  end
end
