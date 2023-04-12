# アプリケーション名
Esco


# アプリケーション概要
達成したい習慣が同じユーザー同士がチャットルームに集まり、お互いが監視役となり習慣化を達成する。


# URL
https://esco.onrender.com


# テスト用アカウント
- Basic認証ID : admin
- Basic認証パスワード : 3333
- ルーム作成者メールアドレス : mori@mori.com
- ルーム作成者パスワード : aaaaaa1
- ルーム入室申請者メールアドレス : umi@umi.com
- ルーム入室申請者パスワード : aaaaaa1


# 利用方法

## 習慣化を達成するためのルームを作成（作成者）
1. トップページのヘッダーから新規登録を行う。
2. ヘッダーの「Create Room」ボタンから「ルーム名」「レベル」「メンバー（選ばなくてもよい）」「達成したい習慣」「ルール」を入力しチャットルームを作成する。

## 入りたいルームに入室申請をする（申請者）
1. トップページのルーム一覧より「詳細」ボタンを押し、「入室申請」ボタンを押す。

## 入室申請者を確認し入室許可を出す（作成者）
1. ヘッダーのベルアイコンをクリックし、入室申請の通知を確認する。
2. 通知一覧より入室申請者のマイページを確認し、「入室許可」ボタンを押す。

## 入室許可を確認しルームへ移動する（申請者）
1. ヘッダーのベルアイコンをクリックし、入室許可の通知を確認する。
2. 通知一覧より入室許可が出たルーム詳細を確認し、「ルームに移動する」ボタンを押す。

## 移動したチャットルームにてコミュニケーションをとる
1. 作成者が中心となりお互いが監視役となりながら習慣化を達成する。


# アプリケーションを作成した背景
学生時代の友人に課題をヒアリングし、社会人になってから早起きができないという問題を抱えていることが判明しました。<br>
課題を分析した結果、早起きに限らず継続せざるを得ない環境に置かれていないことが真因であると仮説を立てました。<br>
同様の課題を抱えている人も多いと推測し、真因を解決するために、同じ習慣を達成したい仲間同士でコミュニケーションをとることができるチャットアプリを開発することにしました。<br>


# 洗い出した要件
要件定義シート
https://docs.google.com/spreadsheets/d/1x8Llr29yejllHW98x2KZi1BqKxN9yTHK6jusKL_uCEY/edit#gid=982722306


# 実装した機能についての画像やGIFおよびその説明


# 実装予定の機能
習慣継続状況を可視化できるカレンダー機能


# データベース設計
![esco](https://user-images.githubusercontent.com/124575646/231189723-a830d4b0-75c9-44a4-9e9d-9c6af5c39419.png)


# 画面遷移図
![esco_screen_transition](https://user-images.githubusercontent.com/124575646/231189617-02fdb647-1936-4eab-861c-c2d57867d691.png)


# 開発環境
- フロントエンド
- バックエンド
- インフラ
- テスト
- テキストエディタ
- タスク管理


# ローカルでの動作方法
以下のコマンドを順に実行<br>
% git clone https://github.com/mocchio/esco.git<br>
% cd esco<br>
% bundle install<br>
% yarn install<br>


# 工夫したポイント
ルームの作成者がルームに参加するメンバーを選べるように入室申請機能と入室許可機能を実装した点です。
この機能の実装によりルーム作成者が選んだメンバーのみがルームに参加できるため、似た価値観のユーザーが集まり、習慣化が達成しやすくなると思いました。


# テーブル設計

## usersテーブル

| Column                 | Type   | Option                     |
| ---------------------- | ------ | -------------------------- |
| email                  | string | null: false, unique: true  |
| encrypted_password     | string | null: false                |
| nickname               | string | null: false                |
| last_name              | string | null: false                |
| first_name             | string | null: false                |
| last_name_kana         | string | null: false                |
| first_name_kana        | string | null: false                |
| birthday               | date   | null: false                |
| introduction           | text   | null: false                |

### Association
- has_many :room_users
- has_many :rooms, through: :room_users
- has_many :chats
- has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
- has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :requests, dependent: :destroy
- has_many :permissions, dependent: :destroy


## roomsテーブル

| Column     | Type    | Option       |
| ---------- | ------- | ------------ |
| name       | string  | null: false  |
| level_id   | integer | null: false  |
| habit      | string  | null: false  |
| rule       | text    | null: false  |
| creator_id | integer | null: false  |

### Association
- has_many :room_users
- has_many :users, through: :room_users
- has_many :chats, dependent: :destroy
- belongs_to :creator, class_name: "User"
- has_many :notifications, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :requests, dependent: :destroy
- has_many :permissions, dependent: :destroy


## room_usersテーブル

| Column   | Type       | Option                         |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| room     | references | null: false, foreign_key: true |

### Association
- belongs_to :usr
- belongs_to :room


## chatsテーブル

| Column   | Type       | Option                          |
| -------- | ---------- | ------------------------------- |
| message  | string     |                                 |
| user     | references | null: false, foreign_key: true  |
| room     | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :room

## likesテーブル

| Column   | Type       | Option                          |
| -------- | ---------- | ------------------------------- |
| user     | references | null: false, foreign_key: true  |
| room     | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :room


## notificationsテーブル

| Column       | Type    | Option                      |
| ------------ | ------- | --------------------------- |
| visitor_id   | integer | null: false                 |
| visited_id   | integer | null: false                 |
| room_id      | integer |                             |
| action       | string  | default: '', null: false    |
| checked      | boolean | default: false, null: false |

### Association
- belongs_to :room, optional: true
- belongs_to :visitor, class_name: 'User', foreign_key: 'visitor_id', optional: true
- belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true


## requestsテーブル

| Column   | Type       | Option                          |
| -------- | ---------- | ------------------------------- |
| user     | references | null: false, foreign_key: true  |
| room     | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :room
- has_one :permission, dependent: :destroy


## permissionsテーブル

| Column   | Type       | Option                          |
| -------- | ---------- | ------------------------------- |
| user     | references | null: false, foreign_key: true  |
| room     | references | null: false, foreign_key: true  |
| request  | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :room
- belongs_to :request


## commentsテーブル

| Column   | Type       | Option                          |
| -------- | ---------- | ------------------------------- |
| user     | references | null: false, foreign_key: true  |
| room     | references | null: false, foreign_key: true  |
| text     | text       | null: false                     |

### Association
- belongs_to :user
- belongs_to :room


## reply_commentsテーブル

| Column     | Type       | Option                          |
| ---------- | ---------- | ------------------------------- |
| user       | references | null: false, foreign_key: true  |
| room       | references | null: false, foreign_key: true  |
| comment    | references | null: false, foreign_key: true  |
| reply_text | text       | null: false                     |

### Association
- belongs_to :user
- belongs_to :room
- belongs_to :comment