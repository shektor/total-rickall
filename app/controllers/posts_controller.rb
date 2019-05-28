class PostsController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
    @post = Post.last
  end

  def new; end

  def create
    @user = User.find(session[:user_id])
    @post = @user.posts.create(post_params)
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:picture, :description)
  end
end
