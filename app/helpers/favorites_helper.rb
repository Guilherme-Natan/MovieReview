module FavoritesHelper
  def favorite_or_unfavorite(movie, favorite)
    if @favorite
      button_to "☆ Unfavorite", movie_favorite_path(movie, favorite), method: :delete
    else
      button_to "★ Favorite", movie_favorites_path(movie)
    end
  end
end
