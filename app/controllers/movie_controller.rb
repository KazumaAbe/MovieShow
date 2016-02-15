class MovieController < ApplicationController

def index
  @movies = Movie.order(id: :DESC).includes(:user)
end

def new
  @movie = Movie.new
  @movie.thumbnails.build
end

def create
  Movie.create(create_params)
  redirect_to :root
end

private
  def create_params
    params.require(:movie).permit(:title, :copy, :concept, thumbnails_attributes: [:id,:title, :status]).merge(user_id: current_user.id)
  end

end
