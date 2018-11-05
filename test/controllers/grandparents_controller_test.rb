require 'test_helper'

class GrandparentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get grandparents_index_url
    assert_response :success
  end

  test "should get new" do
    get grandparents_new_url
    assert_response :success
  end

  test "should get create" do
    get grandparents_create_url
    assert_response :success
  end

  test "should get show" do
    get grandparents_show_url
    assert_response :success
  end

end
