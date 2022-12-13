-- Создать при помощи SQL несколько таблиц
-- Например, таблица “Фильмы” и таблица “Киностудии”
-- Заполнить таблицы с данными в соответствии с выбранными типами

-- Продемонстрировать работу с 
-- операторами переименования таблиц\полей, 
-- операторами добавления и удаления таблиц\полей;
-- добавления ключей(внешних);
-- оператором псевдонима;
-- оператором CASE;
-- оператором IF;

-- Подумать и описать проблемы своего проектирования базы данных;

-- Оформить работу так, чтобы результатами было пользоваться удобно не только лично вам.


 
-- создать БД Seminar02
CREATE DATABASE Seminar02;

-- показать имеющиеся БД
SHOW DATABASES;

-- использовать БД Seminar02
USE Seminar02;

-- удалить таблицу movies (если она есть, например)
DROP TABLE movies;

-- создать таблицу movies с соответствующими полями
CREATE TABLE movies
(
    movies_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    movies_title VARCHAR(45),
    movies_year INT,
    movies_genre VARCHAR(45)
);

-- вставить новые данные (в соответствубщие поля) в таблицу movies
INSERT movies(movies_title, movies_year, movies_genre)
VALUES
    ('Какой-то фильм',2022,'Комедия'),
    ('Гарри Поттер', 2010, 'Фантастика'), 
    ('Мстители', 2015, 'Фантастика'),
    ('Человек паук', 2005, 'фантастика');

-- выбрать все данные из таблицы movies    
SELECT * FROM movies;

-- использование оператора псевдонима при выводе
SELECT 
    movies_id as '№',
    movies_title as 'Наименование',
    movies_year as 'Год издания',
    movies_genre  as 'Жанр'
FROM movies;

-- Операции с таблицами
-- 1. Переименование делается с помощью команды RENAME TABLE.
-- RENAME TABLE old_name TO new_name;
RENAME TABLE movies TO films;
SELECT * FROM films;

-- 2. Для добавления нового столбца нам понадобится команда ADD.
-- ALTER TABLE table_name
-- ADD column_name VARCHAR(50) NULL;
ALTER TABLE films
    ADD films_rating INT NULL;
SELECT * FROM films;

-- 2.1 Обновить запись
-- UPDATE table_name
-- SET column1 = value1, column2 = value2, ...
-- WHERE condition;

use Seminar02;
UPDATE films
    SET films_rating = 5
WHERE TRUE;

UPDATE films
    SET films_rating = 1
WHERE movies_id = 1;
UPDATE films
    SET films_rating = 4
WHERE movies_id = 2;
UPDATE films
    SET films_rating = 2
WHERE movies_id = 3;

SELECT * FROM films;

-- 3. Чтобы удалить столбец в MySQL используется ALTER TABLE с DROP COLUMN:
-- ALTER TABLE table_name
-- DROP COLUMN column_name;

ALTER TABLE films
DROP COLUMN films_rating;

-- Внешние ключи
DROP TABLE distribution;

CREATE TABLE  distribution  
(
    studio_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    studio_title VARCHAR(100)
);

INSERT distribution(studio_title)
VALUES 
    ('Неизвестная студия'),
    ('Paramount Pictures'), 
    ('Мосфильм'), 
    ('The Walt Disney Company');
    
SELECT * FROM distribution;

ALTER TABLE films
    ADD creator INT NOT NULL DEFAULT 1;

SELECT * FROM films;

-- ADD FOREIGN KEY ()
SELECT 
    * 
FROM films LEFT JOIN distribution
ON films.creator = distribution.studio_id;


ALTER TABLE films
    ADD FOREIGN KEY (creator) REFERENCES distribution(studio_id);

SELECT * FROM films;


-- Удаление данных
SELECT * FROM films;

TRUNCATE TABLE films;

INSERT films(movies_title, movies_year, movies_genre,creator )
VALUES
    ('Гарри Поттер', 2010, 'Фантастика',1), 
    ('Мстители', 2015, 'Фантастика',1),
    ('Человек паук', 2005, 'фантастика',1);
   
-- оператор CASE (условие -> результат) 
SELECT * FROM films;

SELECT 
    movies_title,
    films_rating
FROM films;

SELECT 
    movies_title as 'Наименование',
    films_rating as 'Ретинг',
    CASE films_rating
        WHEN 1 THEN '⭐️'
        WHEN 2 THEN '⭐️⭐️'
        WHEN 3 THEN '⭐️⭐️⭐️'    
        WHEN 4 THEN '⭐️⭐️⭐️⭐️'
        WHEN 5 THEN '⭐️⭐️⭐️⭐️⭐️'
        ELSE '⭐︎⭐︎⭐︎⭐︎⭐︎'
    END AS 'Рейтинг'
FROM films;

-- Ещё
SELECT 
    movies_title as 'Наименование',
    films_rating as 'Рейтинг',
    CASE 
        WHEN films_rating >= 3 THEN 'Рекомендуем к просмотру'
        /* WHEN films_rating = NULL THEN 'Нет просмотров' -- 
        -- Проверить значение на равенство NULL
        -- c помощью обычных арифметических 
        -- операторов сравнения (=, < или <>) нельзя.
        -- Вместо этого нужно пользоваться операторами IS NULL и IS NOT NULL
        */
        WHEN films_rating IS NULL THEN 'Нет просмотров'
        ELSE 'Скука'
    END AS 'Оценочное мнение'
FROM films;


SELECT 
    movies_title as 'Наименование',
    films_rating as 'Ретинг',
    CASE 
        WHEN films_rating >= 1 AND films_rating <=2 THEN 'Не рекомендуем к просмотру'
        WHEN films_rating IS NULL THEN 'Нет просмотров'
        ELSE 'Нормальная тема'
    END AS 'Оценочное мнение'
FROM films;


SELECT 
  movies_title as 'Наименование',
  IF (films_rating >= 3, 'Смотрим','Не смотрим') AS 'Рекомендация'
FROM films;


-- Дополнительно
SELECT 
    UTC_TIME(),
    CURRENT_TIME(),
    HOUR(CURRENT_TIME()),
    IF (HOUR(CURRENT_TIME() - 1) <= 12, 'Утро добрым не бывает','Работаем');
