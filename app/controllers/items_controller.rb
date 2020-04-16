class ItemsController < ApplicationController

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
    @item = Item.find(params[:id])
    @user = User.find(params[:id])
  end

  def destroy
    
  end

  def edit 

  end

  

  def purchase
    @item = Item.find(params[:id])
  end
  private
  def item_params
    params.require(:item).permit(:name, :price, :explain, :postage, :brand, :category, :prefecture_id, :shipping_date, :item_status, item_images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def user_params
    params.require(:user).premit(:buyer_id, :exhibitor_id)
  end
end
