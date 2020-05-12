class ItemsController < ApplicationController
  def index
    @items = Item.limit(10).order('created_at DESC')
  end

  def show
    @items=Item.all.includes(:item_images).order('created_at DESC')
    @url = request.url
  end

  def new
    @item = Item.new
    @item.item_images.build
  end

  def create
    @item = Item.new(item_params)
    @item.save
  end

  def edit
    # @items = Item.find(params[:id])
    # @items.save
  end

  private
  def item_params
    params.require(:item).permit(:name, :description, :price, item_images_attributes: [:image])
  end
end
