class ItemsController < ApplicationController
  before_action :set_item, only:[:show, :destroy, :edit, :update, :purchase, :payment]
  
  def new
    @item = Item.new
    @item.item_images.new

    #セレクトボックスの初期値設定
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化
    @category_parent_array = Category.where(ancestry: nil)
    # binding.pry
  end

  # 以下全て、formatはjsonのみ
  # 親カテゴリーが選択された後に動くアクション
  def get_category_children
    #選択された親カテゴリーに紐付く子カテゴリーの配列を取得
    # ここでfind_byを使うことでレディーしか取れてなかった
    @category_children = Category.find(params[:parent_id]).children
  end
  
  # 子カテゴリーが選択された後に動くアクション
  def get_category_grandchildren
    #選択された子カテゴリーに紐付く孫カテゴリーの配列を取得
    @category_grandchildren = Category.find(params[:child_id]).children
    # binding.pry
  end
  
  def create
    @item = Item.new(item_params)
    # binding.pry
    if @item.save
      redirect_to root_path
    else
      flash.now[:alert] = '入力に誤りがあります'
      render :new
    end
  end
  
  def show
    @items = Item.includes(:item_images).order(created_at: :desc)
    @images = ItemImage.order(created_at: :desc)
    @buyer_item = Buyer.pluck(:item_id)
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

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
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
    params.require(:item).permit(:name, :price, :explain, :postage, :brand, :category_id, :prefecture_id, :shipping_date, :item_status, item_images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def user_params
    params.require(:user).premit(:buyer_id, :exhibitor_id)
  end
  
  def set_item
    @item = Item.find(params[:id])
  end

end
  
