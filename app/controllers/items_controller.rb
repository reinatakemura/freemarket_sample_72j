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
  end

  def sample_show
  end

  def sample_show2

  end
  private
  def item_params
    params.permit(:)
  end

end
