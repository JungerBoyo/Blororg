class ProfileController < ApplicationController
  before_action :set_user, only: %i[ show ]

  def show
    @posts = Post.where(user_id: params[:id])
  end

	def set_user
		@user = User.find(params[:id])
	end
end