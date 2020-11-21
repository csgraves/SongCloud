require 'test_helper'

class SongsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @song = songs(:one)
    @album = albums(:one)
  end

  test "should get index" do
    get songs_url
    assert_response :success
  end

  #test "should get new" do
  #  get get :new, album_id: @album #song_url(@song.title) passes
  #  assert_response :success
  #end

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

  test "should update song" do
    patch song_url(@song), params: { song: { album_id: @song.album_id, artist: @song.artist, favourite: @song.favourite, genre: @song.genre, title: @song.title } }
    assert_redirected_to song_url(@song)
  end

  test "should destroy song" do
    assert_difference('Song.count', -1) do
      delete song_url(@song)
    end

    assert_redirected_to songs_url
  end
end
