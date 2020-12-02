require 'test_helper'

class AlbumsControllerTest < ActionDispatch::IntegrationTest

  #b/c added authenticate and using user signed in
  include Devise::Test::IntegrationHelpers

  #sets properties to those in the database from fixtures
  setup do
    @album = albums(:one)
    @user = users(:one)
    sign_in @user
  end

  #testing buttons and pointing to various pages
  test "should get index" do
    get albums_url
    assert_response :success
  end

  test "should get new" do
    get new_album_url
    assert_response :success
  end

  #Checks count and assigns values to params
  test "should create album" do
    assert_difference('Album.count') do
      post albums_url, params: { album: { artist: @album.artist, released: @album.released, title: @album.title + " create"} } #use unique title
    end

    assert_redirected_to album_url(Album.last)
  end

  test "should show album" do
    get album_url(@album)
    assert_response :success
  end

  test "should get edit" do
    get edit_album_url(@album)
    assert_response :success
  end

  #Assigns values to params and redirects
  test "should update album" do
    patch album_url(@album), params: { album: { artist: @album.artist, released: @album.released, title: @album.title } }
    assert_redirected_to album_url(@album)
  end

  #Remove and redirect
  test "should destroy album" do
    assert_difference('Album.count', -1) do
      delete album_url(@album)
    end

    assert_redirected_to albums_url
  end
end
