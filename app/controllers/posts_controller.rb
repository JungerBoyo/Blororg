class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ create edit update destroy ]
  before_action :authenticate_author!, only: %i[ edit update destroy ]

  # GET /posts or /posts.json
  def index
    if (params[:category_id].present? && params[:category_id] != "0")
      @posts = Post.where(category_id: params[:category_id])
    else
      @posts = Post.all
    end

    if params[:tags_string].present?
      tags = params[:tags_string].split(/[,\s+]/).map(&:strip)
      @posts = @posts.joins(:tags).where(tags: { name: tags })
    end
  end

  # GET /posts/1 or /posts/1.json
  def show
    if @post.is_private && current_user != @post.user && !flash[:authenticated]
      respond_to do |format|
        format.html { redirect_to validate_post_password_path(@post) }
      end
    else
      respond_to do |format|
        @user = User.where(id: @post.user_id).first()
        @post.comments << Comment.where(post_id: @post.id)
        format.html
      end
    end
  end

  def enter_post_password
    @post = Post.find(params[:id])
    @password = ""
  end

  def validate_post_password
    @post = Post.find(params[:id])
    @user = User.where(id: @post.user_id).first()
    entered_password = params[:password]
  
    if @user.authenticate_post_password(entered_password)
      flash[:authenticated] = true
      flash.keep(:authenticated)
      respond_to do |format|
        format.html { redirect_to post_path(@post) }
      end
    else
      respond_to do |format|
        format.html { redirect_to validate_post_password_path(@post), alert: "Invalid password!" }
      end
    end
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    @tags_string = @post.tags.pluck(:name).join(", ")
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        if params[:tags_string].present?
          tag_names = params[:tags_string].split(/[,\s+]/).map(&:strip)
          tags = tag_names.map do |tag_name|
            Tag.find_or_create_by(name: tag_name)
          end
          @post.tags << tags
        end
        if params[:title_image].present?
          @post.title_image.attach(params[:title_image])
        end
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        if params[:title_image].present?
          @post.title_image.attach(params[:title_image])
        end
        @post = Post.find(params[:id])
        tag_names = params[:tags_string].split(/[,\s+]/).map(&:strip)
        existing_tags = @post.tags.to_a
        tag_names.each do |tag_name|
          tag = Tag.find_or_create_by(name: tag_name)
          @post.tags << tag unless @post.tags.include?(tag)
          existing_tags.delete(tag)
        end
      
        existing_tags.each do |tag|
          if tag.posts.count == 1
            tag.destroy
          else
            tag.posts.delete(@post)
          end
        end

        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url, notice: "post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end
    def authenticate_author!
      unless current_user.id == @post.user_id
        redirect_to root_path, alert: 'You are not the author of this post.'
      end
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :contents, :is_private, :user_id, :category_id, :tags_string, :title_image)
    end
end
