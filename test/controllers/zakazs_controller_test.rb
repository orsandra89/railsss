require 'test_helper'

class ZakazsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @zakaz = zakazs(:one)
  end

  test "should get index" do
    get zakazs_url
    assert_response :success
  end

  test "should get new" do
    get new_zakaz_url
    assert_response :success
  end

  test "should create zakaz" do
    assert_difference('Zakaz.count') do
      post zakazs_url, params: { zakaz: { adress: @zakaz.adress, dish: @zakaz.dish, drink: @zakaz.drink, name: @zakaz.name, phone: @zakaz.phone } }
    end

    assert_redirected_to zakaz_url(Zakaz.last)
  end

  test "should show zakaz" do
    get zakaz_url(@zakaz)
    assert_response :success
  end

  test "should get edit" do
    get edit_zakaz_url(@zakaz)
    assert_response :success
  end

  test "should update zakaz" do
    patch zakaz_url(@zakaz), params: { zakaz: { adress: @zakaz.adress, dish: @zakaz.dish, drink: @zakaz.drink, name: @zakaz.name, phone: @zakaz.phone } }
    assert_redirected_to zakaz_url(@zakaz)
  end

  test "should destroy zakaz" do
    assert_difference('Zakaz.count', -1) do
      delete zakaz_url(@zakaz)
    end

    assert_redirected_to zakazs_url
  end
end
