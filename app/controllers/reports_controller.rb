class ReportsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]

  def index
  end

  def new
    @report = Report.new
    @item = Item.find_by(params[:item_id])
  end

  def create
    @report = Report.new(report_params)
    if @report.save
      redirect_to action: :index
    else
      @item = Item.find_by(params[:item_id])
      render :new
    end
  end

  private

  def report_params
    params.require(:report).permit(:kind_id, :message).merge(item_id: params[:item_id], user_id: current_user.id)
  end

end
