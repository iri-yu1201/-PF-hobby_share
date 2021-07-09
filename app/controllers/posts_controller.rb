class PostsController < ApplicationController

  def index
    @posts = Post.all.page(params[:page]).per(5)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to posts_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :detail, :photo, :user_id)
  end

end