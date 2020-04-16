class TopPageController < ApplicationController
  def index
    @items = Item.includes(:item_images).order(created_at: :desc)
    @item = Item.find_by(id: params[:id])
    @brands = Brand.order(created_at: :desc)
    @parents = Category.all.order("id ASC").limit(13)
    @brands = @items.where(brand: "シャネル").order(created_at: :desc)
    @images = ItemImage.order(created_at: :desc)
  end

end
