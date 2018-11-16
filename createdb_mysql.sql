CREATE USER mydb_ms IDENTIFIED BY [PASSWORD] 'mydb_ms';
--初期設定（ユーザー作成とDBの作成、権限設定）
CREATE ROLE mydb_ps@localhost;
SET PASSWORD FOR mydb_ms@localhost=PASSWORD('mydb_ms');
ALTER ROLE mydb_ps WITH LOGIN;
--ロールをユーザーに割り当て
GRANT mydb_ms@localhost TO mydb_ms@localhost;
CREATE TABLESPACE mydb_ms location '/var/lib/mysql/mydb_ms';
GRANT ALL ON TABLESPACE mydb_ms to mydb_ms;
GRANT ALL PRIVILEGES ON *.* TO mydb_ms IDENTIFIED BY 'mydb_ms' WITH GRANT OPTION;
FLUSH PRIVILEGES;
