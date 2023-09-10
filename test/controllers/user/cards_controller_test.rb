require "test_helper"

class User::CardsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get user_cards_create_url
    assert_response :success
  end

  test "should get update" do
    get user_cards_update_url
    assert_response :success
  end
end
