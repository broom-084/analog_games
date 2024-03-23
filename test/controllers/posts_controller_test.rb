require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get top" do
    get posts_top_url
    assert_response :success
  end
end
