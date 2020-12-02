class Album < ApplicationRecord

  belongs_to :user

  # relation link to songs, destroy all related songs
  has_many :songs, dependent: :destroy

# Made title non-nullable and always unique
  validates :title, presence: true
  validates :title, uniqueness: true

  #Scope only see users albums where the user_id is the same as passed in user object’s id
  scope :user_albums, ->(user) { where(['user_id = ?', user.id]) }

end
