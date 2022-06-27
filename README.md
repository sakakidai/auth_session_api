## アプリの作成

### イメージのビルド

```
$ docker-compose build
```

### コンテナの立ち上げ

```
$ docker-compose up -d
```

### 初期設定

```
$ docker-compose exec api bash

$ bundle exec rails new . --api -d postgresql -T

$ bundle exec rails db:create

$ bundle exec rails s -b 0.0.0.0
```

## herokuの初期設定

### ログイン

```
$ heroku login
```

### ベータ版にアップデート

```
$ heroku update beta
```

### manifestをインストール

```
$ heroku plugins:install @heroku-cli/plugin-manifest
$ heroku plugins
```

### herokuアプリの作成

```
$ heroku create <任意のアプリ名> --manifest
$ heroku open
```

### herokuのリモートリポジトリが追加されていることを確認

```
$ git remote -v
```

### スタックの確認

```
$ heroku stack
```

### herokuにソースをpush

```
$ git push heroku main
```

### herokuの環境変数を設定する

```
$ heroku config:set RAILS_MASTER_KEY=<マスターキー>
$ heroku config
```

### マイグレーションの実行

```
$ heroku run bundle exec rails db:migrate
```

## herokuのコマンド

### プロセス確認

```
$ heroku ps
```

### herokuのコンテナにログイン

```
$ heroku run bash

# タイムゾーン確認
$ date
```

## postgresの確認

### ローカルにpostgresをインストール

```
$ brew install postgresql
```

### herokuのpostgresのプラン情報を確認

```
$ heroku pg:info
```

### herokuのpostgresの接続情報

```
$ heroku pg:credentials:url
```

### postgresにアクセス

```
$ heroku pg:psql <アドオン名>

# タイムゾーン確認
=> show timezone;

# タイムゾーン変更
=> ALTER DATABASE your_database_name SET timezone = 'Asia/Tokyo';
