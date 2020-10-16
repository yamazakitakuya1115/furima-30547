class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    binding.pry
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explain, :category_id, :status_id, :delivery_id, :prefecture_id, :schedule_id, :price).merge(user_id: current_user.id)
  end

end