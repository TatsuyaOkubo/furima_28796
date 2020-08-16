# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| --------        | ------- | ----------- |
| nickname        | varchar | null: false |
| email           | varchar | null: false |
| password        | varchar | null: false |
| last_name       | varchar | null: false |
| first_name      | varchar | null: false |
| last_name_kana  | varchar | null: false |
| first_name_kana | varchar | null: false |
| birthday        | date    | null: false |

### Association

- has_many :products
- has_many :comments
- has_one :purchase

## products テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| image           | text    | null: false |
| product_name    | varchar | null: false |
| description     | text    | null: false |
| category        | varchar | null: false |
| status          | varchar | null: false |
| shipping_charge | varchar | null: false |
| shipping_area   | varchar | null: false |
| shipping_days   | date    | null: false |
| price           | int     | null: false |
| user_id         | int     | null: false |

### Association

- has_many :comments
- has_one :purchase
- belongs_to :user

## comments テーブル

| Column     | Type | Options     |
| ---------- | ---- | ----------- |
| message    | text | null: false |
| user_id    | int  | null: false |
| product_id | int  | null: false |

### Association

- belongs_to :user
- belongs_to :product

## credit テーブル

| Column          | Type | Options     |
| --------------- | ---- | ----------- |
| card_number     | int  | null: false |
| expiration_date | date | null: false |
| security_code   | int  | null: false |
| user_id         | int  | null: false |
| product_id      | int  | null: false |

### Association

- belongs_to :user
- belongs_to :product
- has_one :delivery

## delivery テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postcode      | varchar | null: false |
| prefecture_id | int     | null: false |
| city          | varchar | null: false |
| block         | varchar | null: false |
| building      | varchar | null: false |
| phone_number  | int     | null: false |
| user_id       | int     | null: false |
| product_id    | int     | null: false |
| credit_id     | int     | null: false |

### Association

- belongs_to :user
- belongs_to :product
- belongs_to :credit