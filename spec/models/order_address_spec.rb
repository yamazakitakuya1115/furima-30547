require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it '正しく情報が入力されていれば保存できること' do
      expect(@order_address).to be_valid
    end

    it 'クレジットカード情報が正しくなければ保存できないこと' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("クレジットカード情報を入力してください")
    end

    it '郵便番号が入力されていなければ保存できないこと' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("郵便番号を入力してください")
    end

    it '郵便番号にハイフンが含まれていなければ保存できないこと' do
      @order_address.postal_code = "1234567"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("郵便番号が正しくありません")
    end

    it '郵便番号が正しくなければ保存できないこと' do
      @order_address.postal_code = "12345-67"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("郵便番号が正しくありません")
    end

    it '都道府県が選択されていなければ保存できないこと' do
      @order_address.prefecture_id = 0
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("都道府県を選択してください")
    end

    it '市区町村が入力されていなければ保存できないこと' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("市区町村を入力してください")
    end

    it '番地が入力されていなければ保存できないこと' do
      @order_address.house_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("番地を入力してください")
    end

    it '電話番号が入力されていなければ保存できないこと' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("電話番号を入力してください")
    end

    it '電話番号にハイフンがあると保存できないこと' do
      @order_address.phone_number = "090-1234-5678"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("電話番号が正しくありません")
    end

    it '電話番号が正しくなければ保存できないこと' do
      @order_address.phone_number = "1234567890"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("電話番号が正しくありません")
    end
  end
end
