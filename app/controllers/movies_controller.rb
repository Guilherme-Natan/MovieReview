class MoviesController < ApplicationController
  before_action :require_signin, except: [ :index, :show ]
  before_action :require_admin, except: [ :index, :show ]
  before_action :set_movie, only: [ :show, :edit, :update, :destroy ]
  def index
    # @movies = Movie.all
    @movies = case params[:filter]
    when "upcoming"
      Movie.upcoming
    when "hits"
      Movie.hit
    when "flops"
      Movie.flop
    else
      Movie.released
    end
  end

  def show
    @genres = @movie.genres
    @users_who_favorited = @movie.users_who_favorited
    if current_user
      @favorite = current_user.favorites.find_by(movie: @movie)
    end
  end

  def edit
  end

  def update
    if @movie.update(movie_params)
      redirect_to @movie, notice: "Movie successfully updated!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.new(movie_params)
    if @movie.save
      redirect_to @movie, notice: "Movie successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @movie.destroy
    redirect_to movies_url, status: :see_other
  end

  private

  def set_movie
    @movie = Movie.find_by!(slug: params[:id])
  end

  def movie_params
    params
     .require(:movie)
     .permit(:title, :rating, :released_on, :total_gross, :description, :director, :duration, :poster, genre_ids: [])
  end
end
