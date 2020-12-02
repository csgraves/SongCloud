require 'test_helper'

class SongTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #sets property to one in the database from fixtures
  setup do
    @album = albums(:one)
  end

  #Various song validation tests
  test 'empty song cannot be saved' do
    song = Song.new
    song.save

    refute song.valid?
  end

  test 'should save valid song' do
    song = Song.new

    song.title = 'My song'
    song.album = @album

    song.save
    assert song.valid?
  end

end
