require 'test_helper'

class StoreRoutinesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @store_routine = store_routines(:one)
  end

  test "should get index" do
    get store_routines_url, as: :json
    assert_response :success
  end

  test "should create store_routine" do
    assert_difference('StoreRoutine.count') do
      post store_routines_url, params: { store_routine: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show store_routine" do
    get store_routine_url(@store_routine), as: :json
    assert_response :success
  end

  test "should update store_routine" do
    patch store_routine_url(@store_routine), params: { store_routine: {  } }, as: :json
    assert_response 200
  end

  test "should destroy store_routine" do
    assert_difference('StoreRoutine.count', -1) do
      delete store_routine_url(@store_routine), as: :json
    end

    assert_response 204
  end
end
