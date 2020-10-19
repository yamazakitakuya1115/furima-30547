class Address < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :postal_code, :city, :house_number, :phone_number
  end

  validates :prefecture_id, numericality: { other_than: 0, message: 'を選択してください' }

end
