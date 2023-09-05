# README
# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| profile            | text   | null: false |
| occupation         | text   | null: false |
| position           | string | null: false |

### Association

- has_many :prototype
- has_many :comment

## prototype テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| title           | text       | null: false                    |
| catch_copy      | text       | null: false                    |
| concept         | text       | null: false                    |
| use             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comment

## comment テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| content   | text       | null: false                    |
| prototype | references | null: false, foreign_key: true |
| user      | references | null: false, foreign_key: true |

### Association

- belongs_to :prototype
- belongs_to :user
