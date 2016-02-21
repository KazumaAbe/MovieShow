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
  if Movie.create(movie_params).valid?
    redirect_to :root, success: '投稿が完了しました'
  else
    redirect_to :back, warning: '投稿できませんでした。タイトルとキャッチコピー、コンセプトを入力してください'
  end
end

def edit
end

def update
  if @movie.update(movie_params)
    redirect_to :root, success: '更新しました'
  else
    redirect_to :back, warning: '更新できませんでした。タイトルとサムネイル画像を入力してください'
end

def destroy
  if movie.user_id == current_user.id
    movie.destroy
    redirect_to :root, success: '作品を削除しました'
  else
    redirect_to :back, warning: '作品の削除ができませんでした、ログインした後に再度実行してください'
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
