class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new permitted_params.merge(user: current_user)
    if @post.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private

  def permitted_params
    params.require(:post).permit(:title, :body)
  end
end
