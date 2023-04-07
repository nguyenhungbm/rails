class CommentsController < ApplicationController

  # POST /comments or /comments.json
  def create
    micropost = Micropost.find_by(params[:id])
    @comment = micropost.comments.build(comment_params)
    @comment.commenter_id = current_user.id
    @comment.save
    redirect_to root_url
  end

  def destroy
    @comment = Comment.find_by(params[:id])
    @comment.destroy
    flash[:success] = "Comment deleted"
    redirect_to request.referrer || root_url
  end

  private

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:commenter_id, :body, :micropost_id)
  end
end
