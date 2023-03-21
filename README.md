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
- has_many :chats
- belongs_to :creator, class_name: "User"


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
| messages | string     |                                 |
| user     | references | null: false, foreign_key: true  |
| room     | references | null: false, foreign_key: true  |

### Association
- belongs_to :user
- belongs_to :room