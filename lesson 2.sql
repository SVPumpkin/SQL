
-- 1. Установите СУБД MySQL. Создайте в домашней директории файл .my.cnf, задав в нем логин и пароль, который указывался при установке.
-- Создала файл, сохранила в C:\Program Files\MySQL\MySQL Server 8.0 .
В файле записала следующее:
[client]
user=root
password = ... 
При входе в mySQL при вводе client/mysql вылетает. Если вводить просто пароль, то все работает. Что не так?


-- 2. Создайте базу данных example, разместите в ней таблицу users, состоящую из двух столбцов, числового id и строкового name
DROP DATABASE example;
CREATE DATABASE example;
USE EXAMPLE;
CREATE TABLE users (
id INT PRIMARY KEY,
name VARCHAR(50)
);

-- 3. Создайте дамп базы данных example из предыдущего задания, разверните содержимое дампа в новую базу данных sample.
DROP DATABASE sample;
CREATE DATABASE sample;
mysqldump example > dump.SQL
mysql sample < dump.SQL
-- файл создался
