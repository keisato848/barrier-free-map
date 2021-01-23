# README
* Ruby version
6.0.0

## usersテーブル
|columns|types|options|
|-|-|-|
|nickname|string|null:false|
|mail_address|string|null: false|
|type|integer|null: false, ActiveHash|
|profile|text|

### association
- has_many :items
- has_many :comments
- has_one :subscribe

## placesテーブル
|columns|types|Options|
|-|-|-|
|name|string|null: false|
|category|integer|ActiveHash|
|parking|integer|ActiveHash|
|restroom|integer|ActiveHash|
|elevator|integer|ActiveHash|
|sheet|integer|ActiveHash|
|expiration|text||
|user|reference|null: false, foreign_key: true|

### association
- belongs_to :user
- has_many :comments

## commentsテーブル
|columns|types|options|
|-|-|-|
|text|text|null: false|
|user|reference|null: false, foreign_key: true|
|places|reference|null: false, foreign_key: true|

## subscribeテーブル
|columns|types|options|
|-|-|-|
|month|integer|options|
|user|refelences|null: false, foreign_key: true|

### association
- belongs_to :user
- belongs_to :place
- belongs_to :user

