class CommentsController < ApplicationController
  def create
    @user = User.find(session[:user_id])
    @post = Post.find(params[:post_id])
    @comment = @post.comments.create!(comment_params.merge(user_id: @user.id))
    redirect_to post_url(@post)
  end

  private

  def comment_params
    params.require(:comment).permit(:message)
  end
end
