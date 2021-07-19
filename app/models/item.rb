# frozen_string_literal: true

class Item < ApplicationRecord
  attachment :photo

  belongs_to :user
  has_many :item_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :title, presence: true
  validates :detail, presence: true
  validates :photo, presence: true

  def self.search(keyword)
    Item.where(['title like? OR detail like?', "%#{keyword}%", "%#{keyword}%"])
  end
end
