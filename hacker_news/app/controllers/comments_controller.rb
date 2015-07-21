class CommentsController < ApplicationController
  # if there were more actions here, you could do a before_action only on new and create
  # something like before_action require_logged_in, only: [:new, :create]
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
    # error handling
    redirect_to post_path(post)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :post_id, :user_id)
  end
end
