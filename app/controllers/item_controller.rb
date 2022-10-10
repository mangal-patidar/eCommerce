class ItemController < ApplicationController
  before_action :set_item, only:[:show, :destroy]
  def show
  end

  def index
    @item = Item.all
    # GET method to get all item from database   
  end

  def new
    @item = Item.new
    # GET method for the new item form   
  end

  def create
    @item = Item.new(item_params)
     if @item.save
      flash[:notice] = 'item detail added'
      redirect_to @item
    else
      flash[:error] = 'Failed to create'
      render 'new'  
    end
  end

  def destroy
    @item.destroy
    redirect_to item_path
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
  def item_params
    params.require(:item).permit(:item_name, :item_price)
  end
end