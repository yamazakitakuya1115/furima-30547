FactoryBot.define do
  factory :user do
    nickname { 'タロー' }
    email { 'taro@sample.com' }
    password { '123abc' }
    password_confirmation { password }
    first_kanji { '鈴木' }
    last_kanji { '太郎' }
    first_kana { 'スズキ' }
    last_kana { 'タロウ' }
    birthday { '1999-01-01' }
  end
end
