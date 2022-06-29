# DB 設計

## users table

| Column                | Type                | Options                   |
|-----------------------|---------------------|---------------------------|
| name                  | string              | null: false               |
| email                 | string              | null: false,unique:true   |
| encrypted_password    | string              | null: false               |



### Association

* has_one :application


## reservations table

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| plan_id          | integer    | null: false                    |
| number_id        | integer    | null: false                    |
| children_name    | string     | null: false                    |
| age_id           | integer    | null: false                    |
| allergy          | string     |                                |
| nationality      | string     | null: false                    |
| phone_number     | string     | null: false                    |
| contact          | text       |                                |
| user             | references | null: false, foreign_key: true |


### Association
- belongs_to :user
