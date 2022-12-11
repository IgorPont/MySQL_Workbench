-- Создать схему
CREATE SCHEMA `Notebook` ;

-- Создать таблицу люди с соответствующими полями
CREATE TABLE `Notebook`.`people` (
  `idPeople` INT NOT NULL AUTO_INCREMENT,
  `fullNamePeople` VARCHAR(100) NOT NULL,
  `birthdayPeople` DATETIME NOT NULL,
  `statusPeople` VARCHAR(6) NULL,
  PRIMARY KEY (`idPeople`));

-- Создать таблицу телефоны с соответствующими полями
CREATE TABLE `Notebook`.`telephones` (
  `idPeople` INT NOT NULL,
  `phoneTelephones` INT NOT NULL,
  `сommentaryTelephones` VARCHAR(45) NULL);

-- Создать таблицу адреса с соответствующими полями
CREATE TABLE `Notebook`.`addresses` (
  `idPeople` INT NOT NULL,
  `addressAddresses` VARCHAR(100) NOT NULL,
  `сommentaryAddresses` VARCHAR(45) NULL,
  PRIMARY KEY (`idPeople`));

-- Заполнить поля таблицы люди записями
INSERT INTO `Notebook`.`people` (`idPeople`, `fullNamePeople`, `birthdayPeople`, `statusPeople`) VALUES ('1', 'Иванов И.И.', '1990-02-12', 'женат');
INSERT INTO `Notebook`.`people` (`idPeople`, `fullNamePeople`, `birthdayPeople`, `statusPeople`) VALUES ('2', 'Иванов И.И.', '2001-09-18', 'холост');
INSERT INTO `Notebook`.`people` (`idPeople`, `fullNamePeople`, `birthdayPeople`, `statusPeople`) VALUES ('3', 'Петров П.П.', '1983-04-16', 'женат');
INSERT INTO `Notebook`.`people` (`idPeople`, `fullNamePeople`, `birthdayPeople`, `statusPeople`) VALUES ('4', 'Васильев В.В.', '1998-05-21', 'холост');
INSERT INTO `Notebook`.`people` (`idPeople`, `fullNamePeople`, `birthdayPeople`, `statusPeople`) VALUES ('5', 'Кузьмин К.К.', '2020-05-21', 'холост');

-- Изменил тип поля день рождения
ALTER TABLE `Notebook`.`people` 
CHANGE COLUMN `birthdayPeople` `birthdayPeople` DATE NOT NULL ;



