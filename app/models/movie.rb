class Movie < ApplicationRecord
  before_validation :set_slug

  validates :title, :released_on, :director, presence: true
  validates :slug, uniqueness: true
  RATINGS = %w[G PG PG-13 R NC-17]
  validates :rating, inclusion: { in: RATINGS }
  validates :total_gross, :duration, numericality: {
    greater_than_or_equal_to: 0, message: "should be greater than or equal to 0"
  }
  validates :description, length: { minimum: 15 }

  validate :file_type

  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :users_who_favorited, through: :favorites, source: :user
  has_many :movie_genres, dependent: :destroy
  has_many :genres, through: :movie_genres

  has_one_attached :poster

  scope :upcoming, -> { where("released_on >= ?", Time.current).order("released_on asc") }
  scope :released, -> { where("released_on <= ?", Time.current).order("released_on desc") }
  scope :hit, ->(hit_limit = 225_000_000) { released.where("total_gross > ?", hit_limit) }
  scope :flop, ->(hit_limit = 225_000_000) { released.where("total_gross <= ?", hit_limit) }
  scope :recent, ->(max = 3) { released.limit(max) }

  def flop?
    total_gross.blank? || total_gross < 225_000_000
  end

  def average_stars
    reviews.average(:stars)
  end

  def to_param
    slug
  end

  private

  def file_type
    return unless poster.attached?

    unless poster.blob.byte_size <= 1.megabytes
      errors.add :poster, message: "File size must not exceed 1 MB"
    end

    unless poster.image?
      errors.add :poster, message: "File should be an image"
    end
  end

  def set_slug
    self.slug = title.parameterize
  end
end
