class AdminController < ApplicationController
  def index
  end

  def posts
    @posts = Post.all.includes(:user, :comments)
  end

  def comments
    @comments = Comment.all.includes(:user)
  end

  def users
    @users = User.all
  end

  #--------------Category
  def categories
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create
  end
  #--------------End

  def show_post
    @post = Post.includes(:user, :comments).find(params[:id])
  end

  def show_comment
    @comment = Comment.includes(:user).find(params[:id])
  end
end
