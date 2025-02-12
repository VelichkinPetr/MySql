CREATE TABLE IF NOT EXISTS `Team`(
		`id` INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
		`name` ENUM ('BackEnd','FrontEnd','FullStack', 'DevOps', 'DataScientist','Testers') NOT NULL
);

CREATE TABLE IF NOT EXISTS `Project`(
	`id` INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	`purpose`  VARCHAR(255) NOT NULL,
	`description` TEXT(2000) NOT NULL,
	`date_start` DATE,
	`deadline` DATE NOT NULL,
	`id_team` INTEGER UNSIGNED NOT NULL,
	
	CONSTRAINT fk_project_team
	FOREIGN KEY (`id_team`)
	REFERENCES `Team`(`id`)
);

CREATE TABLE IF NOT EXISTS `Role`(
		`id` INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
		`name` VARCHAR(20) NOT NULL,
		`rights` VARCHAR(255) NOT NULL,
		`obligations` VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS `Address`(
		`id` INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
		`city` VARCHAR(50) NOT NULL,
		`street` VARCHAR(50) NOT NULL,
		`house_number` MEDIUMINT ,
		`apartment` MEDIUMINT
);

CREATE TABLE IF NOT EXISTS `Employee`(
		`id` INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
		`full_name` VARCHAR(50) NOT NULL,
		`sex` ENUM('male','female') NOT NULL,
		`telefon_number` VARCHAR(20) NOT NULL,
		`e_mail` VARCHAR(50) NOT NULL,
		`id_address` INTEGER UNSIGNED NOT NULL,
		
		CONSTRAINT fk_employee_address
		FOREIGN KEY (`id_address`)
		REFERENCES `Address`(`id`)
);

CREATE TABLE IF NOT EXISTS `TeamEmployeeRole`(
		`id_team` INTEGER UNSIGNED,
		`id_employee` INTEGER UNSIGNED,
		`id_role` INTEGER UNSIGNED,
		CONSTRAINT PRIMARY KEY(`id_team`,`id_employee`,`id_role`),
		
		CONSTRAINT fk_TeamEmployeeRole_Team
		FOREIGN KEY (`id_team`)
		REFERENCES `Team`(`id`),
		
		CONSTRAINT fk_TeamEmployeeRole_Employee
		FOREIGN KEY (`id_employee`)
		REFERENCES `Employee`(`id`),
		
		CONSTRAINT fk_TeamEmployeeRole_Role
		FOREIGN KEY (`id_role`)
		REFERENCES `Role`(`id`)
);

CREATE TABLE IF NOT EXISTS `Task`(
		`id` INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
		`description` TEXT(2000) NOT NULL,
		`status` ENUM('awaiting', 'running', 'completed') NOT NULL,
		`deadline` DATE NOT NULL,
		`priority` ENUM('0','1','2','3','4','5','6','7','8','9','10') NOT NULL
);

CREATE TABLE IF NOT EXISTS `TaskEmployee`(
		`id_employee` INTEGER UNSIGNED,
		`id_task` INTEGER UNSIGNED,
		CONSTRAINT PRIMARY KEY(`id_employee`,`id_task`),
		
		CONSTRAINT fk_TaskEmployee_Task
		FOREIGN KEY (`id_task`)
		REFERENCES `Task`(`id`),
		
		CONSTRAINT fk_TaskEmployee_Employee
		FOREIGN KEY (`id_employee`)
		REFERENCES `Employee`(`id`)
);


#Количество Женщин и Мужчин разрабов
DELIMITER //
CREATE PROCEDURE count_employee_on_sex()
BEGIN
	SELECT sex,COUNT(*)
	FROM Employee
	GROUP BY Employee.sex;
END //
DELIMITER ;

CALL count_employee_on_sex()

#Поиск имен всех разрабов по их роли в проектах
DELIMITER //
CREATE PROCEDURE all_employee_role (`need_role` TEXT)
BEGIN
	SELECT Employee.`name`, Role.`name`
	FROM `Role`
	
	INNER JOIN TeamEmployeeRole
	ON TeamEmployeeRole.id_role = Role.id
	
	INNER JOIN Employee
	ON TeamEmployeeRole.id_employee = Employee.id
	
	WHERE Role.`name` = need_role;
END //
DELIMITER ;

CALL all_employee_role('Gregg')


#количество разрабов использующих заданный домен почты
DELIMITER //
CREATE PROCEDURE count_employee_domen_email (`domen` TEXT)
BEGIN
	SELECT `domen`, count(*)
	FROM Employee
	#WHERE INSTR(Employee.e_mail, `domen`) > 0;
	WHERE Employee.e_mail LIKE CONCAT('%', `domen`);
END //
DELIMITER ;

CALL count_employee_domen_email('gmail.com')

DROP procedure count_employee_domen_email

ALTER TABLE Employee
ADD `age` int

#получени статуса Пенсионер по возрасту разраба
DELIMITER //
CREATE PROCEDURE get_status (IN employee_name VARCHAR(100),
										OUT employee_status VARCHAR(5))
BEGIN
	#Объявление переменной
	DECLARE employee_age INT;
	
	SELECT age into employee_age FROM Employee
	WHERE `name` = employee_name
	
	IF employee_age >= 65 THEN
		SET employee_status = 'Пенсионер';
	ELSE 
		SET employee_status = 'не пенсионер';
	END IF;
END //
DELIMITER ;

CALL get_status('Bob',@result)
SELECT @result






'создание стобца'
ALTER TABLE `Employee`
ADD `birthday` DATE NOT NULL

'копирование столбца в столбец'
UPDATE `Employee` e JOIN `Address` a ON e.id = a.id
SET e.birthday = a.city

'рандомная дата в столбце через секунды с 1970 года'
UPDATE `Employee`
SET `birthday` = ( SELECT FROM_UNIXTIME( UNIX_TIMESTAMP('1990-01-01')+ RAND()*(UNIX_TIMESTAMP('2025-01-01')-UNIX_TIMESTAMP('1990-01-01')) ) )
 
'процедура/ функция поиска среднего значения'
DELIMITER //
CREATE PROCEDURE average_apartment()
BEGIN
	SELECT AVG(`apartment`) 
	FROM `Address`;
END //
DELIMITER ;


'процедура/ функция поиска среднего значения'
DELIMITER //
CREATE PROCEDURE average_apartment(neewd_house_apartment INT)
BEGIN
	SELECT AVG(`apartment`) 
	FROM `Address`
	WHERE house_apartment IS neewd_house_apartment;
END //
DELIMITER ;

'вызов процедуры'
CALL average_apartment ();

'удаление процедуры'
DROP PROCEDURE average_apartment;




ALTER TABLE Employee
ADD INDEX index_name(`name`);


CREATE INDEX index_name
ON Employee (`name`);