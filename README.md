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

## items テーブル
| Column   | Type       | Options                        |
| ---------| ---------- | ------------------------------ |
| name     | string     | null: false                    |
| explain  | text       | null: false                    |
| category | string     | null: false                    |
| status   | integer    | null: false                    |
| delivery | integer    | null: false                    |
| area     | integer    | null: false                    |
| days     | integer    | null: false                    |
| price    | integer    | null: false                    |
| user     | references | null: false, foreign_key: true |

### Associations
- belongs_to :user
- belongs_to :buyer_item
- belongs_to :buyer, through: buyer_item

## buyers テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null: false                    |
| prefectures    | integer    | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone_number   | string     | null: false                    |
| user           | references | null: false, foreign_key: true |

### Associations
- belongs_to :user
- has_many :buyer_items
- has_many :items, through: buyer_items

## buyer_items テーブル
| Column | Type       | Option                         |
| ------ | ---------- | ------------------------------ |
| buyer  | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Associations
- belongs_to :buyers
- has_one :item