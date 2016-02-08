class MovieController < ApplicationController

def index
  @movies = Movie.order(id: :DESC).includes(:user)
end

def new
  @movie = Movie.new
  @movie.thumbnails.build
end

def create
  @movie = Movie.create(create_params)
  redirect_to action: :index
end

private
  def create_params
    params.require(:movie).permit(:title, :copy, :concept, :thumbnails_attributes [:id, :thumbnail, :status]).merge(user_id: current_user.id)
  end

end
