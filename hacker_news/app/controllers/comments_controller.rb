class CommentsController < ApplicationController

  def new
    require_logged_in
    @comment = Comment.new
    @post = Post.find_by(id: params[:id])
    @user = User.find_by(id: session[:user_id])
  end

  def create
    require_logged_in
    user = User.find_by(id: session[:user_id])
    post = Post.find_by(id: params[:post_id])
    comment = Comment.new(comment_params)
    comment.user = user
    comment.post = post
    comment.save!
    redirect_to post_path(post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end
end
