class PostsController < ApplicationController
  def show
    #binding.pry
    @post = Post.find(params[:id])
    @comment=@post.comments.build
   end

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
    @categories=Category.all
  end

  def create
    #binding.pry
    post = Post.create(post_params)
    redirect_to post
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, category_ids:[], categories_attributes: [:name])
  end
end
