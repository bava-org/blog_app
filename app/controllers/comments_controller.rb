class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_comment, only: [:destroy]
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user = current_user
    if @comment.save
     redirect_to @post
    else
      flash[:notice]= 'Error in comment creation'
      render posts_path
    end
  end

  def destroy
    if @comment.destroy
      redirect_to @post
    else
      flash[:notice]= 'error in comment creation'
      render posts_path
    end
  end

  private

  def find_comment
    @comment = Comment.find_by_id(params[:id])
    @post = @comment.post
  end

  def comment_params
    params.require(:comment).permit(:description)
  end
end
