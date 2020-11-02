class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @item = Item.find(params[:item_id])
    favorite = Favorite.create(favorite_params)
  end

  def destroy
    @item = Item.find(params[:item_id])
    favorite = Favorite.find_by(item_id: params[:item_id], user_id: current_user.id)
    favorite.destroy
  end

  private

  def favorite_params
    params.permit.merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
