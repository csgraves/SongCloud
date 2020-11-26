class Song < ApplicationRecord
  belongs_to :album
  validates :title, :album, presence: true

  scope :user_songs, ->(user) { joins(:album).where(['user_id = ?', user.id]) }

end
