class MovieController < ApplicationController

  before_action :find_movie, only: [:edit, :update]

def index
  @movies = Movie.order(id: :DESC).includes(:user)
end

def new
  @movie = Movie.new
  @movie.thumbnails.build
end

def create
  Movie.create(movie_params)
  redirect_to :root
end

def edit
  redirect_to :root
end

def update
  if @movie.update(movie_params)
    redirect_to :root
  else
    redirect_to action: :edit
end

private
  def movie_params
    params.require(:movie).permit(:title, :copy, :concept, thumbnails_attributes: [:id, :title, :status]).merge(user_id: current_user.id)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end

end
