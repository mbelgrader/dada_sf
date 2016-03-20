require 'test_helper'

class ContactTest < ActiveSupport::TestCase

  def setup
    @contact = Contact.new(name: "Example Contact", email: "contact@example.com")
  end

  test "should be valid" do
    assert @contact.valid?
  end

  test "name should be present" do
    @contact.name = "     "
    assert_not @contact.valid?
  end

  test "email should not be too long" do
    @contact.email = "a" * 244 + "@example.com"
    assert_not @contact.valid?
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @contact.email = invalid_address
      assert_not @contact.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

end
