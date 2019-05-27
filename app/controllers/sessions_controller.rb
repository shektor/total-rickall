class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by(email: session_params[:email])
    session[:user_id] = @user.id
    redirect_to posts_url
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
