require 'test_helper'

class RecentpostControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get recentpost_show_url
    assert_response :success
  end

end
