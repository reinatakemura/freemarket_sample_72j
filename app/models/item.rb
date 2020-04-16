class Item < ApplicationRecord
  

  # 後に設定するためコメントアウトにしています
  # has_many :comments
  # has_many :messages
  has_many :item_images, dependent: :destroy
  accepts_nested_attributes_for :item_images, allow_destroy: true
  # has_one :late
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :categry
  # has_one :late
  belongs_to :user

  # belongs_to :brand
  has_one :buyer
  # def item_images
  #   return ItemsImage.find_by(item_id: self.id)
  # end

    # itemモデルとuserモデルのアソシエーションはうまくいっている、参考までに残しているが、最後には削除する
  # def user
  #   return User.find_by(id: self.user_id)
  # end

  validates :name,            presence: true
  validates :price,           presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :explain,         presence: true
  validates :postage,         presence: true
  validates :prefecture,      presence: true
  validates :shipping_date,   presence: true
  validates :category,        presence: true
  validates :item_status,     presence: true
end