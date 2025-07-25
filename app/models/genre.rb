class Genre < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :movie_genres, dependent: :destroy
  has_many :movies, through: :movie_genres
end
