class Song < ApplicationRecord
  #Song must belong to album and have title
  belongs_to :album
  validates :title, :album, presence: true

  #Scope only see users songs where user_id is same as the passed in user object’s id
  scope :user_songs, ->(user) { joins(:album).where(['user_id = ?', user.id]) }

end
