CREATE TABLE `customer` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`firstname` varchar(255) NOT NULL,
	`lastname` varchar(255) NOT NULL,
	`identity_type_id` INT NOT NULL,
	`identity_number` varchar(255) NOT NULL,
	`created_at` DATETIME NOT NULL,
	`modified_at` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `identity_type` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`created_at` DATETIME NOT NULL,
	`modified_at` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `room_type` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`description` TEXT NOT NULL,
	`created_at` DATETIME NOT NULL,
	`modified_at` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `equipment` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`equpiment_type_id` INT NOT NULL,
	`name` varchar(255) NOT NULL,
	`description` varchar(255) NOT NULL,
	`created_at` DATETIME NOT NULL,
	`modified_at` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `equipment_type` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	`created_at` DATETIME NOT NULL,
	`modified_at` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `room` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`room_type_id` INT NOT NULL,
	`created_at` DATETIME NOT NULL,
	`modified_at` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `room_equipment` (
	`room_id` INT NOT NULL,
	`equipment_id` INT NOT NULL
);

CREATE TABLE `employee` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`employee_branch_id` INT NOT NULL,
	`firstname` varchar(255) NOT NULL,
	`lastname` varchar(255) NOT NULL,
	`employment_date` DATE NOT NULL,
	`phone` varchar(15) NOT NULL,
	`email` varchar(255) NOT NULL,
	`created_at` DATETIME NOT NULL,
	`modified_at` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `employee_branch` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `room_reservation` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`employee_id` INT NOT NULL,
	`customer_id` INT NOT NULL,
	`room_id` INT NOT NULL,
	`payment_type_id` INT NOT NULL,
	`reservation_date` DATETIME NOT NULL,
	`reservation_period` INT NOT NULL,
	`created_at` DATETIME NOT NULL,
	`modified_at` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `payment_type` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `room_price` (
	`id` INT NOT NULL,
	`room_id` INT NOT NULL,
	`price` DECIMAL NOT NULL,
	`created_at` DATETIME NOT NULL,
	`modified_at` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `customer` ADD CONSTRAINT `customer_fk0` FOREIGN KEY (`identity_type_id`) REFERENCES `identity_type`(`id`);

ALTER TABLE `equipment` ADD CONSTRAINT `equipment_fk0` FOREIGN KEY (`equpiment_type_id`) REFERENCES `equipment_type`(`id`);

ALTER TABLE `room` ADD CONSTRAINT `room_fk0` FOREIGN KEY (`room_type_id`) REFERENCES `room_type`(`id`);

ALTER TABLE `room_equipment` ADD CONSTRAINT `room_equipment_fk0` FOREIGN KEY (`room_id`) REFERENCES `room`(`id`);

ALTER TABLE `room_equipment` ADD CONSTRAINT `room_equipment_fk1` FOREIGN KEY (`equipment_id`) REFERENCES `equipment`(`id`);

ALTER TABLE `employee` ADD CONSTRAINT `employee_fk0` FOREIGN KEY (`employee_branch_id`) REFERENCES `employee_branch`(`id`);

ALTER TABLE `room_reservation` ADD CONSTRAINT `room_reservation_fk0` FOREIGN KEY (`employee_id`) REFERENCES `employee`(`id`);

ALTER TABLE `room_reservation` ADD CONSTRAINT `room_reservation_fk1` FOREIGN KEY (`customer_id`) REFERENCES `customer`(`id`);

ALTER TABLE `room_reservation` ADD CONSTRAINT `room_reservation_fk2` FOREIGN KEY (`room_id`) REFERENCES `room`(`id`);

ALTER TABLE `room_reservation` ADD CONSTRAINT `room_reservation_fk3` FOREIGN KEY (`payment_type_id`) REFERENCES `payment_type`(`id`);

ALTER TABLE `room_price` ADD CONSTRAINT `room_price_fk0` FOREIGN KEY (`room_id`) REFERENCES `room`(`id`);

