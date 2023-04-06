class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
    if params[:tag].present?
      @microposts = @microposts.tagged_with(params[:tag])
    end
    @microposts = @microposts.paginate(page: params[:page])
  end
end
