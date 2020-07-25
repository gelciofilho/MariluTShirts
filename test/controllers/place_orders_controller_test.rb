require 'test_helper'

class PlaceOrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @place_order = place_orders(:one)
  end

  test "should get index" do
    get place_orders_url
    assert_response :success
  end

  test "should get new" do
    get new_place_order_url
    assert_response :success
  end

  test "should create place_order" do
    assert_difference('PlaceOrder.count') do
      post place_orders_url, params: { place_order: { address: @place_order.address, email: @place_order.email, name: @place_order.name, pay_type: @place_order.pay_type } }
    end

    assert_redirected_to place_order_url(PlaceOrder.last)
  end

  test "should show place_order" do
    get place_order_url(@place_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_place_order_url(@place_order)
    assert_response :success
  end

  test "should update place_order" do
    patch place_order_url(@place_order), params: { place_order: { address: @place_order.address, email: @place_order.email, name: @place_order.name, pay_type: @place_order.pay_type } }
    assert_redirected_to place_order_url(@place_order)
  end

  test "should destroy place_order" do
    assert_difference('PlaceOrder.count', -1) do
      delete place_order_url(@place_order)
    end

    assert_redirected_to place_orders_url
  end
end
