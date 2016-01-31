require 'test_helper'

class BacklogitemsControllerTest < ActionController::TestCase
  setup do
    @backlogitem = backlogitems(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:backlogitems)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create backlogitem" do
    assert_difference('Backlogitem.count') do
      post :create, backlogitem: { description: @backlogitem.description, name: @backlogitem.name, size: @backlogitem.size, targetdate: @backlogitem.targetdate }
    end

    assert_redirected_to backlogitem_path(assigns(:backlogitem))
  end

  test "should show backlogitem" do
    get :show, id: @backlogitem
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @backlogitem
    assert_response :success
  end

  test "should update backlogitem" do
    patch :update, id: @backlogitem, backlogitem: { description: @backlogitem.description, name: @backlogitem.name, size: @backlogitem.size, targetdate: @backlogitem.targetdate }
    assert_redirected_to backlogitem_path(assigns(:backlogitem))
  end

  test "should destroy backlogitem" do
    assert_difference('Backlogitem.count', -1) do
      delete :destroy, id: @backlogitem
    end

    assert_redirected_to backlogitems_path
  end
end
