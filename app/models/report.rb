class Report < ApplicationRecord
  belongs_to :user
  belongs_to :item

  with_options numericality: { other_than: 0, message: 'を選択してください' } do
    validates :kind_id
  end
end