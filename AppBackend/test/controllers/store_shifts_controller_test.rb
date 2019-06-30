require 'test_helper'

class StoreShiftsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store_shift = store_shifts(:one)
  end

  test "should get index" do
    get store_shifts_url, as: :json
    assert_response :success
  end

  test "should create store_shift" do
    assert_difference('StoreShift.count') do
      post store_shifts_url, params: { store_shift: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show store_shift" do
    get store_shift_url(@store_shift), as: :json
    assert_response :success
  end

  test "should update store_shift" do
    patch store_shift_url(@store_shift), params: { store_shift: {  } }, as: :json
    assert_response 200
  end

  test "should destroy store_shift" do
    assert_difference('StoreShift.count', -1) do
      delete store_shift_url(@store_shift), as: :json
    end

    assert_response 204
  end
end
