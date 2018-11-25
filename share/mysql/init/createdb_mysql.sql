CREATE DATABASE IF NOT EXISTS mydb_ms;
CREATE USER 'mydb_ms'@'localhost' identified by 'mydb_ms';
GRANT ALL PRIVILEGES ON *.* TO 'mydb_ms'@'localhost';
FLUSH PRIVILEGES;
