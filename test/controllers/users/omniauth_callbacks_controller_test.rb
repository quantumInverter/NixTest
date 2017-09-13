require 'test_helper'

class Users::OmniauthCallbacksControllerTest < ActionDispatch::IntegrationTest
  test "should get facebook" do
    get users_omniauth_callbacks_facebook_url
    assert_response :success
  end

  test "should get twitter" do
    get users_omniauth_callbacks_twitter_url
    assert_response :success
  end

  test "should get google" do
    get users_omniauth_callbacks_google_url
    assert_response :success
  end

end
