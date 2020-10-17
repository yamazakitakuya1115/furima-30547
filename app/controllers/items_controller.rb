class ItemsController < ApplicationController

  before_action :move_to_login_page, only: :new

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explain, :category_id, :status_id, :delivery_id, :prefecture_id, :schedule_id, :price).merge(user_id: current_user.id)
  end

  def move_to_login_page
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end