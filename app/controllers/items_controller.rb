class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
    @front_item = Item.front_item(@item)
    @back_item = Item.back_item(@item)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to action: :index
  end

  def search
    @items = Item.search(params[:keyword]).order('created_at DESC')
    @search_word = params[:keyword]
  end

  def category
    @items = Item.where(category_id: params[:category_id]).order('created_at DESC')
    @category = Category.find_by(id: params[:category_id]).name
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explain, :category_id, :status_id, :delivery_id, :prefecture_id, :schedule_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    # 出品者ではない または 売却済みである ならばトップページへ遷移
    if current_user.id != @item.user.id || @item.order
    redirect_to action: :index 
    end
  end
end