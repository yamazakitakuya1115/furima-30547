class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 新規登録時のバリデーション
  with_options presence: true do
    validates :nickname, :birthday
    validates :first_kanji, :last_kanji, format: { with: /\A[ぁ-んァ-ン一-龥]/, message: 'は全角文字を使用してください' }
    validates :first_kana, :last_kana, format: { with: /\A[ァ-ヶー－]+\z/, message: 'は全角カタカナを使用してください' }
    PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
    validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  end

  has_many :items
  has_many :orders
  has_many :comments
  has_many :favorites
end
