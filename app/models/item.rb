class Item < ApplicationRecord

  attachment :photo

  belongs_to :user
  has_many :item_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def self.search(keyword)
    Item.where(["title like? OR detail like?", "%#{keyword}%", "%#{keyword}%"])
  end

end
