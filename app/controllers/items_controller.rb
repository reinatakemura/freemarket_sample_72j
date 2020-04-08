class ItemsController < ApplicationController
  def index
    @items = Item.all.includes(:images).order('created_at DESC')
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
  end

  def sample_show

  end

  def sample_show2

  end
  
  private

  def item_params
    params.require(:item).permit(:name, :price, :explain, :postage, :region, :state, :shipping_date, :size,:brand_id, :category_id, :user_id, :item_status, images_attributes: [:src])
  end

end
