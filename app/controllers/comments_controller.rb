class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ edit update destroy ]
  before_action :authenticate_user!, only: %i[ create edit update destroy ]
  before_action :authenticate_author!, only: %i[ edit update destroy ]
  
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    respond_to do |format|
      if @comment.save
        format.html { redirect_to post_url(@post), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { redirect_to post_path(@post), alert: 'Failed to create comment!' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    @editing = true
    respond_to do |format|
      format.js
    end
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    respond_to do |format|
      if @comment.update(comment_params)
        format.js
      else
        format.html { redirect_to post_path(@post), alert: 'Failed to update comment!' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    post_id = @comment.post_id
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to post_url(post_id), notice: "comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end
    def authenticate_author!
      unless current_user.id == @comment.user_id
        redirect_to root_path, alert: 'You are not the author of this comment.'
      end
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:contents, :user_id, :post_id)
    end
end
