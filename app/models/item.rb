class Item < ApplicationRecord
  has_many :comments
  has_many :messages
  has_many :item_images, dependent: :destroy
  belongs_to :category
  belongs_to :user
  belongs_to :brand
  has_one :late
end
