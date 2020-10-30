class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:show, :favorite]
  before_action :move_to_index, only: :favorite

  def show
    @user = User.find(current_user.id)
  end

  def favorite
    @items = current_user.favorites.order('created_at DESC')
  end

  def sell
    @user = User.find(params[:user_id])
    @items = Item.where(user_id: @user.id).order('created_at DESC')
  end

  private

  def move_to_index_show
    user = User.find(params[:id])
    unless current_user.id == user.id
      redirect_to root_path
    end
  end

  def move_to_index
    user = User.find(params[:user_id])
    unless current_user.id == user.id
      redirect_to root_path
    end
  end

end