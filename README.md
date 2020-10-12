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
| year        | integer | null: false |
| month       | integer | null: false |
| day         | integer | null: false |

### Association
- has_many :items
- has_one :buyer

## items テーブル
| Column   | Type       | Options
| ---------| ---------- | ------------------------------ |
| name     | string     | null: false                    |
| explain  | text       | null: false                    |
| category | string     | null: false                    |
| status   | string     | null: false                    |
| delivery | string     | null: false                    |
| area     | string     | null: false                    |
| date     | string     | null: false                    |
| price    | integer    | null: false                    |
| user     | references | null: false, foreign_key: true |
| buyer    | references | foreign_key: true              |

### Associations
- belongs_to :user
- has_one :buyer

## buyers テーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | integer    | null: false                    |
| prefectures    | string     | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| phone_number   | integer    | null: false                    |
| item           | references | null: false, foreign_key: true |
| user           | references | null: false, foreign_key: true |

### Associations
- belongs_to :user
- belongs_to :item