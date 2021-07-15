class FavoritesController < ApplicationController
  def create
    @favorite = current_user.favorites.create(item_id: params[:item_id])
    @favorite.save
    @item = Item.find(params[:item_id])
  end

  def destroy
    @item = Item.find(params[:item_id])
    @favorite = current_user.favorites.find_by(item_id: @item.id)
    @favorite.destroy
  end

end
