require 'test_helper'

class HomeControllerTest < ActionController::TestCase
  test "should get crawler" do
    get :crawler
    assert_response :success
  end

end
