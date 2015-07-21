class WelcomeController < ApplicationController

  def index
    if current_user
      @user = User.find_by(id: current_user.id)
      @posts = Post.all.reverse
      # Imagine your db had a million posts? Try using limit and order.
    else
      @posts = Post.all.reverse
    end
  end

end
