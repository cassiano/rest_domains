require 'test_helper'

class NewsControllerTest < ActionController::TestCase
  test "should get latest" do
    get :latest
    assert_response :success
  end

  test "should get detail" do
    get :detail
    assert_response :success
  end

end
