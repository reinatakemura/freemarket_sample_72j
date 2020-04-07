class ItemsController < ApplicationController
  def index
    @items = Item.all.includes(:images).order('created_at DESC')
  end

  def new
    
  end

  def create
    Item.create(item_params)
  end

  def destroy
  end

  def sample_show

  end

  def sample_show2

  end
  private
  def item_params
    # params.permit(:)
  end

end
