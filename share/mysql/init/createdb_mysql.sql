CREATE DATABASE IF NOT EXISTS mydb_ms;
USE mydb_ms;
CREATE USER 'mydb_ms'@'localhost' identified by 'mydb_ms';
CREATE ROLE mydb_ms;
GRANT 'mydb_ms'@'localhost' TO 'mydb_ms'@'localhost';
GRANT ALL PRIVILEGES ON *.* TO 'mydb_ms'@'localhost';
FLUSH PRIVILEGES;
