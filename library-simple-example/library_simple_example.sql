CREATE TABLE `book` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`release_date` DATE NOT NULL,
	`isbn` varchar(13) NOT NULL,
	`created_at` DATETIME NOT NULL,
	`modified_at` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `entity` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`book_id` INT NOT NULL,
	`author_id` INT NOT NULL,
	`publishing_id` INT NOT NULL,
	`domain_id` INT NOT NULL,
	`created_at` DATETIME NOT NULL,
	`modified_at` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `publishing` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`description` TEXT NOT NULL,
	`created_at` DATETIME NOT NULL,
	`modified_at` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `reader` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`firstname` varchar(255) NOT NULL,
	`lastname` varchar(255) NOT NULL,
	`phone` varchar(15) NOT NULL,
	`email` varchar(255) NOT NULL,
	`active` varchar(1) NOT NULL,
	`created_at` DATETIME NOT NULL,
	`modified_at` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `hire` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`entity_id` INT NOT NULL,
	`reader_id` INT NOT NULL,
	`hire_date` DATETIME NOT NULL,
	`return_date` DATETIME DEFAULT 'NULL',
	`created_at` DATETIME NOT NULL,
	`modified_at` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `domain` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`created_at` DATETIME NOT NULL,
	`modified_at` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `author` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`firstname` varchar(255) NOT NULL,
	`lastname` varchar(255) NOT NULL,
	`created_at` DATETIME NOT NULL,
	`modified_at` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `entity` ADD CONSTRAINT `entity_fk0` FOREIGN KEY (`book_id`) REFERENCES `book`(`id`);

ALTER TABLE `entity` ADD CONSTRAINT `entity_fk1` FOREIGN KEY (`author_id`) REFERENCES `author`(`id`);

ALTER TABLE `entity` ADD CONSTRAINT `entity_fk2` FOREIGN KEY (`publishing_id`) REFERENCES `publishing`(`id`);

ALTER TABLE `entity` ADD CONSTRAINT `entity_fk3` FOREIGN KEY (`domain_id`) REFERENCES `domain`(`id`);

ALTER TABLE `hire` ADD CONSTRAINT `hire_fk0` FOREIGN KEY (`entity_id`) REFERENCES `entity`(`id`);

ALTER TABLE `hire` ADD CONSTRAINT `hire_fk1` FOREIGN KEY (`reader_id`) REFERENCES `reader`(`id`);

