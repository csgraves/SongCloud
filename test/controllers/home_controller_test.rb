require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get root_url
    assert_select 'title', 'Coursework App'
    assert_select 'h1', 'My Coursework'
    assert_select 'p', 'Welcome to my coursework site!'


    assert_response :success
  end



end
