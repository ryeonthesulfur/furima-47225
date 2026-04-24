class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @forma = Forma.new
  end

  def create
    @item = Item.find(params[:item_id])
    @forma = Forma.new(order_params)
    if @forma.valid?
      @forma.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:forma).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end
end
