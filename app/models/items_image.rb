class ItemsImage < ApplicationRecord
  mount_uploader :src, ImageUploader
  belongs_to :item
end
]