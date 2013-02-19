require 'test_helper'

class ResourceControllerTest < ActionController::TestCase
  test "should get show_comments" do
    get :show_comments
    assert_response :success
  end

end
