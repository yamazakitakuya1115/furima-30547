class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to action: :index
    else
      render :show
    end
  end

  private

  def order_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end

end
