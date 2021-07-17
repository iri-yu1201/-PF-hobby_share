class ItemsController < ApplicationController
  before_action :authenticate_user!,except:[:index, :search]
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    @item.save
    redirect_to items_path
  end

  def index
    @items = Item.page(params[:page]).reverse_order
  end
  
  def search
    @items = Item.search(params[:keyword])
    @keyword = params[:keyword]
    @items = Item.page(params[:page]).reverse_order
    render "index"
  end

  def show
    @item = Item.find(params[:id])
    @comment = ItemComment.new
    @comments = @item.item_comments.order(created_at: :desc)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to user_path(current_user)
  end

  private
  def item_params
    params.require(:item).permit(:title, :detail, :photo)
  end


end
