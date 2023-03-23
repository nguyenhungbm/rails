require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Ruby on Rails Tutorial Sample App"
  end

  test "should get root" do
    get root_path
    assert_response :success
    end

  test "should get index" do
    get static_pages_index_path
    assert_response :success
    assert_select "title", "Index | #{@base_title}"
  end

  test "should get show" do
    get static_pages_show_path
    assert_response :success
    assert_select "title", "Show | #{@base_title}"
  end

  test "should get new" do
    get static_pages_new_path
    assert_response :success
    assert_select "title", "New | #{@base_title}"
  end

  test "should get edit" do
    get static_pages_edit_path
    assert_response :success
    assert_select "title", "Edit | #{@base_title}"
  end
end
