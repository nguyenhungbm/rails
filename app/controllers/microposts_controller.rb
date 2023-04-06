class MicropostsController < ApplicationController
  before_action :authorized
  before_action :correct_user, only: :destroy

  def create
    @micropost = current_user.microposts.build(micropost_params)
    @micropost.image.attach(params[:micropost][:image])
    if @micropost.save
      flash[:success] = t("micropost.created")
      redirect_to root_url
    else
      @feed_items = current_user.microposts.paginate(page: params[:page])
      render "/"
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = t("micropost.deleted")
    redirect_to request.referrer || root_url
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :image)
  end

  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    redirect_to root_url unless @micropost
  end
end
