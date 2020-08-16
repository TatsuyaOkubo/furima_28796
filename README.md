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

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :products
- has_many :purchases

## products テーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| image           | string  | null: false                    |
| name            | string  | null: false                    |
| description     | text    | null: false                    |
| category        | integer | null: false                    |
| status          | integer | null: false                    |
| shipping_charge | integer | null: false                    |
| shipping_area   | integer | null: false                    |
| shipping_days   | integer | null: false                    |
| price           | integer | null: false                    |
| user_id         | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column     | Type    | Options                        |
| ---------- | ------- | ------------------------------ |
| user_id    | integer | null: false, foreign_key: true |
| product_id | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :product
- has_one :delivery

## deliveries テーブル

| Column       | Type    | Options                        |
| ------------ | ------- | ------------------------------ |
| postcode     | string  | null: false                    |
| prefecture   | integer | null: false                    |
| city         | string  | null: false                    |
| block        | string  | null: false                    |
| building     | string  | null: false                    |
| phone_number | integer | null: false                    |
| purchase_id  | integer | null: false, foreign_key: true |

### Association

- belongs_to :purchase