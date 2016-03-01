class CommentsController < ApplicationController

  def create
    @movie = Movie.find(params[:comment][:movie_id])
    @comments = @movie.comments
    @comment = Comment.create(comment_params)
  end

  private
  def comment_params
    params.require(:comment).permit(:movie_id, :text).merge(user_id: current_user.id)
  end
end
