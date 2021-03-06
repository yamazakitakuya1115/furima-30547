class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :schedule

  belongs_to :user
  has_one_attached :image
  has_one :order
  has_many :comments, dependent: :destroy
  has_many :favorites
  has_many :reports

  with_options presence: true do
    validates :image
    validates :name, length: { maximum: 40 }
    validates :explain, length: { maximum: 1000 }
  end

  with_options numericality: { other_than: 0, message: 'を選択してください' } do
    validates :category_id, :status_id, :delivery_id, :prefecture_id, :schedule_id
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'は300〜9,999,999円に設定してください' }

  def self.search(search)
    if search != ''
      Item.where('name LIKE(?)', "%#{search}%")
    else
      Item.all
    end
  end

  def self.back_item(back_item)
    Item.where('id < ?', back_item.id).order('id DESC').first
  end

  def self.front_item(front_item)
    Item.where('id > ?', front_item.id).order('id ASC').first
  end
end
