require "test_helper"

class SiteRootLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_template 'static_pages/index'
    assert_select "a[href=?]", root_path, count: 1
    assert_select "a[href=?]", static_pages_show_path
    assert_select "a[href=?]", static_pages_new_path
    assert_select "a[href=?]", static_pages_edit_path
    end
end
