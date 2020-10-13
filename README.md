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
| date        | string  | null: false |

### Association
- has_many :items
- has_one :buyer
- has_many :buyer_items

## items テーブル
| Column        | Type       | Options                        |
| --------------| ---------- | ------------------------------ |
| name          | string     | null: false                    |
| explain       | text       | null: false                    |
| category_id   | integer    | null: false                    |
| status_id     | integer    | null: false                    |
| delivery_id   | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| days_id       | integer    | null: false                    |
| price         | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

### Associations
- belongs_to :user
- has_one :buyer_item
- belongs_to :buyer, through: buyer_item

## buyers テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| buyer_item     | references | null: false, foreign_key: true |

### Associations
- belongs_to :user
- has_many :buyer_items
- has_many :items, through: buyer_items

## buyer_items テーブル
| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Associations
- belongs_to :user
- belongs_to :buyer
- belongs_to :item