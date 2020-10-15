class ItemsController < ApplicationController
  def index
  end

  def new
  end

  def create
    binding.pry
    @user = User.create(user_params)
    if @user.valid?
      @user.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :email, :password, :first_kanji, :last_kanji, :first_kana, :last_kana, :birthday)
  end
end
