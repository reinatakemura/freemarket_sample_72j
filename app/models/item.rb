class Item < ApplicationRecord
  has_many :comments
  has_many :messages
  has_many :images
  belongs_to :category
  belongs_to :user
  belongs_to :brand
  has_one :late
  accepts_nested_attributes_for :images, allow_destroy: true
end
