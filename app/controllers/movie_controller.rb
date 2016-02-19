class MovieController < ApplicationController

  before_action :find_movie, only: [:edit, :update, :destroy]

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
end

def update
  if @movie.update(movie_params)
    redirect_to :root, success: '更新しました'
  else
    redirect_to action: :edit, warning: '更新できませんでした。タイトルとサムネイル画像を入力してください。'
end

def destroy
  movie.destroy if movie.user_id == current_user.id
  redirect_to :root, success: '作品を削除しました'
end

private
  def movie_params
    params.require(:movie).permit(:title, :copy, :concept, thumbnails_attributes: [:id, :title, :status]).merge(user_id: current_user.id)
  end

  def find_movie
    @movie = Movie.find(params[:id])
  end

end

end
