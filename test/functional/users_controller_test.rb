require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  test "should get show_bio" do
    get :show_bio
    assert_response :success
  end

end
