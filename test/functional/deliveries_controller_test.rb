require 'test_helper'

class DeliveriesControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:deliveries)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_delivery
    assert_difference('Delivery.count') do
      post :create, :delivery => { }
    end

    assert_redirected_to delivery_path(assigns(:delivery))
  end

  def test_should_show_delivery
    get :show, :id => deliveries(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => deliveries(:one).id
    assert_response :success
  end

  def test_should_update_delivery
    put :update, :id => deliveries(:one).id, :delivery => { }
    assert_redirected_to delivery_path(assigns(:delivery))
  end

  def test_should_destroy_delivery
    assert_difference('Delivery.count', -1) do
      delete :destroy, :id => deliveries(:one).id
    end

    assert_redirected_to deliveries_path
  end
end
