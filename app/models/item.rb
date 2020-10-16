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

  validates :category_id, numericality: { other_than: 0, message: "を選択してください" }
  validates :status_id, numericality: { other_than: 0, message: "を選択してください"  }
  validates :delivery_id, numericality: { other_than: 0, message: "を選択してください"  }
  validates :prefecture_id, numericality: { other_than: 0, message: "を選択してください"  }
  validates :schedule_id, numericality: { other_than: 0, message: "を選択してください"  }
  # 販売価格に関するバリデーション（300~9,999,999円の範囲で可）
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "は300〜9,999,999円に設定してください"}
end