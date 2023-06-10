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

  def create_category
    @category = Category.create(name: params[:category][:name])
    respond_to do |format|
      if @category.save
        format.html { redirect_to admin_categories_url, notice: "Category was successfully created." }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end
  #--------------End

  def show_post
    @post = Post.includes(:user, :comments).find(params[:id])
  end

  def show_comment
    @comment = Comment.includes(:user).find(params[:id])
  end
end
