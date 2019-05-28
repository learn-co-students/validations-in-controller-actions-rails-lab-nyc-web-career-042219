class PostsController < ApplicationController
  before_action :set_post!, only: [:show, :edit, :update]

  def show
    @post = Post.find(params[:id])
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post.update(post_params)
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      flash[:notice] = @post.errors.messages
      render :edit
    end
  end

  private

  def post_params(*args)
    params.permit(:category, :content, :title)
  end

  def set_post!
    @post = Post.find(params[:id])
  end
end
