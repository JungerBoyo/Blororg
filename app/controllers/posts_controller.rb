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
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
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
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
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
      params.require(:post).permit(:title, :contents, :is_private, :user_id, :category_id, :tags_string)
    end
end
