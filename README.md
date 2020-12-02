# README テーブル設計

## users テーブル
| Column          | Type   | Options                   |
|-----------------|--------|---------------------------|
| nick_name       | string | null: false               |
| email           | string | null: false, unique: true |
| password        | string | null: false               |
| first_name      | string | null: false               |
| last_name       | string | null: false               |
| first_name_kana | string | null: false               |
| last_name_kana  | string | null: false               |
| birth_date      | date   | null: false               |

### Association
- has_many :items
- has_many :purchases

## items テーブル
| Column            | Type       | Options                        |
|-------------------|------------|--------------------------------|
| name              | string     | null: false                    |
| text              | string     | null: false                    |
| category_id       | integer    | null: false                    |
| status_id         | integer    | null: false                    |
| delivery_fee_id   | integer    | null: false                    |
| shipping_place_id | integer    | null: false                    |
| shipping_day_id   | integer    | null: false                    |
| price             | integer    | null: false                    |
| user_id           | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchase

## purchases テーブル
| Column     | Type      | Option                          |
|------------|-----------|---------------------------------|
| user_id    | references | null: false, foreign_key: true |
| item_id    | references | null: false, foreign_key: true |


### Association
belongs_to :user
belongs_to :item
has_one :address

## addresses テーブル
| Column        | Type       | Option                         |
|---------------|------------|--------------------------------|
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| block         | string     | null: false                    |
| building      | string     |                                |
| phon_number   | string     | null: false                    |
| purchase_id   | references | null: false, foreign_key: true |

### Association
belongs_to :purchase