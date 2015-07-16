class UsersController < ApplicationController

  def new
    @user = @User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
    else
      flash[:errors] = user.errors.full_messages
      redirect_to new_user_post_path
  end



  private

  def user_params
    params.require(:user).permit(username:, :first_name, :last_name, :password)
  end

end
