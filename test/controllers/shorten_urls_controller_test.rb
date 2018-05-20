require 'test_helper'

class ShortenUrlsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get shorten_urls_new_url
    assert_response :success
  end

  test "should get show" do
    get shorten_urls_show_url
    assert_response :success
  end


  test "should get delete" do
    get shorten_urls_delete_url
    assert_response :success
  end

end
