
USE lesson01;


CREATE TABLE common_list
(
    full_name varchar(30),
    birthday date,
    status varchar(30),
    phone_number bigint,
    commentary varchar(30),
    address varchar(30),
    user_group varchar(30)
);

INSERT INTO common_list 
	(full_name, birthday, status, phone_number, commentary, address, user_group )
VALUES

('Иванов И. И.'    , '1990-02-12','женат',126,'интернет','Можга','Работа'),
('Иванов И. И.'    , '1990-02-12', 'женат', 127, 'старый', 'Можга', 'Работа'),
('Иванов И. И.'    , '2001-09-18', 'холост', 527, 'личный', 'Санкт-Петербург', 'Школа'),
('Петров П. П.'    , '1983-04-23', 'женат', 234, 'личный', 'Москва', 'Родня'),
('Петров П. П.'    , '1983-04-24', 'женат', 235, 'рабочий', 'Москва', 'Родня'),
('Васильев В. В.'  , '1998-05-21', 'холост', 456, 'личный', 'Белгород', 'Друзья'),
('Сидоров С.С.'    , '2007-07-13', 'холост', 643, 'личный', 'Киров', 'Родня'),
('Сидоров С.С.'    , '2007-07-13', 'холост', 654, 'старый', 'Киров', 'Родня'),
('Александров А.А.', '1987-03-05', 'женат', 412, 'рабочий', 'Уфа', 'Друзья'),
('Борисов Б.Б'     , '1989-08-16', 'холост', 723, 'рабочий', 'Москва', 'Работа'),
('Михайлов М.М.'   , '1997-01-08', 'женат', 876, 'личный', 'Сочи', 'Университет'),
('Михайлов М.М.'   , '1997-01-08', 'женат', 875, 'рабочий', 'Сочи', 'Университет'),
('Кириллов К.К.'   , '1996-12-03', 'холост', 933, 'личный', 'Киров', 'Работа')

SELECT * FROM common_list;

CREATE TABLE peoples
(
	identifier int,
    full_name varchar(30),
    birthday date,
    status varchar(30)
);

INSERT INTO peoples
    (identifier, full_name, birthday, status) 
VALUES
	(1, 'Иванов И. И.',   '1990-02-12', 'женат'),
	(2, 'Иванов И. И.',   '2001-09-18', 'холост'),
	(3, 'Петров П. П.',   '1983-04-23', 'женат'),
	(4, 'Васильев В. В.', '1998-05-21', 'холост'),
	(25, 'Кузьмин К.К.',  '2020-05-21', 'холост');

SELECT * FROM peoples;


CREATE TABLE telephones
(
    whose_phone int,
    phone_number bigint,
    commentary varchar(30)
);

INSERT INTO telephones
    (whose_phone, phone_number, commentary) 
VALUES
	(1, 123, 'личный'),
	(1, 124, 'рабочий'),
	(1, 125, 'для поездок'),
	(1, 126, 'интернет'),
	(1, 127, 'старый'),
	(2, 527, 'личный'),
	(3, 234, 'личный'),
	(3, 235, 'рабочий'),
	(4, 456, 'личный'),
	(11, 999, 'личный'),
	(12, 997, 'рабочий'),
    (13, 995, 'личный'),
	(14, 993, 'для поездок'),
	(15, 991, 'для поездок');
	
SELECT * FROM telephones;

WITH with_tmp AS (
	SELECT
	  peoples.full_name,
      count(*) as c
	FROM 
      peoples LEFT JOIN telephones 
	  ON peoples.identifier = telephones.whose_phone
	GROUP BY 
      peoples.full_name
	HAVING 
       count(*) >= 2
) 
SELECT 
  peoples.full_name,
  with_tmp.c
FROM peoples
JOIN with_tmp
ON peoples.full_name = with_tmp.full_name
GROUP BY peoples.full_name; 

-- === vvvv


/* 
SELECT 
  peoples.full_name,
  with_tmp.c
FROM peoples
JOIN (
SELECT
	  peoples.full_name,
      count(*) as c
	FROM 
      peoples LEFT JOIN telephones 
	  ON peoples.identifier = telephones.whose_phone
	GROUP BY 
      peoples.full_name
	HAVING 
       count(*) >= 2) as with_tmp
ON peoples.full_name = with_tmp.full_name
GROUP BY peoples.full_name; 
*/ 

-- ===  ===  ===  ===  ===  ===  ===  ===  ===  

-- Задача:

-- Собрать дэшборд, в котором содержится информация
-- о максимальной задолженности в каждом банке,
-- а также средний размер процентной ставки в каждом
-- банке в зависимости от сегмента и количество 
-- договоров всего всем банкам

CREATE TABLE something (
  TB VARCHAR(50),
  ID_CLIENT INT,
  ID_DOG INT,
  OSZ INT,
  PROCENT_RATE INT,
  RATING INT,
  SEGMENT VARCHAR(10)
);

INSERT INTO something 
(TB, ID_CLIENT, ID_DOG, OSZ, PROCENT_RATE, RATING, SEGMENT)
VALUES
('A',  1,      111, 100 ,     6  ,        10 ,   'SREDN' ),
('A',  1,      222, 150 ,     6  ,        10 ,   'SREDN' ),
('A',  2,      333, 50  ,     9  ,        15 ,   'MMB' ),
('B',  1,      444, 200 ,     7  ,        10 ,   'SREDN' ),
('B',  3,      555, 1000,     5  ,        16 ,   'CIB' ),
('B',  4,      666, 500 ,     10 ,        20 ,   'CIB' ),
('B',  4,      777, 10  ,     12 ,        17 ,   'MMB' ),
('C',  5,      888, 20  ,     11 ,        21 ,   'MMB' ),
('C',  5,      999, 200 ,     9  ,        13 ,   'SREDN' );

SELECT * FROM something;

SELECT
  TB, ID_CLIENT, ID_DOG, OSZ, PROCENT_RATE, RATING, SEGMENT,
MAX(OSZ) OVER (partition by TB),
AVG(PROCENT_RATE) OVER (partition by TB, SEGMENT),
COUNT(*) OVER()
FROM something;


//5  =====


CREATE DATABASE mydb;
USE mydb;

CREATE TABLE users (
username VARCHAR(50) PRIMARY KEY,
password VARCHAR(50) NOT NULL,
status VARCHAR(10) NOT NULL);

CREATE TABLE users_profile (
username VARCHAR(50) PRIMARY KEY,
name VARCHAR(50) NOT NULL,
address VARCHAR(50) NOT NULL,
email VARCHAR(50) NOT NULL,
FOREIGN KEY (username) REFERENCES users(username) ON DELETE CASCADE);

INSERT INTO users values
('admin' , '7856', 'Active'),
('staff' , '90802', 'Active'),
('manager' , '35462', 'Inactive');

INSERT INTO users_profile values
('admin', 'Administrator' , 'Dhanmondi', 'admin@test.com' ) ,
('staff', 'Jakir Nayek' , 'Mirpur', 'zakir@test.com' ),
('manager', 'Mehr Afroz' , 'Eskaton', 'mehr@test.com' );


-- 1. Используя СТЕ, выведите всех 
--    пользователей из таблицы users_profile

WITH show_users AS
(
  SELECT 
    * 
  FROM users_profile
)
SELECT 
  *
FROM show_users;

-- 2. Используя СТЕ, подсчитайте количество
--    активных пользователей . 
--    Задайте псевдоним результирующему окну. 

WITH cte_users AS
(
  SELECT COUNT(*) as total
  FROM users
  WHERE status = 'Active'
)
SELECT 
  total
FROM cte_users;

-- 3. С помощью СТЕ реализуйте 
--    таблицу квадратов чисел от 1 до 10:

SET @first := 0;
SELECT @last:= 10;

WITH RECURSIVE cte AS
(
  SELECT @first AS i, @first as 'pow'
  UNION ALL
  SELECT i + 1, pow(i + 1,2) FROM cte
  WHERE i < @last
)
SELECT * FROM cte;






// 5.1 ===
create table academic_record (
	name varchar(45),
	quartal  varchar(45),
    subject varchar(45),
	grade int
);

insert into academic_record
values
	('Александр','1 четверть', 'математика', 4),
	('Александр','2 четверть', 'русский', 4),
	('Александр', '3 четверть','физика', 5),
	('Александр', '4 четверть','история', 4),
	('Антон', '1 четверть','математика', 4),
	('Антон', '2 четверть','русский', 3),
	('Антон', '3 четверть','физика', 5),
	('Антон', '4 четверть','история', 3),
     ('Петя', '1 четверть', 'физика', 4),
	('Петя', '2 четверть', 'физика', 3),
	('Петя', '3 четверть', 'физика', 4),
	('Петя', '4 четверть', 'физика', 5);

select * 
from academic_record
// 5.2 ===
CREATE TABLE summer_medals 
(
	year INT,
    city VARCHAR(45),
    sport VARCHAR(45),
    discipline VARCHAR(45),
    athlete VARCHAR(45),
    country VARCHAR(45),
    gender VARCHAR(45),
    event VARCHAR(45),
    medal VARCHAR(45)
);

SELECT *
FROM summer_medals;
INSERT summer_medals
VALUES
	(1896, "Athens", "Aquatics", "Swimming", "HAJOS ALfred", "HUN", "Men","100M Freestyle", "Gold"),
	(1896, "Athens", "Archery", "Swimming", "HERSCHMANN Otto", "AUT", "Men","100M Freestyle", "Silver"),
    (1896, "Athens", "Athletics", "Swimming", "DRIVAC Dimitros", "GRE", "Men","100M Freestyle For Saliors", "Bronze"),
    (1900, "Athens", "Badminton", "Swimming", "MALOKINIS Ioannis", "GRE", "Men","100M Freestyle For Saliors", "Gold"),
    (1896, "Athens", "Aquatics", "Swimming", "CHASAPIS Spiridon", "GRE", "Men","100M Freestyle For Saliors", "Silver"),
    (1896, "Athens", "Aquatics", "Swimming", "CHOROPHAS Elfstathios", "GRE", "Men","1200M Freestele", "Bronze"),
    (1905, "Athens", "Aquatics", "Swimming", "HAJOS ALfred", "HUN", "Men","100M Freestyle For Saliors", "Gold"),
    (1896, "Athens", "Aquatics", "Swimming", "ANDREOU Joannis", "GRE", "Men","1200M Freestyle", "Silver"),
    (1896, "Athens", "Aquatics", "Swimming", "CHOROPHAS Elfstathios", "GRE", "Men","400M Freestyle", "Bronze");
//5 hw
CREATE TABLE cars
(
	id INT NOT NULL PRIMARY KEY,
    name VARCHAR(45),
    cost INT
);

INSERT cars
VALUES
    (1, "Audi", 52642),
    (2, "Mercedes", 57127 ),
    (3, "Skoda", 9000 ),
    (4, "Volvo", 29000),
    (5, "Bentley", 350000),
    (6, "Citroen ", 21000 ), 
    (7, "Hummer", 41400), 
    (8, "Volkswagen ", 21600);
    
SELECT *
FROM cars;








CREATE SCHEMA `lesson05` ;
use `lesson05`;

-- Базы данных и SOL
-- Оконные функции SQL: таблица для работы
CREATE TABLE sales(
  sales_employee VARCHAR(50) NOT NULL,
  fiscal_year INT NOT NULL,
  sale DECIMAL(14, 2) NOT NULL,
  PRIMARY KEY(sales_employee,fiscal_year)
);

INSERT INTO sales (sales_employee, fiscal_year, sale)
VALUES( 'Bob' ,2016, 100),
('Bob' ,2017, 150),
('Bob' ,2018,200),
('Alice' ,2016, 150),
('Alice' ,2017, 100),
('Alice' ,2018,200),
('John' ,2016, 200),
(' John', 2017, 150),
('John' ,2018,250);

SELECT 
  * 
FROM sales;

SELECT
  SUM(sale)
FROM sales;

SELECT 
  fiscal_year, 
  SUM(sale)
FROM sales
GROUP BY fiscal_year;

-- SELECT
-- Название функции (столбец для вычислений)
-- OVER
-- (
-- 	PARTITION BY столбец для группировки
-- 	ORDER BY столбец для сортировки
-- 	ROWS или RANGE выражение для ограничения строк в пределах группы
-- )

-- SELECT 
--   Date,
--   Medium,
--   Conversions,
-- SUM(Conversions) OVER() AS "Sum'
-- FROM Orders;

DROP TABLE `lesson05`.`orders`;

CREATE TABLE `lesson05`.`orders` (
  `date` DATE NOT NULL,
  `medium` VARCHAR(45) NOT NULL,
  `conversions` INT NOT NULL);
  
TRUNCATE `lesson05`.`orders`;

INSERT INTO `lesson05`.`orders` (`date`, `medium`, `conversions`)
VALUES
('2020-05-10', 'cpa', 1),
('2020-05-10', 'cpc', 2),
('2020-05-10', 'organic', 1),
('2020-05-11', 'cpa', 1),
('2020-05-11', 'cpc', 3),
('2020-05-11', 'direct', 1),
('2020-05-11', 'organic', 2),
('2020-05-12', 'cpc', 1),
('2020-05-12', 'organic', 2);
  
SELECT * FROM orders;
  
  
SELECT 
  `date`,
  `medium`,
  `conversions`,
  SUM(`conversions`) OVER() AS 'Sum'
FROM orders
ORDER BY `date`;

-- vvvvvvv
SELECT 
  `date`,
  `medium`,
  `conversions`,
  SUM(`conversions`) OVER(PARTITION BY `date`) AS 'Sum'
FROM orders
ORDER BY `date`;


-- vvvvvvv
SELECT 
  `date`,
  `medium`,
  `conversions`,
  SUM(`conversions`) OVER(PARTITION BY `date` ORDER BY `medium`) AS 'Sum'
FROM orders
ORDER BY `date`;
--- === === === === === === ---

SELECT 
  `date`,
--  `medium`,
--  `conversions`,
  SUM(`conversions`) AS 'Sum'
FROM orders
GROUP BY `date`;




SELECT
  date,
  medium,
  conversions,
  SUM(conversions) OVER(PARTITION BY date ORDER BY medium) AS 'Sum'
FROM orders;


-- ROWS и RANGE
-- UNBOUNDED PRECEDING - указывает, 
-- что окно начинается с первой строки группы;

-- UNBOUNDED FOLLOWING - с помощью данной 
-- инструкции можно указать, что окно заканчивается на
-- последней строке группы;

-- CURRENT ROW - инструкция указывает, что окно
-- начинается или заканчивается на текущей строке;

-- BETWEEN «граница окна» AND «граница окна»
-- - указывает нижнюю и верхнюю границу окна;

-- «Значение» PRECEDING - определяет число строк перед 
-- текущей строкой (не допускается в предложении RANGE);

-- «Значение» FOLLOWING - определяет число строк после
-- текущей строки (не допускается в предложени RANGE);


SELECT
  date,
  medium,
  conversions,
SUM(conversions) OVER(PARTITION BY date ORDER BY conversions ROWS BETWEEN
CURRENT ROW AND 1 FOLLOWING) AS 'Sum'
FROM orders;

-- Window Functions
-- Aggregate   Ranking        Value
-- AVG()       DENSE_RANK()   FIRST_VALUE()
-- COUNT()     NTILE()        LAST_VALUE()
-- MAX()       RANK()         LAG()
-- MIN()       ROW_NUMBER()   LEAD()
-- SUM()       CUME_DIST()    NTH_VALUE()

-- Агрегатные функции
-- SUM - возвращает сумму значений в столбце;
-- COUNT - вычисляет количество значений в столбце 
--         (значения NULL не учитываются);
-- AVG - определяет среднее значение в столбце;
-- MAX - определяет максимальное значение в столбце:
-- MIN - определяет минимальное значение в столбце.


SELECT
	date,
	medium,
	conversions,
	SUM(conversions) OVER(PARTITION BY date) AS 'Sum',
	COUNT(conversions) OVER(PARTITION BY date) AS 'Count',
	AVG(conversions) OVER(PARTITION BY date) AS 'Avg',
	MAX(conversions) OVER(PARTITION BY date) AS 'Max',
	MIN(conversions) OVER(PARTITION BY date) AS 'Min'
FROM orders;


-- ROW NUMBER - функция возвращает номер 
-- строки используется для нумерации;
-- RANK - функция возвращает ранг каждой строки.
-- В данном случае значения уже анализируются и, 
-- в случае нахождения одинаковых, возвращает 
-- одинаковый ранг с пропуском следующего значения;
-- DENSE_RANK - функция возвращает ранг каждой строки. 
-- Но в отличие от функции RANK, она для одинаковых 
-- значений возвращает ранг, не пропуская следующий;
-- NTILE - это функция, которая позволяет определить 
-- к какой группе относится текущая строка. 
-- Количество групп задается в скобках.


SELECT
date,
medium,
conversions,
ROW_NUMBER()
OVER( PARTITION BY date ORDER BY conversions) AS 'Row number',
RANK()
OVER(PARTITION BY date ORDER BY conversions) AS 'Rank',
DENSE_RANK()
OVER(PARTITION BY date ORDER BY conversions) AS 'Dense Rank',
NTILE(3)
OVER(PARTITION BY date ORDER BY conversions) AS 'Ntile'
FROM orders;


-- LAG или LEAD - функция LAG обращается к данным
-- из предыдущей строки окна, а LEAD к данным из следующей строки.
-- Функцию можно использовать для того, чтобы
-- сравнивать текущее значение строки с предыдущим
-- или следующим. Имеет три параметра: столбец, 
-- значение которого необходимо вернуть, 
-- количество строк для смещения (по умолчанию 1), 
-- значение, которое необходимо вернуть если после смешения 
-- возврашается значение NULL:
-- FIRST VALUE или LAST VALUE - с помощью функции
-- можно получить первое и последнее значение в окне.
-- В качестве параметра принимает столбец,
-- значение которого необходимо вернуть.


SELECT
date,
medium,
conversions,
LAG(conversions) OVER(PARTITION BY date ORDER BY date) AS 'Lag',
LEAD (conversions) OVER(PARTITION BY date ORDER BY date) AS 'Lead',
FIRST_VALUE(conversions) OVER(PARTITION BY date ORDER BY date) As 'First Value',
LAST_VALUE (conversions) OVER(PARTITION BY date ORDER BY date) AS 'Last Value'
FROM orders;



-- Представления
-- CREATE [OR REPLACE] VIEW view_name AS
-- SELECT columns
-- FROM tables
-- [WHERE conditions];
-- OR REPLACE - необязательный. 
-- Если вы не укажете этот атрибут и 
-- VIEW уже существует, оператор 
-- CREATE VIEW вернет ошибку.
-- view_name - имя VIEW, 
-- которое вы хотите создать в MySQL.
-- WHERE conditions - необязательный. 
-- Условия, которые должны быть выполнены 
-- для записей, которые должны быть 
-- включены в VIEW.

-- CREATE TABLE `lesson05`.`orders` (
--   `date` DATE NOT NULL,
--   `medium` VARCHAR(45) NOT NULL,
--   `conversions` INT NOT NULL);

SELECT * FROM orders;

CREATE VIEW orders_view
AS SELECT date, conversions
FROM orders
WHERE medium = 'organic';

SELECT * FROM orders_view;
DROP VIEW orders_view;

-- JOINs

-- ALTER VIEW view_name AS

-- SELECT columns
-- FROM table
-- WHERE conditions;

-- ALTER VIEW hardware_suppliers AS
-- SELECT supplier_id, supplier _name, address, city
-- FROM suppliers
-- WHERE category_type = 'Hardware';

ALTER VIEW orders_view AS
SELECT conversions, medium
FROM orders 
WHERE medium = 'organic';


SELECT * FROM orders_view;

