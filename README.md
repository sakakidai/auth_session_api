# アプリの作成

## イメージのビルド

```
$ docker-compose build
```

## コンテナの立ち上げ

```
$ docker-compose up -d
```

## 初期設定

```
$ docker-compose exec api bash

$ bundle exec rails new . --api -d postgresql -T

$ bundle exec rails db:create

$ bundle exec rails s -b 0.0.0.0
```
