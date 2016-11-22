require 'test_helper'

class PhotosIndexTestTest < ActionDispatch::IntegrationTest

    def setup
      @user = users(:michael)
      @event = events(:event)
    end

    test "index as user including pagination and delete links" do
      log_in_as(@user)
      get gallery_path
      assert_template 'photos/new'
      assert_select 'a', text: 'X (left)'
    end

    test "index as non-logged in user" do
      get gallery_path
      assert_select 'a', text: 'X (left)', count: 0
    end

end
