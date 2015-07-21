class PostsController < ApplicationController

  def new
    require_logged_in
    @user = User.find_by(id: session[:user_id])
    @post = Post.new
  end

  def create
    require_logged_in
    user = User.find_by(id: session[:user_id])
    post = Post.new(post_params)
    post.user = user
    post.save!
    redirect_to posts_path
  end

  def index
    if current_user
    @user = User.find_by(id: session[:user_id])
    @posts = Post.where(user_id: session[:user_id])
    else
    redirect_to login_path
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    # Use your associations
    # @user = @post.user
    @user = User.find_by(id: @post.user_id)
    # @comments = @post.comments
    @comments = Comment.where(post_id: @post.id)
  end

  def edit
    require_logged_in
    @post = Post.find_by(id: params[:id])
  end

  def update
    require_logged_in
    post = Post.find_by(id: params[:id])
    post.update(post_params)
    redirect_to post_path(post)
  end

  def destroy
    require_logged_in
    # This line is unnecessary right now but could be useful if you are comparing @user.id to @post.id to make sure only the post's author can destroy it.
    # @user = User.find_by(id: current_user.id)
    post = Post.find_by(id: params[:id]).destroy
    # see note in Post model to also delete associated comments
    # You would need to break that up into two pieces for error handling - find post first, then "if post.destroy (do stuff) else (error handling)"
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end

end
