require 'test_helper'

class RepToteControllerTest < ActionDispatch::IntegrationTest
  test "should get retnj" do
    get rep_tote_retnj_url
    assert_response :success
  end

  test "should get retil" do
    get rep_tote_retil_url
    assert_response :success
  end

  test "should get fsnj" do
    get rep_tote_fsnj_url
    assert_response :success
  end

  test "should get fsil" do
    get rep_tote_fsil_url
    assert_response :success
  end

  test "should get fsga" do
    get rep_tote_fsga_url
    assert_response :success
  end

  test "should get fstx" do
    get rep_tote_fstx_url
    assert_response :success
  end

end
