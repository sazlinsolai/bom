require 'test_helper'

class BillmaterialsControllerTest < ActionController::TestCase
  def test_should_get_index
    get :index
    assert_response :success
    assert_not_nil assigns(:billmaterials)
  end

  def test_should_get_new
    get :new
    assert_response :success
  end

  def test_should_create_billmaterial
    assert_difference('Billmaterial.count') do
      post :create, :billmaterial => { }
    end

    assert_redirected_to billmaterial_path(assigns(:billmaterial))
  end

  def test_should_show_billmaterial
    get :show, :id => billmaterials(:one).id
    assert_response :success
  end

  def test_should_get_edit
    get :edit, :id => billmaterials(:one).id
    assert_response :success
  end

  def test_should_update_billmaterial
    put :update, :id => billmaterials(:one).id, :billmaterial => { }
    assert_redirected_to billmaterial_path(assigns(:billmaterial))
  end

  def test_should_destroy_billmaterial
    assert_difference('Billmaterial.count', -1) do
      delete :destroy, :id => billmaterials(:one).id
    end

    assert_redirected_to billmaterials_path
  end
end
