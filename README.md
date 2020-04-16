# README

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
|buyer_id|integer|null: false|

### Association
- has_many comments
- belongs_to category
- belongs_to user
- belongs_to brand
- has_many messages
- has_many item_images
- has_one late


## item_imagesテーブル
|column|Type|Options|
|------|----|-------|
|image|string|null: false|
|item_id|integer|null: false, foreign_key: true|

### Association
- belongs_to item


## profielesテーブル
|column|Type|Options|
|------|----|-------|
|nickname|string|null: false, index:true|
|user_icon|string||
|profile_text|text||
|late_count|integer||

### Association
- has_many items
- has_many comments
- has_many messages
- has_many lates
- has_one address
- has_one profiels


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
- belongs_to user


## commentsテーブル
|column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|text|text|null: false|

### Association
- belongs_to user
- belongs_to item 


## latesテーブル
|column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|text|text||
|late|integer||

### Association
- belongs_to user
- belongs_to item


## categoriesテーブル
|column|Type|Options|
|------|----|-------|
|name|string|null: false|

### Association
- has_many items


## messagesテーブル
|column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|item_id|integer|null: false, foreign_key: true|
|text|text|null: false|

### Association
- belongs_to user
- belongs_to item


## addressesテーブル
|column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|zip_code|integer|null: false, index: false|
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
|number|integer|null: false|
|expiration|date|null: false|
|security_code|integer|null: false|


### Association
- belongs_to user