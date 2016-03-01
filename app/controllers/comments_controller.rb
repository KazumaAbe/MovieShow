class CommentsController < ApplicationController

  def create
    @movie = Movie.find(params[:comment][:movie_id])

    @comment = Comment.new(comment_params)
    unless @comment.save
      warning: '投稿できませんでした。コメントを入力してください'
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:movie_id, :text).merge(user_id: current_user.id)
  end
end
