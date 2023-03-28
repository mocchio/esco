# アプリケーション名
Esco

# アプリケーション概要
達成したい習慣が同じユーザー同士がチャットルームに集まり、お互いが監視役となり習慣化を達成する。

# URL
https://esco.onrender.com



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


## permissionsテーブル

| Column   | Type       | Option                          |
| -------- | ---------- | ------------------------------- |
| user     | references | null: false, foreign_key: true  |
| room     | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :room