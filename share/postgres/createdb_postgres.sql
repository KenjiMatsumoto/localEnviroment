--初期設定（ユーザー作成とDBの作成、権限設定）
CREATE ROLE mydb_ps;
ALTER ROLE mydb_ps WITH PASSWORD 'mydb_ps';
ALTER ROLE mydb_ps WITH LOGIN;
CREATE TABLESPACE mydb_ps location '/var/lib/postgresql/mydb_ps';
GRANT ALL ON TABLESPACE mydb_ps to mydb_ps;
ALTER USER mydb_ps WITH SUPERUSER;
GRANT ALL PRIVILEGES ON DATABASE mydb_ps TO mydb_ps;
