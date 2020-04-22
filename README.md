# README

reina

## freemarket_sample_72j

## itemsテーブル
|column|Type|Options|
|------|----|-------|
|name|string|null: false, index:true|
|price|string|null: false,index:true|
|explain|text|null: false|
|postage|integer|nullfalse|
|region|string|null:false|
|prefecture_id|integer|null:false|
|shipping_date|integer|null: false|
|brand|integer|null:false|
|category_id|integer|null:false, foreign_key: true|
|user_id|integer|null:false, foreign_key: true|
|item_status|string|null: false|

### Association
- belongs_to category
- belongs_to user
- has_many item_images
- has_many buyers


## item_imagesテーブル
|column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to item


## usersテーブル
|column|Type|Options|
|------|----|-------|
|first_name|string|null: false|
|last_name|string|null: false|
|first_name_kana|string|null: false|
|last_name_kana|string|null: false|
|phone_number|integer|null: false, unique: true|
|birthday|datetime|null: false|
|user_id|integer|null: false, foreign_key: true|

### Association
- has_many items
- has_many buyers

## categoriesテーブル
|column|Type|Options|
|------|----|-------|
|name|string|null: false|
|ancestry|string|index: true|

### Association
- has_many items


## addressesテーブル
|column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|zip_code|integer|null: false|
|city|string|null: false|
|house_number|string|null: false|
|building|string|null: false|
|prefecture_id|integer|null: false|
|phone_number|integer|null: false|
|last_name|string|null: false|
|first_name|string|null: false|
|last_name_hurigana|string|null: false|
|first_name_hurigana|string|null: false|

### Association
- belongs_to user


## cardsテーブル
|column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|card_id|integer|null: false|
|customer|integer|null: false|


### Association
- belongs_to user


## buyersテーブル
|column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to user
- belongs_to item
