--初期設定（ユーザー作成とDBの作成、権限設定）
CREATE USER mydb_ps;
CREATE DATABASE mydb_ps;
GRANT ALL PRIVILEGES ON DATABASE mydb_ps TO mydb_ps;
