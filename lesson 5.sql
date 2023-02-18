-- Задание 1. Пусть в таблице users поля created_at и updated_at оказались незаполненными.Заполните их текущими датой и временем.

DROP TABLE IF EXISTS users;
CREATE TABLE users(
	id serial primary key,
	created_at DATETIME,
	updated_at DATETIME
);

INSERT INTO users (created_at, updated_at) VALUES (null, null)
UPDATE users SET created_at = NOW(), updated_at = now();
		
	
-- Задание 2. Таблица users была неудачно спроектирована. Записи created_at и updated_at были заданы типом VARCHAR и в них долгое время помещались значения в формате "20.10.2017 8:10". Необходимо преобразовать поля к типу DATETIME, сохранив введеные ранее значения.

DROP TABLE IF EXISTS users1;
CREATE TABLE users1(
	id serial primary key,
	created_at VARCHAR(200),
	updated_at VARCHAR(200)
);

INSERT INTO users1 (created_at, updated_at) VALUES ('20.10.1955 8:10', '20.10.2000 8:10');
UPDATE users1 SET 
		created_at = str_to_date(created_at, '%d.%m.%Y %k:%i'),
		updated_at = str_to_date(updated_at, '%d.%m.%Y %k:%i');

ALTER TABLE users 
	CHANGE created_at created_at DATETIME DEFAULT NOW();
	
ALTER TABLE users 
	CHANGE updated_at updated_at DATETIME DEFAULT NOW() ON UPDATE NOW();

-- Задание 3. В таблице складских запасов storehouses_products в поле value могут встречаться самые разные цифры: 0, если товар закончился и выше нуля, если на складе имеются запасы. Необходимо отсортировать записи таким образом, чтобы они выводились в порядке увеличения значения value. Однако, нулевые запасы должны выводиться в конце, после всех записей.

DROP TABLE IF EXISTS storehouses_products;
CREATE TABLE storehouses_products(
	id serial PRIMARY KEY,
	value INT UNSIGNED
);

INSERT	into storehouses_products (value)
	values 
	(0),
	(505),
	(3),
	(63),
	(8);

select * from storehouses_products order by if(value > 0, 0, 1), value;


-- Задание 1. Подсчитайте средний возраст пользователей в таблице users

DROP TABLE IF EXISTS users;
CREATE TABLE users(
	id serial PRIMARY KEY,
	birthday_at DATE
);

INSERT INTO users (birthday_at)
	values 
	('1958-03-19'),
	('1899-11-03'),
	('1971-07-11');

select avg(timestampdiff(year, birthday_at, now())) as mid_age from users;

-- Задание 2. Подсчитайте количество дней рождения, которые приходятся на каждый из дней недели. Следует учесть, что необходимы дни недели текущего года, а не года рождения.

select date_format(date(concat_ws('-', year(now()), month(birthday_at), day(birthday_at))), '%W') AS what_day,
count(*) as total from users
group by what_day;