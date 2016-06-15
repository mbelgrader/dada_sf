require 'test_helper'

class LayoutTest < ActionDispatch::IntegrationTest

  test "links" do
    get root_path
    assert_template 'static_pages/home'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", 'about'
    assert_select "a[href=?]", 'location'
    assert_select "a[href=?]", 'gallery'
    assert_select "a[href=?]", 'reservations'
    assert_select "a[href=?]", 'events'
  end

end
