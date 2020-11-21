require 'test_helper'

class SongTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @album = albums(:one)
  end

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
