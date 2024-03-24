
CREATE TABLE `Покупатели` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `имя` VARCHAR(255) NOT NULL,
  `Электронная почта` VARCHAR(255) NOT NULL,
  `Дата регистрации` DATE NOT NULL
);

CREATE TABLE `Косметические_предметы` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `Название` VARCHAR(255) NOT NULL
);

CREATE TABLE `Лоты_на_покупку` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `Цена` DECIMAL(10,2) NOT NULL,
  `id_покупателя` INT,
  `id_предмета` INT,
  `id_продавца` INT,
  `id_отзыва` INT,
  `Количество` INT NOT NULL,
  `Стоимость` DECIMAL(10,2) NOT NULL,
  `Статус` VARCHAR(255) NOT NULL,
  FOREIGN KEY (`id_покупателя`) REFERENCES `Покупатели` (`id`),
  FOREIGN KEY (`id_предмета`) REFERENCES `Косметические_предметы` (`id`),
  FOREIGN KEY (`id_продавца`) REFERENCES `Продавцы` (`id`),
  FOREIGN KEY (`id_отзыва`) REFERENCES `Отзывы` (`id`)
);

CREATE TABLE `Отзывы` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `Текст` VARCHAR(255) NOT NULL,
  `id_лота` INT,
  FOREIGN KEY (`id_лота`) REFERENCES `Лоты_на_покупку` (`id`)
);

CREATE TABLE `Продавцы` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `Имя` VARCHAR(255) NOT NULL,
  `Рейтинг` DECIMAL(10,2) NOT NULL,
  `Контакты` VARCHAR(255) NOT NULL
);

CREATE TABLE `Оценка_товара` (
  `id_лота` INT PRIMARY KEY,
  `Оценка_продавца` DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (`id_лота`) REFERENCES `Лоты_на_покупку` (`id`)
);


CREATE INDEX `idx_покупатели_имя` ON `Покупатели` (`имя`);
CREATE INDEX `idx_косметические_предметы_название` ON `Косметические_предметы` (`название`);
CREATE INDEX `idx_лоты_на_покупку_id_покупателя` ON `Лоты_на_покупку` (`id_покупателя`);
CREATE INDEX `idx_лоты_на_покупку_id_предмета` ON `Лоты_на_покупку` (`id_предмета`);
CREATE INDEX `idx_лоты_на_покупку_id_продавца` ON `Лоты_на_покупку` (`id_продавца`);
