require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品された商品情報の保存' do
    before do
      @item = FactoryBot.build(:item)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item).to be_valid
    end

    it '商品画像を1枚つけることが必須であること' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("出品画像を入力してください")
    end

    it '商品名が必須であること' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end

    it '商品名が41文字以上だと出品できないこと' do
      @item.name = "a"*41
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名は40文字以内で入力してください")
    end

    it '商品の説明が必須であること' do
      @item.explain = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明を入力してください")
    end

    it '商品の説明が1001文字以上だと出品できないこと' do
      @item.explain = "a"*1001
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明は1000文字以内で入力してください")
    end

    it 'カテゴリーの情報が必須であること' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
    end

    it '商品の状態についての情報が必須であること' do
      @item.status_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態を選択してください")
    end

    it '配送料の負担についての情報が必須であること' do
      @item.delivery_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
    end

    it '発送元の地域についての情報が必須であること' do
      @item.prefecture_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域を選択してください")
    end

    it '発送までの日数についての情報が必須であること' do
      @item.schedule_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
    end

    it '価格についての情報が必須であること' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格は300〜9,999,999円に設定してください")
    end

    it '価格が300円未満だと出品できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格は300〜9,999,999円に設定してください")
    end

    it '価格が10000000円以上だと出品できないこと' do
      @item.price = 10000000
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格は300〜9,999,999円に設定してください")
    end

    it '販売価格は半角数字のみ保存可能であること' do
      @item.price = "３０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("販売価格は300〜9,999,999円に設定してください")
    end

  end
end