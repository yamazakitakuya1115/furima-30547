class AddressesController < ApplicationController
  def create
    Address.create(address_params)
  end

  private

  def address_params
    params.require(:address).permit(:postal_code, :prefecture_id, :city, :house_number, :building_number, :phone_number)
  end
end
