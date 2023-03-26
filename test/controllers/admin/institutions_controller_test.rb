require "test_helper"

class Admin::InstitutionsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_institutions_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_institutions_show_url
    assert_response :success
  end
end
