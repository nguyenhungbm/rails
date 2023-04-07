class CommentsController < ApplicationController
  before_action :authorized

  def new
    @comment = Comment.new(parent_id: params[:parent_id])
  end

  def create
    micropost = Micropost.find_by(params[:id])
    @comment = micropost.comments.build(comment_params)
    @comment.commenter_id = current_user.id
    @comment.save
    redirect_to micropost
  end

  def destroy
    @comment = Comment.find_by(params[:id])
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to request.referrer || root_url
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter_id, :body, :micropost_id, :parent_id)
  end
end
