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

## products テーブル

| Column          | Type    | Options                        |
| --------------- | ------- | ------------------------------ |
| image           | text    | null: false                    |
| product_name    | string  | null: false                    |
| description     | text    |                                |
| category        | integer | null: false                    |
| status          | integer | null: false                    |
| shipping_charge | integer | null: false                    |
| shipping_area   | integer | null: false                    |
| shipping_days   | integer | null: false                    |
| price           | integer | null: false                    |
| user_id         | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
