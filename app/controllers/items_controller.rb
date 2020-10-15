class ItemsController < ApplicationController
  def index
  end

  def create
    binding.pry
    User.create(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :first_kanji, :last_kanji, :first_kana, :last_kana, :birthday)
  end
end
