class MovieController < ApplicationController

def index
  @movies = Movie.order(id: :DESC).includes(:user)
end

def new
  @movie = Movie.new
  @movie.thumbnails.build
end

def create
  @movie = Movie.create(movie_params)
  redirect_to :root
end

def edit
  @movie = Movie.find(params[:id])
end

def update
  movie = Movie.find(params[:id])
  movie.update(movie_params) if movie.user_id == current_user.id
  redirect_to action: :index
end

private
  def movie_params
    params.require(:movie).permit(:title, :copy, :concept, thumbnails_attributes: [:id, :title, :status]).merge(user_id: current_user.id)
  end

end
