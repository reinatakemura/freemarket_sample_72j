class TopPageController < ApplicationController
  def index
    @items = Item.order(created_at: :desc)
    @item = Item.find_by(id: params[:id])
    @brands = Brand.order(created_at: :desc)
    @parents = Category.all.order("id ASC").limit(13)
  end

end
