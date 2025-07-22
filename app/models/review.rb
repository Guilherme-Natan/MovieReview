class Review < ApplicationRecord
  belongs_to :movie
  belongs_to :user

  STARS = [ 1, 2, 3, 4, 5 ]
  validates :stars, inclusion: { in: STARS }

  validates :comment, length: { minimum: 4 }
end
