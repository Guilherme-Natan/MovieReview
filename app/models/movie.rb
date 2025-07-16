class Movie < ApplicationRecord
  validates :title, :released_on, :director, presence: true
  RATINGS = %w[G PG PG-13 R NC-17]
  validates :rating, inclusion: { in: RATINGS }
  validates :total_gross, :duration, numericality: {
    greater_than_or_equal_to: 0, message: "should be greater than or equal to 0"
  }
  validates :description, length: { minimum: 15 }
  validates :image_file_name, format: {
    with: /\A\w+\.(PNG|JPG)\z/i, message: "Image file type must be either png or jpg"
  }

  has_many :reviews, dependent: :destroy

  def self.released
    where("released_on <= ?", Time.current).order("released_on desc")
  end

  def flop?
    total_gross.blank? || total_gross < 225_000_000
  end
end
