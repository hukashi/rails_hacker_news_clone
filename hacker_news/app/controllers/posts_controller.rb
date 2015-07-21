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
    @user = User.find_by(id: @post.user_id)
    @comments = Comment.where(post_id: @post.id)
  end

  def upvote
    @post = Post.find_by(id: params[:id])
    if request.xhr? 
      @post.increment!(:vote_count)
      @total_count = @post.vote_count
      @post_id = @post.id
      render json: {total_count: @total_count, post_id: @post_id}.to_json
    else
      redirect_to root_path
    end
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
    @user = User.find_by(id: current_user.id)
    post = Post.find_by(id: params[:id]).destroy
    redirect_to posts_path
  end


  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end

end
