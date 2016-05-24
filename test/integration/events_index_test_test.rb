require 'test_helper'

class EventsIndexTestTest < ActionDispatch::IntegrationTest
  def setup
    @user = users(:michael)
    @event = events(:event)
  end

  test "index as user including pagination and delete links" do
    log_in_as(@user)
    get events_path
    assert_template 'events/index'
    assert_select 'div.pagination'
    assert_select 'a', text: 'X'
    assert_select 'a', text: 'Edit'
  end

  test "index as non-logged in user" do
    get events_path
    assert_select 'a', text: 'X', count: 0
    assert_select 'a', text: 'Edit', count: 0
  end
end
