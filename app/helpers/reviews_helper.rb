module ReviewsHelper
  def average_stars(movie)
    if movie.average_stars.nil?
      content_tag(:strong, "No reviews")
    else
      content_tag :span, pluralize(number_with_precision(movie.average_stars, precision: 1), "star")
    end
  end
end
