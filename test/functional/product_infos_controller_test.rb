require 'test_helper'

class ProductInfosControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:product_infos)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_product_info
    assert_difference('ProductInfo.count') do
      post :create, :product_info => { }
    end

    assert_redirected_to product_info_path(assigns(:product_info))
  end

  def test_should_show_product_info
    get :show, :id => product_infos(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => product_infos(:one).id
    assert_response :success
  end

  def test_should_update_product_info
    put :update, :id => product_infos(:one).id, :product_info => { }
    assert_redirected_to product_info_path(assigns(:product_info))
  end

  def test_should_destroy_product_info
    assert_difference('ProductInfo.count', -1) do
      delete :destroy, :id => product_infos(:one).id
    end

    assert_redirected_to product_infos_path
  end
end
