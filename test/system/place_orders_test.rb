require "application_system_test_case"

class PlaceOrdersTest < ApplicationSystemTestCase
  setup do
    @place_order = place_orders(:one)
  end

  test "visiting the index" do
    visit place_orders_url
    assert_selector "h1", text: "Place Orders"
  end

  test "creating a Place order" do
    visit place_orders_url
    click_on "New Place Order"

    fill_in "Address", with: @place_order.address
    fill_in "Email", with: @place_order.email
    fill_in "Name", with: @place_order.name
    fill_in "Pay type", with: @place_order.pay_type
    click_on "Create Place order"

    assert_text "Place order was successfully created"
    click_on "Back"
  end

  test "updating a Place order" do
    visit place_orders_url
    click_on "Edit", match: :first

    fill_in "Address", with: @place_order.address
    fill_in "Email", with: @place_order.email
    fill_in "Name", with: @place_order.name
    fill_in "Pay type", with: @place_order.pay_type
    click_on "Update Place order"

    assert_text "Place order was successfully updated"
    click_on "Back"
  end

  test "destroying a Place order" do
    visit place_orders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Place order was successfully destroyed"
  end
end
