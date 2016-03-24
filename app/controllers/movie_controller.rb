class MovieController < ApplicationController

  before_action :find_movie, only: [:show, :edit, :update, :destroy]

  def index
    if params[:type] == 'newest'
      @movies = Movie.order(created_at: :DESC).includes(:user).page(params[:page]).per(8)
    elsif params[:type] == 'popular'
      @movies = Movie.order(likes_count: :DESC).includes(:user).page(params[:page]).per(8)
    else
      @movies = Movie.all.includes(:user).page(params[:page]).per(8)
    end
  end

  def new
    @movie = Movie.new
    @movie.thumbnails.build
  end

  def create
    Movie.create(movie_params).valid? ?
      ( redirect_to :root, success: '投稿が完了しました' ) :
      ( redirect_to :back, warning: '投稿できませんでした。タイトルとキャッチコピー、コンセプトを入力してください' )
  end

  def show
    @comment = Comment.new
    @comments = @movie.comments.order(created_at: :DESC)
  end


  def edit
  end

  def update
    @movie.update(movie_params) ?
      ( redirect_to :root, success: '更新しました' ) :
      ( redirect_to :back, warning: '更新できませんでした。タイトルとサムネイル画像を入力してください' )
  end

  def destroy
    @movie.user_id == current_user.id ?
      ( @movie.destroy
      redirect_to :root, success: '作品を削除しました' ) :
      ( redirect_to :back, warning: '作品の削除ができませんでした、ログインした後に再度実行してください' )
  end

  private
    def movie_params
      params.require(:movie).permit(:title, :copy, :concept, thumbnails_attributes: [:id, :title, :status]).merge(user_id: current_user.id)
    end

    def find_movie
      @movie = Movie.find(params[:id])
    end

end
