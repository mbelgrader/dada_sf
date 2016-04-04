require 'test_helper'

class ContactsReserveTest < ActionDispatch::IntegrationTest

  test "invalid information" do
    get reservations_path
    assert_no_difference 'Contact.count' do
      post contacts_path, contact: { name: "",
                                     email: "example@invalid"}
    end
    assert_template 'contacts/new'
  end

  test "valid information" do
    get reservations_path
    assert_difference 'Contact.count', 1 do
      post contacts_path, contact: { name: "example",
                                     email: "contact@example.com",
                                     guests: 10}
    end
  end

end
