class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|

      t.string  :name,          null: false, index:true
      t.string  :price,         null: false, index:true
      t.text    :explain,       null: false
      t.integer :postage,       null: false
      t.string  :region,        null: false
      t.string  :state,         null: false
      t.integer :shipping_date, null: false
      # t.integer :size

      # t.integer :brand_id,      null: false
      t.integer :category_id,   null: false
      t.references :user,       null: false

      t.timestamps
      # master_branchへのmerge後、コメントアウトを外します
    end
  end
end
