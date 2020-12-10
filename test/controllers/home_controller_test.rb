require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest

  #b/c added authenticate and using user signed in
  include Devise::Test::IntegrationHelpers

  #Test homepage displays correctly
  test "should get home" do
    get root_url
    assert_select 'title', 'SongCloud'
    assert_select 'h1', 'SongCloud'
    assert_select 'p', 'Welcome to SongCloud, the only place to store your music!'


    assert_response :success
  end

  #Test contact page displays correctly
  test "should get contact" do
    get contact_url
    assert_response :success

    assert_template layout: 'application'

    assert_select 'title', 'SongCloud'
    assert_select 'h1', 'Contact Us'
    assert_select 'p', 'Complete the following form to get in touch with us.'

  end

  #Missing email shouldn't allow
  test "should post request contact but no email" do
    post request_contact_url
    assert_response :redirect
    assert_not_empty flash[:alert]
    assert_nil flash[:notice]
    end

  #Correct details, should pass
  test "should post request contact" do
    post request_contact_url, params:
      {name: "Conor", email: "conor@com2025.com", telephone: "1234567890", message: "Hello"}
  assert_response :redirect
    assert_nil flash[:alert]
    assert_not_empty flash[:notice]
  end


end
