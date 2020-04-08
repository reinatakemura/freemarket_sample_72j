class ItemsImage < ApplicationRecord
  belongs_to :item, dependent: :destroy
end
