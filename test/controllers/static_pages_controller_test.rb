require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get about" do
    get :about
    assert_response :success
  end

  test "should get gallery" do
    get :gallery
    assert_response :success
  end

  test "should get reservations" do
    get :reservations
    assert_response :success
  end

  test "should get location" do
    get :location
    assert_response :success
  end

end
