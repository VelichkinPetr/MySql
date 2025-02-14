CREATE TABLE IF NOT EXISTS `&Equipment` (
    id INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS `&Rentals` (
    id INT NOT NULL AUTO_INCREMENT,
    equipment_id INT NOT NULL,
    student_name VARCHAR(100) NOT NULL,
    rent_date DATE NOT NULL,
    return_date DATE DEFAULT NULL,
    
    PRIMARY KEY (id),
    FOREIGN KEY (equipment_id) REFERENCES `&Equipment`(id) ON DELETE CASCADE
);


### **1. Триггер**: Автоматическое уменьшение количества оборудования при аренде
#- Если оборудования нет, выбрасывать исключение.

DELIMITER //
CREATE TRIGGER `&UpdateQuantityTrigger` AFTER INSERT ON `&Rentals` FOR EACH ROW
BEGIN

	DECLARE `value` INT;
		SELECT `quantity` INTO `value` FROM `&Equipment`
		WHERE `&Equipment`.id = NEW.equipment_id;
		
	IF `value` = 0 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'оборудования нет!';
	ELSE 
		UPDATE `&Equipment`
		SET `&Equipment`.quantity = `&Equipment`.quantity - 1
		WHERE `&Equipment`.id = NEW.equipment_id;
	END IF;
END //
DELIMITER ;


### **2. Процедура**: Возврат оборудования.
#- Увеличивает количество доступного оборудования.
#- Записывает дату возврата.

DELIMITER //
CREATE PROCEDURE `&ReturnEquipment`( IN `id_equipment` INT)
BEGIN
	DECLARE `value` INT;
		SELECT `equipment_id` INTO `value` FROM `&Rentals`
		WHERE `&Rentals`.id = id_equipment;
		
	UPDATE `&Rentals`
		SET `&Rentals`.return_date = CURDATE()
		WHERE `&Rentals`.id = id_equipment;
	
	UPDATE `&Equipment`
		SET `&Equipment`.quantity = `&Equipment`.quantity + 1
		WHERE `&Equipment`.id = `value`;
END //
DELIMITER ;


### **3. Функция**: Проверить, находится ли оборудование в аренде.
#- Возвращает `TRUE`, если оборудование с указанным **id** в аренде, иначе `FALSE`.

DELIMITER //
CREATE FUNCTION `&IsEquipmentRented` ( `id_equipment` INT)
RETURNS VARCHAR(5) 
BEGIN 

	DECLARE `value` INT;
	SELECT COUNT(*) INTO `value` FROM `&Rentals`
		WHERE `&Rentals`.equipment_id = `id_equipment` AND `&Rentals`.return_date IS NULL;
	
	IF `value` = 0 THEN
		RETURN 'False';
	END IF;
	
	RETURN 'True';
	
END //
DELIMITER ;


### **4. Процедура**: Добавление нового оборудования в систему.
#Принимает название оборудования и его количество
#- Если количество < 1, выбрасывает исключение.

DELIMITER //
CREATE PROCEDURE `&AddEquipment`( IN `name_equipment` VARCHAR(20),
											 IN `count` INT )
BEGIN
	IF `count` < 1 THEN
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = 'Количество не может быть <1 !';
	END IF;
	INSERT INTO `&Equipment` (`name`,`quantity`) VALUE (`name_equipment`,`count`);
END //
DELIMITER ; 


### **5. Процедура**: Очистка старых записей об аренде.
#- Удаляет аренды, завершенные более `N` дней назад


DELIMITER //
CREATE PROCEDURE `&CleanOldRentals`( IN `count_day` INT )
BEGIN
	DELETE FROM `&Rentals`
	WHERE DATEDIFF(CURDATE(),`&Rentals`.rent_date) > count_day;
END //
DELIMITER ; 


### **6. Триггер**: Автоматическая установка даты возврата.
#- Если запись обновляется, а `return_date` остается `NULL`, оно проставляется автоматически (устанавливается текущая дата).

DELIMITER //
CREATE TRIGGER `&AutoReturnDate` BEFORE UPDATE ON `&Rentals` 
FOR EACH ROW
BEGIN
	 
	IF NEW.`return_date` IS NULL THEN
		SET NEW.`return_date` = NOW();
	END IF;
END //
DELIMITER ;


### **7. Функция**: Подсчет количества аренд у студента.
#- Возвращает количество записей об аренде.

DELIMITER //
CREATE FUNCTION `&GetStudentRentalCount` ( `name` VARCHAR(20))
RETURNS INT 
BEGIN 
	DECLARE `value` INT;
		SELECT COUNT(*) INTO `value` FROM `&Rentals`
		WHERE `&Rentals`.student_name = `name`;
	RETURN `value`;
END //
DELIMITER ;

CALL  `&AddEquipment`('Осциллограф', 3);
CALL  `&AddEquipment`('дрель', 2);
CALL  `&AddEquipment`('пила', 1);
INSERT INTO `&Rentals`(equipment_id, student_name,rent_date) VALUE (1,'Ivan','2000-01-01');
INSERT INTO `&Rentals`(equipment_id, student_name,rent_date) VALUE (1,'John','2000-01-01');
INSERT INTO `&Rentals`(equipment_id, student_name,rent_date) VALUE (3,'John','2000-01-01');
INSERT INTO `&Rentals`(equipment_id, student_name,rent_date) VALUE (2,'Petr','2200-01-01');

CALL `&ReturnEquipment`(3)
SELECT `&IsEquipmentRented`(3);
CALL  `&AddEquipment`('Осциллограф', 3);
CALL `&CleanOldRentals`(180);

SELECT `&GetStudentRentalCount`('John');
