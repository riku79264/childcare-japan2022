# DB 設計

# アプリケーション名
children-japan1206

# アプリケーション概要
インバンド向けの託児予約サービス。

# URL
https://childcare-japan1206.herokuapp.com/

# テスト用アカウント
Basic認証パスワード: admin
Basic認証ID: 9836
. メールアドレス: xxx@xxx.com
. パスワード: xxxxxx

# 予約方法
1. トップページ(一覧ページ)のヘッダーからユーザー新規登録を行う
2. 申し込みボタンから、 申し込みの内容 (申し込みプラン、預ける子供の名前、年齢、アレルギーの有無）を入力し申し込む。
3.申し込みを完了したら 「申し込みボタン」を押す

  # アプリケーションを作成した背景
 インバウンド向けの託児所が不足している背景から。
  # 洗い出した要件
  https://docs.google.com/spreadsheets/d/1Hw5xakKelqIAmOuEnh_4PT4nerDDYZHYCls05rpMpi0/edit#gid=982722306

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/3bc16af1f0ad0a08870595b9b1f4541e.png)](https://gyazo.com/3bc16af1f0ad0a08870595b9b1f4541e)
# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/5b08ce72cf0a9ad16a6376a4d721c968.png)](https://gyazo.com/5b08ce72cf0a9ad16a6376a4d721c968)

# 開発環境
・ フロントサイド
・ バックエンド
・ インフラ
・ テスト
・ テキストエディタ




## users table

| Column                | Type                | Options                   |
|-----------------------|---------------------|---------------------------|
| name                  | string              | null: false               |
| email                 | string              | null: false,unique:true   |
| encrypted_password    | string              | null: false               |



### Association

* has_one :reservation

## reservations table

| Column           | Type       | Options                        |
|------------------|------------|--------------------------------|
| number_id        | integer    | null: false                    |
| children_name    | string     | null: false                    |
| age_id           | integer    | null: false                    |
| allergy          | string     |                                |
| nationality      | string     | null: false                    |
| phone_number     | string     | null: false                    |
| contact          | text       |                                |
| user             | references | null: false, foreign_key: true |
| plan             | references | null: false, foreign_key: true |


### Association
- belongs_to :user
