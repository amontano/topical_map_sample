require 'test_helper'

class CategoryElementAssociationsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:category_element_associations)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create category_element_association" do
    assert_difference('CategoryElementAssociation.count') do
      post :create, :category_element_association => { }
    end

    assert_redirected_to category_element_association_path(assigns(:category_element_association))
  end

  test "should show category_element_association" do
    get :show, :id => category_element_associations(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => category_element_associations(:one).to_param
    assert_response :success
  end

  test "should update category_element_association" do
    put :update, :id => category_element_associations(:one).to_param, :category_element_association => { }
    assert_redirected_to category_element_association_path(assigns(:category_element_association))
  end

  test "should destroy category_element_association" do
    assert_difference('CategoryElementAssociation.count', -1) do
      delete :destroy, :id => category_element_associations(:one).to_param
    end

    assert_redirected_to category_element_associations_path
  end
end
