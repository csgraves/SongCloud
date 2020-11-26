class Album < ApplicationRecord
  belongs_to :user
  has_many :songs, dependent: :destroy
  validates :title, presence: true
  validates :title, uniqueness: true

  scope :user_albums, ->(user) { where(['user_id = ?', user.id]) }

end
