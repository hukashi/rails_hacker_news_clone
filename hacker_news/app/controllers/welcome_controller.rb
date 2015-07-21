class WelcomeController < ApplicationController

  def index
    if current_user
      @user = User.find_by(id: current_user.id)
      @posts = Post.all.order("created_at asc")
    else
      @posts = Post.all.order("created_at asc")
    end
  end

end
