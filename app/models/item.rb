class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :schedule
  belongs_to :user
  has_one_attached :image

  validates :name, :explain, :category, :status, :delivery, presence: true

  validates :category_id, numericality: { other_than: 0 }
  validates :status_id, numericality: { other_than: 0 }
  validates :delivery_id, numericality: { other_than: 0 }
  validates :prefecture_id, numericality: { other_than: 0 }
  validates :schedule_id, numericality: { other_than: 0 }
end