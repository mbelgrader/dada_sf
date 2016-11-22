require 'test_helper'

class ContactsIndexTest < ActionDispatch::IntegrationTest

  def setup
    @user = users(:michael)
    @contact = contacts(:example)
  end

  test "index as user including pagination and delete links" do
    log_in_as(@user)
    get index_path
    assert_template 'contacts/index'
    assert_select 'div.pagination'
    assert_select 'a', text: 'X'
    assert_select 'a', text: 'Edit'
  end

  test "index as non-logged in user" do
    get index_path
    assert_select 'a', text: 'X', count: 0
    assert_select 'a', text: 'Edit', count: 0
  end

end
