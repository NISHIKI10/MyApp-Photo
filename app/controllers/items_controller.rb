class ItemsController < ApplicationController
  before_action :move_to_index, except: :index

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.save
    redirect_to :action => :index
  end

  def show
    @item = Item.find(params[:id])
    @user = @item.user
  end

  def destroy
    item = Item.find(params[:id])
    item.delete
    redirect_to root_path
  end

  def move_to_index
    redirect_to action: :index unless user_signed_in?
  end

  private
  
  def item_params
    params.require(:item).permit(:image)
  end
end
