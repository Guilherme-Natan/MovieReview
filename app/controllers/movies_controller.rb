class MoviesController < ApplicationController
  def index
      @movies = Movie.all
  end

  def show
      @movie = Movie.find(params[:id])
  end

  def edit
      @movie = Movie.find(params[:id])
  end

  def update
      @movie = Movie.find(params[:id])
      movie_updated = params
        .require(:movie)
        .permit("title", "rating", "released_on", "total_gross", "description")
      @movie.update(movie_updated)
      redirect_to @movie
  end
end
