class FavoritesController < ApplicationController
  def create
    micropost = Micropost.find(params[:micropost_id])
    current_user.fav(micropost)
    flash[:success] = '投稿にいいねをしました。'
    redirect_back(fallback_location: root_path)
  end

  def destroy
    micropost = Favorite.find(params[:id]).micropost
    current_user.unfav(micropost)
    flash[:success] = '投稿からいいねを削除しました。'
    redirect_back(fallback_location: root_path)
  end
end
