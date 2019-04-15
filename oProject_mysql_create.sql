CREATE TABLE `User` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`username` varchar(200) UNIQUE,
	`firstname` varchar(200),
	`lastname` varchar(200),
	`hour_rate` FLOAT DEFAULT '0',
	`email` varchar(200) NOT NULL UNIQUE,
	PRIMARY KEY (`id`)
);

CREATE TABLE `User_role` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`user_id` INT NOT NULL AUTO_INCREMENT,
	`role_id` INT NOT NULL AUTO_INCREMENT,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Role` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`name` varchar(200) NOT NULL UNIQUE,
	`fullname` varchar(500) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Project` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`Title` varchar(200) NOT NULL,
	`start_date` DATE,
	`end_date` DATE,
	`budget` DECIMAL(15,3),
	`is_closed` INT(1) NOT NULL DEFAULT '0',
	`flow_id` INT,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Project_User` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`rate` DECIMAL NOT NULL DEFAULT '0',
	`user_id` INT NOT NULL,
	`project_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Task` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`title` varchar(200) NOT NULL,
	`weight` INT DEFAULT '1',
	`estimated_minutes` INT,
	`start_date` DATETIME,
	`end_date` DATETIME,
	`progress` INT NOT NULL DEFAULT '0',
	`user_id` INT,
	`project_id` INT NOT NULL AUTO_INCREMENT,
	`phase_id` INT,
	`milestone_id` INT,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Statu` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`title` varchar(200) NOT NULL UNIQUE,
	`is_closed` INT(1) NOT NULL DEFAULT '0',
	`is_progress` INT(1) NOT NULL DEFAULT '0',
	`task_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Work` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`rate` DECIMAL(15,3) NOT NULL,
	`minutes` INT NOT NULL,
	`user_id` INT NOT NULL,
	`task_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Flow` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`title` varchar(200) NOT NULL UNIQUE,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Phase` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`title` varchar(200) NOT NULL,
	`flow_id` INT NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `Milestone` (
	`id` INT NOT NULL AUTO_INCREMENT,
	`title` varchar(200) NOT NULL,
	`start_date` DATETIME NOT NULL,
	`project_id` INT NOT NULL,
	`end_date` DATETIME NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `User_role` ADD CONSTRAINT `User_role_fk0` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`);

ALTER TABLE `User_role` ADD CONSTRAINT `User_role_fk1` FOREIGN KEY (`role_id`) REFERENCES `Role`(`id`);

ALTER TABLE `Project` ADD CONSTRAINT `Project_fk0` FOREIGN KEY (`flow_id`) REFERENCES `Flow`(`id`);

ALTER TABLE `Project_User` ADD CONSTRAINT `Project_User_fk0` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`);

ALTER TABLE `Project_User` ADD CONSTRAINT `Project_User_fk1` FOREIGN KEY (`project_id`) REFERENCES `Project`(`id`);

ALTER TABLE `Task` ADD CONSTRAINT `Task_fk0` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`);

ALTER TABLE `Task` ADD CONSTRAINT `Task_fk1` FOREIGN KEY (`project_id`) REFERENCES `Project`(`id`);

ALTER TABLE `Task` ADD CONSTRAINT `Task_fk2` FOREIGN KEY (`phase_id`) REFERENCES `Phase`(`id`);

ALTER TABLE `Task` ADD CONSTRAINT `Task_fk3` FOREIGN KEY (`milestone_id`) REFERENCES `Milestone`(`id`);

ALTER TABLE `Statu` ADD CONSTRAINT `Statu_fk0` FOREIGN KEY (`task_id`) REFERENCES `Task`(`id`);

ALTER TABLE `Work` ADD CONSTRAINT `Work_fk0` FOREIGN KEY (`user_id`) REFERENCES `User`(`id`);

ALTER TABLE `Work` ADD CONSTRAINT `Work_fk1` FOREIGN KEY (`task_id`) REFERENCES `Task`(`id`);

ALTER TABLE `Phase` ADD CONSTRAINT `Phase_fk0` FOREIGN KEY (`flow_id`) REFERENCES `Flow`(`id`);

ALTER TABLE `Milestone` ADD CONSTRAINT `Milestone_fk0` FOREIGN KEY (`project_id`) REFERENCES `Project`(`id`);

