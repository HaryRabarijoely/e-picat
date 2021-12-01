require 'test_helper'

class OrderControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get order_index_url
    assert_response :success
  end

  test "should get new" do
    get order_new_url
    assert_response :success
  end

  test "should get create" do
    get order_create_url
    assert_response :success
  end

  test "should get show" do
    get order_show_url
    assert_response :success
  end

  test "should get update" do
    get order_update_url
    assert_response :success
  end

  test "should get edit" do
    get order_edit_url
    assert_response :success
  end

  test "should get destroy" do
    get order_destroy_url
    assert_response :success
  end

end
