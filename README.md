# DB 設計

# アプリケーション名
children-japan2022

# アプリケーション概要
インバンド向けの託児予約サービス。

# URL
https://childcare-japan1206.herokuapp.com/

# テスト用アカウント
Basic認証パスワード: admin
Basic認証ID: 2222
. メールアドレス: test@tt 
. パスワード: tenkin12

# 予約方法
1. トップページ(一覧ページ)のヘッダーからユーザー新規登録を行う.
2. 予約ボタン（reservationボタン）から予約状況を確認する。（カレンダー機能）
3. 予約可能であれば（○の印がついていれば）、 予約日時、預ける子供の人数、名前、年齢、アレルギーの有無を入力する。
4. 申し込み必須項目を記入したら、「申し込みボタン」を押す。
5. 正常に申し込みが完了した場合、予約完了画面が表示される。



  # アプリケーションを作成した背景
  1番の理由は、貴社のスタッフの一員になれたとしたら、どんな風に貢献できるのか？を具体的に掲示する為です。(志望本気度のアピールです)

  なぜ、インバンド向けの託児サービス予約サイトなのか？に関しては、これまでに行なったインターンや地方創生セミナーなどで、インバンドの方々が一時利用できるような託児所が不足している現状を知り、解決したいと思った事。そして円安の影響もあり、大きく需要が見込めると考えたからです。

  そこで、スクールの最終課題であるフリマアプリの仕組みを参考に、当オリジナルアプリケーションを作成致しました。

  #　開発で工夫した点
  ※前提として、貴社の既存事業に乗っかる形で親和性の高い事業となるように意識しました。

  一つ目は、フロントデザインです。ユーザーがサイトを閲覧した時に、一発で「託児サービス」だと認識できるように写真選びやタイトルを考えました。 そして、淡い暖色を背景色にする事で、託児サービスの要である”安心感”を演出できるのでは？と考え、見やすさを考慮しながら、背景色を調整した事です。

  二つ目は、子供の年齢に応じて、最適なプランを用意した事です。例えば、飲食物が限られる繊細な0~1歳児向けには、 食べ物持ち込み（食体験外し）プランを設け、木工体験も年齢によって難易度の異なる作品を用意しております。


                                                        
  # 洗い出した要件
  https://docs.google.com/spreadsheets/d/1Hw5xakKelqIAmOuEnh_4PT4nerDDYZHYCls05rpMpi0/edit#gid=982722306

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/a6a53caa031977aeabcdc4cee7ccf24e.png)](https://gyazo.com/a6a53caa031977aeabcdc4cee7ccf24e)
# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/93689cd9b0473a46789254f78f62ba76.png)](https://gyazo.com/93689cd9b0473a46789254f78f62ba76)

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
| day              | date       | null: false                    |
| time             | string     | null: false                    |
| start_time       | datetime   | null: false                    |
| contact          | text       |                                |
| user             | references | null: false, foreign_key: true |
| plan             | references | null: false, foreign_key: true |


### Association
- belongs_to :user
* has_one :reservation_order


## reservation_order table

| Column                | Type                | Options             |
|-----------------------|---------------------|---------------------|
| reservation           | references          | foreign_key: true   |

### Association
- belongs_to :reservation
