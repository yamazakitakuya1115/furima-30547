# テーブル設計

## users テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| nickname    | string  | null: false |
| email       | string  | null: false |
| password    | string  | null: false |
| first_kanji | string  | null: false |
| last_kanji  | string  | null: false |
| first_kana  | string  | null: false |
| last_kana   | string  | null: false |
| birthday    | date    | null: false |

### Association
- has_many :items
- has_many :orders
- has_many :comments
- has_many :favorites

## items テーブル
| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| name          | string     | null: false                    |
| explain       | text       | null: false                    |
| category_id   | integer    | null: false                    |
| status_id     | integer    | null: false                    |
| delivery_id   | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| schedule_id   | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Associations
- belongs_to :user
- has_one :order
- has_many :comments
- has_many: favorites

## addresses テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| city           | string     | null: false                    |
| house_number   | string     | null: false                    |
| building_name  | string     |                                |
| phone_number   | string     | null: false                    |
| order          | references | null: false, foreign_key: true |

### Associations
- belongs_to :order

## orders テーブル
| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Associations
- belongs_to :user
- belongs_to :item
- has_one :address

## comments テーブル
| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| text   | string     | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Associations
- belongs_to :user
- belongs_to :item

## favorites テーブル
| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| check  | boolean    | null: false, default: false    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item