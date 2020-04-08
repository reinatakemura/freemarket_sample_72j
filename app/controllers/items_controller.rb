class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def create
    Item.create(item_params)
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to root_path
  end

  def sample_show

  end

  def sample_show2

  end
  
  private
  def item_params
    params.permit(:name, :price, :explain, :postage, :region, :state, :shopping_date,:size, :brand_id, :category_id, :user_id, :item_status)
  end

end
