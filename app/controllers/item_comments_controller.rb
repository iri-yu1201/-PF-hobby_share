# frozen_string_literal: true

class ItemCommentsController < ApplicationController
  def create
    @item = Item.find(params[:item_id])
    @comment = @item.item_comments.new(item_comment_params)
    @comment.user_id = current_user.id
    @comment.save!
    render :index
  end

  def destroy
    @comment = ItemComment.find(params[:id])
    @comment.destroy!
    render :index
  end

  private

  def item_comment_params
    params.require(:item_comment).permit(:comment, :user_id, :item_id)
  end
end
