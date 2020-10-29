class FavoritesController < ApplicationController

  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    favorite = Favorite.create(favorite_params)
    redirect_to "/items/#{favorite.item.id}"
  end

  def destroy
    favorite = Favorite.find_by(item_id: params[:item_id], user_id: current_user.id)
    favorite.destroy
    redirect_to item_path(favorite.item_id)
  end

  private

  def favorite_params
    params.permit().merge(user_id: current_user.id, item_id: params[:item_id])
  end

end