-- 1. Создайте функцию, которая принимает кол-во сек и формат их в кол-во дней часов.

DROP DATABASE Second;
CREATE DATABASE Second;

USE Second;

SHOW TABLES;

CREATE TABLE sec 
(
	sec_id INT NOT NULL auto_increment PRIMARY KEY,
    sec_value int
);

INSERT sec(sec_value)
VALUES ('123456');

SELECT * FROM sec;

SELECT 
	@seconds := sec_value
FROM
	Second.sec;

SELECT CONCAT(
            FLOOR(TIME_FORMAT(SEC_TO_TIME(@seconds), '%H') / 24), 'days ',
            MOD(TIME_FORMAT(SEC_TO_TIME(@seconds), '%H'), 24), 'h:',
            TIME_FORMAT(SEC_TO_TIME(@seconds), '%im:%ss')
        )
AS Result


-- 2. Выведите только четные числа от 1 до 10. Пример: 2,4,6,8,10

DROP DATABASE Even_numbers;
CREATE DATABASE Even_numbers;

USE Even_numbers;

SHOW TABLES;

CREATE TABLE numbers 
(
    numbers_num int
);

INSERT numbers(numbers_num)
VALUES 
    ('1'), 
    ('2'), 
    ('3'), 
    ('4'), 
    ('5'), 
    ('6'), 
    ('7'), 
    ('8'), 
    ('9'), 
    ('10');    

SELECT * FROM numbers;

SELECT * FROM numbers where (numbers_num % 2) = 0