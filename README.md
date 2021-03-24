# アプリ名
furima
# 概要
ユーザー登録機能、商品出品機能、出品商品の編集と削除、商品購入（クレジットカード決済）機能を実装
# DEMO
## トップページ
![toppage](https://i.gyazo.com/8a8ba8633579d8f8c9072f94c783ace0.png)
## 購入画面
![購入画面](https://i.gyazo.com/eaa8c92a916a2bbfd5a3d6f941703b58.png)
## 商品詳細画面
![商品詳細](https://i.gyazo.com/95400ce98f5b1f3c430a96ddeadc5652.png)
# 開発環境
## バックエンド
Ruby,Ruby on rails
## フロントエンド
HTML CSS
## データベース
MySQL,SequelPro
## インフラ
AWS（S3）
## テスト
RSpec
## エディタ
VSCode
# DB設計
## users テーブル
| Column             | Type   | Options                   |
|--------------------|--------|---------------------------|
| nick_name          | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birth_date         | date   | null: false               |

### Association
- has_many :items
- has_many :purchases

## items テーブル
| Column          | Type       | Options                        |
|-----------------|------------|--------------------------------|
| name            | string     | null: false                    |
| text            | string     | null: false                    |
| category_id     | integer    | null: false                    |
| status_id       | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| prefecture_id   | integer    | null: false                    |
| shipping_day_id | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association
belongs_to :user
has_one :purchase

## purchases テーブル
| Column  | Type       | Option                         |
|---------|------------|--------------------------------|
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |


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
| purchase      | references | null: false, foreign_key: true |

### Association
belongs_to :purchase
