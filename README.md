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
## データベース設計
### users テーブル
| カラム名             | データ型    | 説明                     |
| -------------------- | ----------- | ------------------------ |
| id                   | integer     | ユーザーID (プライマリーキー) |
| email                | string      | ユーザーのメールアドレス      |
| encrypted_password   | string      | ユーザーのパスワード (deviseGem使用時) |
| name                 | string      | ユーザーの名前             |
| created_at           | datetime    | レコードの作成日時          |
| updated_at           | datetime    | レコードの更新日時          |
### prototypes テーブル
| カラム名       | データ型    | 説明                         |
| --------------- | ----------- | ---------------------------- |
| id              | integer     | プロトタイプID (プライマリーキー) |
| title           | string      | プロトタイプのタイトル         |
| description     | text        | プロトタイプの説明             |
| image           | string      | プロトタイプの画像ファイル名   |
| user_id         | integer     | プロトタイプを投稿したユーザーID |
| created_at      | datetime    | レコードの作成日時             |
| updated_at      | datetime    | レコードの更新日時             |
### comments テーブル
| カラム名        | データ型    | 説明                       |
| --------------- | ----------- | -------------------------- |
| id              | integer     | コメントID (プライマリーキー) |
| content         | text        | コメントの内容              |
| user_id         | integer     | コメントを投稿したユーザーID |
| prototype_id    | integer     | コメントが対象のプロトタイプID |
| created_at      | datetime    | レコードの作成日時           |
| updated_at      | datetime    | レコードの更新日時           |
## アソシエーション
- Userモデル:
  - `User has_many :prototypes`: 1人のユーザーは複数のプロトタイプを投稿できます。
  - `User has_many :comments`: 1人のユーザーは複数のコメントを投稿できます。
- Prototypeモデル:
  - `Prototype belongs_to :user`: プロトタイプは1人のユーザーに所属します。
  - `Prototype has_many :comments`: 1つのプロトタイプに対して複数のコメントができます。
- Commentモデル:
  - `Comment belongs_to :user`: コメントは1人のユーザーに所属します。
  - `Comment belongs_to :prototype`: コメントは1つのプロトタイプに所属します。