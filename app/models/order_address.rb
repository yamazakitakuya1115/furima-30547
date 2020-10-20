class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :order_id, :token

  with_options presence: true do
    validates :city, :house_number, :token
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'が正しくありません' }
    validates :phone_number, format: { with: /\A0\d{9,10}\z/, message: 'が正しくありません' }
  end
  validates :prefecture_id, numericality: { other_than: 0, message: 'を選択してください' }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
