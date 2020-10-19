class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    order = Order.create(order_params)
    Address.create(address_params(order))
    redirect_to root_path
  end

  private

  def order_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

  def address_params(order)
    params.permit(:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(order_id: order.id)
  end

end
