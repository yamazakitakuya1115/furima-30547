FactoryBot.define do
  factory :item do
    association :user

    after(:build) do |picture|
      picture.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

    name { 'testcode洋服' }
    explain { 'testcode昨年買ったコートです。' }
    category_id { 1 }
    status_id { 1 }
    delivery_id { 1 }
    prefecture_id { 1 }
    schedule_id { 1 }
    price { 10_000 }
  end
end