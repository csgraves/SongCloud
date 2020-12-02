require 'test_helper'

class AlbumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  #sets property to one in the database from fixtures
  setup do
    @user = users(:one)
  end

#Various album tests
  test 'should not save empty album' do
    album = Album.new
    album.save

    refute album.valid?
  end

  test 'should save valid album' do
    album = Album.new
    album.title = "Album3"
    album.artist = "Artist3"
    album.released = 2020-01-01
    album.user = @user

    album.save
    assert album.valid?
  end

  test 'should not save duplicate album title' do
    album = Album.new
    album.title = "Album1"
    album.artist = "Artist1"
    album.released = 2020
    album.user = @user

    album.save
    assert album.valid?


    album2 = Album.new
    album2.title = "Album1"
    album2.artist = "Artist2"
    album2.released = 2020
    album.user = @user

    album2.save
    refute album2.valid?

  end
end
