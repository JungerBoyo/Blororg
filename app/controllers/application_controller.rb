class ApplicationController < ActionController::Base
  before_action :load_categories

  def load_categories
    @categories = Category.all
  end 
end
