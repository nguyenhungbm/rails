class StaticPagesController < ApplicationController
  before_action :authorized, only: [:show, :new, :edit]

  def index
    if logged_in?
      @micropost = current_user.microposts.build
      @feed_items = current_user.microposts.paginate(page: params[:page])
    end
  end

  def show
  end

  def new
  end

  def edit
  end
end
