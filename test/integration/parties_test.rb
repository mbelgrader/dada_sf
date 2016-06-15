require 'test_helper'

class PartiesTest < ActionDispatch::IntegrationTest
  confirmation = "Thank you for your request. We will contact you with availabilty."

  test "vaild private party submission" do
    get parties_path
    assert_difference 'Contact.count', 1 do
      post contacts_path, contact: { name: 'Willis',
                       email: 'willis@gmail.com',
                       phone: '555-5555',
                       guests: 24,
                       date: '04/07/2016'}

    end
    # assert_template 'contacts/new'
    # assert_select 'p', text: confirmation
  end

end
