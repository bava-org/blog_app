class PostsController < ApplicationController
  before_action :find_post, only: [:show, :update, :destroy, :edit, :upvote, :downvote]
  before_action :authenticate_user!, except: [:index, :show]
  
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
  end

  def edit
  end

  def upvote
    @post.upvote_by current_user
    redirect_to @post
  end

  def downvote
    @post.downvote_by current_user
    redirect_to @post
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def update
    if @post.update(post_params)
      redirect_to @post
    else
      render edit_path(@post)
    end
  end

  def destroy
    if @post.destroy
      redirect_to posts_path
    end
  end

  private
  def find_post
    @post = Post.find_by_id(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
