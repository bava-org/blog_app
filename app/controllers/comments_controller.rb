class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
     redirect_to @post
    else
      flash[:notice]= 'Error'
    end
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:description)
  end
end
