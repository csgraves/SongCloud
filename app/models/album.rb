class Album < ApplicationRecord
  has_many :songs, dependent: :destroy
  validates :title, presence: true
  validates :title, uniqueness: true

end
