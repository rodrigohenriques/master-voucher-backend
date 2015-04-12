require 'test_helper'

class FormControllerTest < ActionController::TestCase
  test "should get master_pass" do
    get :master_pass
    assert_response :success
  end

end
