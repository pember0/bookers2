require "test_helper"

class BookdControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bookd_new_url
    assert_response :success
  end

  test "should get create" do
    get bookd_create_url
    assert_response :success
  end

  test "should get index" do
    get bookd_index_url
    assert_response :success
  end

  test "should get show" do
    get bookd_show_url
    assert_response :success
  end

  test "should get destroy" do
    get bookd_destroy_url
    assert_response :success
  end
end
