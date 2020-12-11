require 'test_helper'

class SongsControllerTest < ActionDispatch::IntegrationTest

  #b/c added authenticate and using user signed in
  include Devise::Test::IntegrationHelpers

  #sets properties to those in the database from fixtures
  setup do
    @song = songs(:one)
    @album = albums(:one)
    @user = users(:one)
    sign_in @user
  end

  #testing buttons and pointing to various pages
  test "should get index" do
    get songs_url
    assert_response :success
  end

  test "should get new" do
    get song_url(@song)
    assert_response :success
  end

  #Checks count and assigns values to params
  test "should create song" do
    assert_difference('Song.count') do
      post songs_url, params: { song: { album_id: @song.album_id, artist: @song.artist, favourite: @song.favourite, genre: @song.genre, title: @song.title } }
    end

    assert_redirected_to song_url(Song.last)
  end

  test "should show song" do
    get song_url(@song)
    assert_response :success
  end

  test "should get edit" do
    get edit_song_url(@song)
    assert_response :success
  end

  #Assigns values to params and redirects
  test "should update song" do
    patch song_url(@song), params: { song: { album_id: @song.album_id, artist: @song.artist, favourite: @song.favourite, genre: @song.genre, title: @song.title } }
    assert_redirected_to song_url(@song)
  end

#Remove and redirect
  test "should destroy song" do
    assert_difference('Song.count', -1) do
      delete song_url(@song)
    end

    assert_redirected_to songs_url
  end

  #No login access denied
  test "should not show songs" do
    sign_out @user
    get songs_url
    assert_redirected_to user_session_url
  end
end
