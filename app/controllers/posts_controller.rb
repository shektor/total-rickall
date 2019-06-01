class PostsController < ApplicationController
  def index
    @user = User.find_by(id: session[:user_id])
    @posts = Post.all
  end

  def new; end

  def create
    @user = User.find(session[:user_id])
    @post = @user.posts.create(post_params)

    redirect_to posts_url
  end

  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:picture, :description)
  end
end
