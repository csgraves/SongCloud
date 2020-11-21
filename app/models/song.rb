class Song < ApplicationRecord
  belongs_to :album
  validates :title, :album, presence: true
end
