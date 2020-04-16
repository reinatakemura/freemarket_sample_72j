class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string      :name,            null: false,        index:true
      t.integer     :price,           null: false,        index:true
      t.text        :explain,         null: false
      t.string      :postage,         null: false
      t.integer     :prefecture_id
      t.string      :shipping_date,   null: false
      t.string      :brand
      t.integer     :category
      t.string      :item_status,      null: false
      # t.integer :brand_id,      null: false
      t.integer :category_id,   null: false
      t.references :user,       null: false

      t.timestamps
      # master_branchへのmerge後、コメントアウトを外します
    end
  end
end
