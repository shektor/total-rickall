class UsersController < ApplicationController
  def new; end

  def create
    @user = User.new(user_params)
    @user.save
    redirect_to new_session_url
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
