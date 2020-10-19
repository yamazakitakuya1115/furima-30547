class Address < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :postal_code, :prefecture, :city, :house_number, :building_name, :phone_number
  end

  with_options numericality: { other_than: 0, message: 'を選択してください' } do
    validates :prefecture_id
  end
end
