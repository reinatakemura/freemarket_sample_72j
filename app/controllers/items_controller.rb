class ItemsController < ApplicationController
  before_action :set_item, only:[:show, :destroy, :purchase, :payment]
  
  def new
    @item = Item.new
    @item.item_images.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      flash.now[:alert] = '入力に誤りがあります'
      render :new
    end
  end
  
  def show
  end
  
  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show
    end
  end
  
  def edit
  end
  
  def purchase
    @address = Address.find(params[:id])
    @card = Card.where(user_id: current_user.id).first if Card.where(user_id: current_user.id).present?
    @prefecture = Prefecture.find(@address.prefecture_id)
    if @card.present?
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)
      Payjp.api_key = ENV["PAYJP_PRIVATE_KEY"]
      Payjp::Charge.create(
      amount: @item.price,
      customer: @card.customer_id,
      currency: 'jpy'
      )
    end
  end
  
  def payment
    @buyer = Buyer.new(user_id: current_user.id, item_id: params[:id])
    if @buyer.save
      redirect_to complete_path
    else
      render :purchase
    end
  end
  
  def complete
  end
  
  private
  def item_params
    params.require(:item).permit(:name, :price, :explain, :postage, :brand, :category, :prefecture_id, :shipping_date, :item_status, item_images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end
  
  def user_params
    params.require(:user).premit(:buyer_id, :exhibitor_id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

end
  
