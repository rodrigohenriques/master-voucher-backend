require 'test_helper'

class MerchantControllerTest < ActionController::TestCase
  test "should get delivery" do
    get :delivery
    assert_response :success
  end

end
