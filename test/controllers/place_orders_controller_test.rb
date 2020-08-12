require 'test_helper'

class OrdersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @place_order = place_orders(:one)
  end

  test "should get index" do
    get place_orders_url
    assert_response :success
  end

  test "requires item in cart" do
    get new_place_order_url
    assert_redirected_to index_path
    assert_equal flash[:notice], 'Your cart is empty'
  end

  test "should get new" do
    post line_items_url, params: { product_id: products(:ruby).id }

    get new_place_order_url
    assert_response :success
  end

  test "should create order" do
    assert_difference('Place_order.count') do
      post place_orders_url, params: { place_order: { address: @place_order.address,
        email: @place_order.email, name: @place_order.name,
        pay_type: @place_order.pay_type } }
    end

    assert_redirected_to index_url(locale: 'en')
  end

  test "should show order" do
    get place_order_url(@place_order)
    assert_response :success
  end

  test "should get edit" do
    get edit_place_order_url(@place_order)
    assert_response :success
  end

  test "should update order" do
    patch place_order_url(@place_order), params: { place_order: { address: @place_order.address, email: @place_order.email, name: @place_order.name, pay_type: @place_order.pay_type } }
    assert_redirected_to place_order_url(@place_order)
  end

  test "should destroy order" do
    assert_difference('Order.count', -1) do
      delete place_order_url(@place_order)
    end

    assert_redirected_to place_orders_url
  end
end