# README テーブル設計

## users テーブル
| Column    | Type   | Options                   |
|-----------|--------|---------------------------|
| nick_name | string | null: false               |
| email     | string | null: false, unique: true |
| password  | string | null: false               |

### Association
- has_many :items
- has_many :purchases
- has_one :profile

## profiles テーブル
| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| first_name      | string     | null: false                    |
| last_name       | string     | null: false                    |
| first_name_kana | string     | null: false                    |
| last_name_kana  | string     | null: false                    |
| birth_date      | date       | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association
- belongs_to :user

## items テーブル
| Column         | Type       | Options                        |
|----------------|------------|--------------------------------|
| image          |            | null: false                    |
| name           | string     | null: false                    |
| text           | string     | null: false                    |
| category       | string     | null: false                    |
| status         | string     | null: false                    |
| delivery_fee   | integer    | null: false                    |
| shipping_place | string     | null: false                    |
| shipping_day   | date       | null: false                    |
| price          | integer    | null: false                    |
| user_id        | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchase

## purchases テーブル
| Column     | Type      | Option                          |
|------------|-----------|---------------------------------|
| user_id    | references | null: false, foreign_key: true |
| item_id    | references | null: false, foreign_key: true |
| created_at | date       | nul: false                     |

### Association
belongs_to :user
belongs_to :item
has_one :address

## addresses テーブル
| Column      | Type       | Option                         |
|-------------|------------|--------------------------------|
| post_code   | string     | null: false                    |
| prefecture  | string     | null: false                    |
| city        | string     | null: false                    |
| block       | string     | null: false                    |
| building    | string     | null: false                    |
| phon_number | integer    | null: false                    |
| purchase_id | references | null: false, foreign_key: true |

### Association
belongs_to :purchase