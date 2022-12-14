/*
- Используя операторы языка SQL, создайте таблички "goods" и “sales”. 
	Заполните их данными
- Сгруппируйте значения количества в 3 сегмента — меньше 100, 100-300 и 
	больше 300. - CASE
- Создайте таблицу “orders”, заполните ее значениями. Покажите “полный” 
	статус заказа, используя оператор CASE
- Чем NULL отличается от 0?
*/

CREATE DATABASE Homework2;

SHOW DATABASES;

USE Homework2;

SHOW TABLES;

CREATE TABLE goods 
(
	goods_id INT NOT NULL auto_increment PRIMARY KEY,
    goods_brand VARCHAR(100),
    goods_model VARCHAR(100),
    goods_year INT,
    goods_price DECIMAL(9,2),
    goods_number INT
);

INSERT goods(goods_brand, goods_model, goods_year, goods_price, goods_number)
VALUES 
	('AIWA', '32FLE9600S', 2017, '999.99', '87'),
    ('MAUNFELD','MLT43USD02', '2020', '345.45', '150'),
	('Leff', '32H550T', '2021', '687.23', '310'),
	('Xiaomi Mi', 'Redmi Smart TV MAX 86', '2022', '230.00', '105');

SELECT 
    goods_id as '№',
    goods_brand as 'Бренд',
    goods_model as 'Модель',
    goods_year  as 'Год выпуска',
    goods_price as 'Цена за ед.',
    goods_number as 'Количество'
FROM goods;

SELECT * FROM goods

CREATE TABLE sales 
(
	orders_id INT NOT NULL auto_increment PRIMARY KEY,
	goodId INT,
    sales_discount TINYINT,
    sales_price DECIMAL(9,2),
    FOREIGN KEY (goodId) REFERENCES goods (goods_id)
);

SELECT 
    sales_id as '№',
    sales_discount as 'Процент скидки',
    sales_price as 'Цена со скидкой'
FROM sales;

SELECT
	goods_number as 'Количество',
	CASE 
		WHEN goods_number <= 100 THEN 'Небольшое количество'
		WHEN goods_number > 100 AND goods_number < 300 THEN 'Среднее количество'
		WHEN goods_number > 300 AND THEN 'Большое количество'
		WHEN goods_number IS NULL THEN 'Нет в наличии'
	END AS 'Наличие товара'
FROM goods;

CREATE TABLE orders 
(
	orders_id INT NOT NULL auto_increment PRIMARY KEY,
	goodsId INT,
    orders_number INT,
    orders_price DECIMAL(9,2),
    orders_status VARCHAR (45),
    FOREIGN KEY (goodsId) REFERENCES goods (goods_id)
);

SELECT 
    orders_id as '№',
    orders_number as 'Количество единиц',
    orders_price as 'Общая цена',
FROM orders;

/*
-- Чем NULL отличается от 0? --
Для числового поля разница в том, что 0 может быть результатом арифметической операции, 
в то время как NULL говорит о том, что значение просто не было указано.
Аналогично - для пустой строки и других типов данных.
NULL как свойство поля читается как NULLABLE - т.е. значение для данного столбца необязательно для указания.
"0", пустая строка и т.д. это то же значение.
*/


