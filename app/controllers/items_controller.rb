class ItemsController < ApplicationController

  def new
    @item = Item.new
    @item.item_images.new

    # @parents = Category.all.order("id ASC").limit(13)
    @category_parent_array = ["---"]
    #データベースから、親カテゴリーのみ抽出し、配列化 
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    # @category_parent_array = Category.where(ancestry: nil)
    end
    
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
    params.require(:item).permit(:name, :price, :explain, :postage, :brand, :category_id, :prefecture_id, :shipping_date, :item_status, item_images_attributes: [:image, :_destroy, :id]).merge(user_id: current_user.id)
  end

  def user_params
    params.require(:user).premit(:buyer_id, :exhibitor_id)
  end
end
