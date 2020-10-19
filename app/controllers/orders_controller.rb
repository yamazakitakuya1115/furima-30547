class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    binding.pry
  end
end
