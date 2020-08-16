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
| category        | integer | null: false |
| status          | integer | null: false |
| shipping_charge | integer | null: false |
| shipping_area   | integer | null: false |
| shipping_days   | integer | null: false |
| price           | integer | null: false |
| user_id         | integer | null: false |

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
