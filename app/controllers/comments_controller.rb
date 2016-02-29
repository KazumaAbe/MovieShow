class CommentsController < ApplicationController

  def create
    @movie = Movie.find(params[:comment][:movie_id])

    @comment = Comment.new(comment_params)
    @comment.save ?
    (redirect_to movie_path(@movie)) :
    (redirect_to :back,  warning: '投稿できませんでした。コメントを入力してください')
  end

  private
  def comment_params
    params.require(:comment).permit(:movie_id, :text).merge(user_id: current_user.id)
  end
end
