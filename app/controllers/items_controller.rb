# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :authenticate_user!, except: %i(index search)

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.user_id = current_user.id
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  def index
    @items = Item.page(params[:page]).reverse_order
  end

  def search
    @items = Item.search(params[:keyword]).page(params[:page]).reverse_order
    @keyword = params[:keyword]

    render 'index'
  end

  def show
    @item = Item.find(params[:id])
    @comment = ItemComment.new
    @comments = @item.item_comments.order(created_at: :desc)
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy!
    redirect_to user_path(current_user)
  end

  private

  def item_params
    params.require(:item).permit(:title, :detail, :photo)
  end
end
