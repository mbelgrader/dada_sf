require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get home" do
    get :home
    assert_response :success
    assert_select "title", "Dada SF"
  end

  test "should get about" do
    get :about
    assert_response :success
    assert_select "title", "About | Dada SF"
  end

  test "should get location" do
    get :location
    assert_response :success
    assert_select "title", "Location | Dada SF"
  end

end
