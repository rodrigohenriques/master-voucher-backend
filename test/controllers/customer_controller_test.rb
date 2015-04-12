require 'test_helper'

class CustomerControllerTest < ActionController::TestCase
  test "should get items" do
    get :items
    assert_response :success
  end

end
