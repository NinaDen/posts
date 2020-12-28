class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = CreatePost.call(current_user, permitted_params)
    if @post.errors.any?
      render :new
    else
      redirect_to action: :index
    end
  end

  private

  def permitted_params
    params.require(:post).permit(:title, :body)
  end
end
