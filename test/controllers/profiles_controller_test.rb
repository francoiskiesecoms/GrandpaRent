require 'test_helper'

class ProfilesControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get profiles_dashboard_url
    assert_response :success
  end

end
