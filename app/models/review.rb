class Review < ApplicationRecord
  belongs_to :movie

  validates :name, presence: true

  STARS = [ 1, 2, 3, 4, 5 ]
  validates :stars, inclusion: { in: STARS }

  validates :comment, length: { minimum: 4 }
end
