class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    unless @post.save
      @errors = @post.errors.full_messages
      render :new
    end
    redirect_to posts_path
  end

  def update
    @post = Post.find(params[:id])
    unless @post.update(post_params)
      @errors = @post.errors.full_messages
      render :edit
    end
    redirect_to @post
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def new
    @post = Post.new
  end

  private

  def post_params
    params.require(:post).permit(:title, :body)
  end
end
