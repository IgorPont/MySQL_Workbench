-- Создать схему мобильные телефоны
CREATE SCHEMA `mobile_phones` ;

-- Создать таблицу телефоны с соответствующими полями
CREATE TABLE `mobile_phones`.`phones` (
  `idphones` INT NOT NULL AUTO_INCREMENT,
  `brend_phones` VARCHAR(45) NOT NULL,
  `model_phones` VARCHAR(45) NOT NULL,
  `builtIn_memory_capacity_phones` INT NOT NULL,
  `enclosure_colour_phones` VARCHAR(45) NOT NULL,
  `processor_configuration_phones` VARCHAR(45) NOT NULL,
  `memory_capacity_phones` INT NOT NULL,
  `OS_version_phones` VARCHAR(45) NOT NULL,
  `screen_resolution_phones` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idphones`));

-- Запольнить поля соответствующими записями
INSERT INTO `mobile_phones`.`phones` (`brend_phones`, `model_phones`, `builtIn_memory_capacity_phones`, `enclosure_colour_phones`, `processor_configuration_phones`, `memory_capacity_phones`, `OS_version_phones`, `screen_resolution_phones`) VALUES ('Xiaomi Redmi', 'A1+', '32', 'голубой', '4x(2 ГГц)', '2', 'Android 12 Go', '1600x720');
INSERT INTO `mobile_phones`.`phones` (`brend_phones`, `model_phones`, `builtIn_memory_capacity_phones`, `enclosure_colour_phones`, `processor_configuration_phones`, `memory_capacity_phones`, `OS_version_phones`, `screen_resolution_phones`) VALUES ('HUAWEI', 'nova Y61', '64', 'зеленый', '8', '4', 'Android', '1600x720');
INSERT INTO `mobile_phones`.`phones` (`brend_phones`, `model_phones`, `builtIn_memory_capacity_phones`, `enclosure_colour_phones`, `processor_configuration_phones`, `memory_capacity_phones`, `OS_version_phones`, `screen_resolution_phones`) VALUES ('Samsung', 'Galaxy A13', '32', 'белый', '8x(2 ГГц)', '3', 'Android', '2408х1080');
INSERT INTO `mobile_phones`.`phones` (`brend_phones`, `model_phones`, `builtIn_memory_capacity_phones`, `enclosure_colour_phones`, `processor_configuration_phones`, `memory_capacity_phones`, `OS_version_phones`, `screen_resolution_phones`) VALUES ('HONOR', 'X6 ', '64', 'серебристый', '8x(1.5 ГГц, 2 ГГц)', '4', 'Android', '1600x720');
INSERT INTO `mobile_phones`.`phones` (`brend_phones`, `model_phones`, `builtIn_memory_capacity_phones`, `enclosure_colour_phones`, `processor_configuration_phones`, `memory_capacity_phones`, `OS_version_phones`, `screen_resolution_phones`) VALUES ('Samsung', 'Galaxy A13', '64', 'белый', '8x(2 ГГц)', '4', 'Android', '2408х1080');

-- Добавить поле Цена в таблицу телефоны
ALTER TABLE `mobile_phones`.`phones` 
ADD COLUMN `price_phones` VARCHAR(45) NOT NULL AFTER `screen_resolution_phones`;

-- Добавить соответствующие значения в поле Цена
UPDATE `mobile_phones`.`phones` SET `price_phones` = '5690' WHERE (`idphones` = '1');
UPDATE `mobile_phones`.`phones` SET `price_phones` = '6730' WHERE (`idphones` = '2');
UPDATE `mobile_phones`.`phones` SET `price_phones` = '7320' WHERE (`idphones` = '3');
UPDATE `mobile_phones`.`phones` SET `price_phones` = '9876' WHERE (`idphones` = '4');
UPDATE `mobile_phones`.`phones` SET `price_phones` = '3978' WHERE (`idphones` = '5');

-- Добавить поле количество
ALTER TABLE `mobile_phones`.`phones` 
ADD COLUMN `number_phones` INT NOT NULL AFTER `price_phones`;

-- Добавить значения в поле Количество
UPDATE `mobile_phones`.`phones` SET `number_phones` = '1' WHERE (`idphones` = '1');
UPDATE `mobile_phones`.`phones` SET `number_phones` = '2' WHERE (`idphones` = '2');
UPDATE `mobile_phones`.`phones` SET `number_phones` = '5' WHERE (`idphones` = '3');
UPDATE `mobile_phones`.`phones` SET `number_phones` = '3' WHERE (`idphones` = '4');
UPDATE `mobile_phones`.`phones` SET `number_phones` = '6' WHERE (`idphones` = '5');

-- Вывести производителя, модель и цену для товаров, количество которых превышает 2
SELECT brend_phones, model_phones, price_phones FROM phones WHERE number_phones > 2

-- Вывести весь ассортимент товаров марки “Samsung”
SELECT * FROM phones WHERE brend_phones = 'Samsung'
