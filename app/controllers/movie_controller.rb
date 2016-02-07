class MovieController < ApplicationController

def index
  @movie = Movie.order(id: :DESC).includes(:user)
end

def new
  @movie = Movie.new
  #@movie.thumbnails.build
end

def create
  @movie = current_user.movies.create(create_params)
  redirect_to action: :index
end

private
  def create_params
    params.require(:movie).permit(:title, :copy, :concept).merge(user_id: current_user.id)
  end

end
