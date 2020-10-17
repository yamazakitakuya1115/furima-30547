require 'rails_helper'

RSpec.describe User, type: :model do
  describe '新規登録情報の保存' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user).to be_valid
    end

    it 'ニックネームが必須であること' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('ニックネームを入力してください')
    end

    it 'メールアドレスが必須であること' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('メールアドレスを入力してください')
    end

    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('メールアドレスはすでに存在します')
    end

    it 'メールアドレスは@を含む必要があること' do
      @user.email = 'abcdefg'
      @user.valid?
      expect(@user.errors.full_messages).to include('メールアドレスは不正な値です')
    end

    it 'パスワードが必須であること' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードを入力してください')
    end

    it 'パスワードは6文字以上での入力が必須であること' do
      @user.password = '123ab'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end

    it 'パスワードは半角英数字混合での入力が必須であること' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードには英字と数字の両方を含めて設定してください')
    end

    it 'パスワードは確認用を含めて2回入力すること' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認）とパスワードの入力が一致しません')
    end

    it 'パスワードをパスワード（確認用）、値の一致が必須であること' do
      @user.password = '123abc'
      @user.password_confirmation = 'abc123'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認）とパスワードの入力が一致しません')
    end

    it 'ユーザー本名（名字）が必須であること' do
      @user.first_kanji = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前（姓）を入力してください')
    end

    it 'ユーザー本名（名字）は全角での入力が必須であること' do
      @user.first_kanji = 'ｽｽﾞｷ'
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前（姓）は全角文字を使用してください')
    end

    it 'ユーザー本名（名前）が必須であること' do
      @user.last_kanji = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前（名）を入力してください')
    end

    it 'ユーザー本名（名前）は全角での入力が必須であること' do
      @user.last_kanji = 'ﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前（名）は全角文字を使用してください')
    end

    it 'ユーザー本名のフリガナ（名字）が必須であること' do
      @user.first_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前カナ（姓）を入力してください')
    end

    it 'ユーザー本名のフリガナ（名字）は全角カタカナでの入力が必須であること' do
      @user.last_kana = '鈴木'
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前カナ（名）は全角カタカナを使用してください')
    end

    it 'ユーザー本名のフリガナ（名前）が必須であること' do
      @user.last_kana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前カナ（名）を入力してください')
    end

    it 'ユーザー本名のフリガナ（名前）は全角カタカナでの入力が必須であること' do
      @user.last_kana = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include('お名前カナ（名）は全角カタカナを使用してください')
    end

    it '生年月日が必須であること' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors.full_messages).to include('生年月日を入力してください')
    end
  end
end
