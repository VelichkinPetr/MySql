# Небольшой интернет магазин компьютерных товаров
# Нужно хранить информацию о:

# 1. Товарах (категория, цена за единицу товара, количество)
CREATE TABLE IF NOT EXISTS `$Product`(
	`id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	`category` VARCHAR(50),
	`price_per_unit` SMALLINT,
	`count` SMALLINT
);

# 2. Покупателях (email, фио, телефон, список его заказов)
CREATE TABLE IF NOT EXISTS `$Buyer`(
	`id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	`e_mail` VARCHAR(50),
	`first_name` VARCHAR(20),
	`second_name` VARCHAR(20),
	`last_name` VARCHAR(20),
	`phone_number` VARCHAR(20)
);

# 3. Заказах (дата продажи, состав, общая стоимость)
CREATE TABLE IF NOT EXISTS `$Order`(
	`id` INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	`date` TIMESTAMP,
	`id_buyer` INT UNSIGNED,
	
	CONSTRAINT fk_order_buyer
	FOREIGN KEY (`id_buyer`)
	REFERENCES `$Buyer`(`id`)
);

#Внешний ключ между Заказами и Продуктами 
CREATE TABLE IF NOT EXISTS `$OrderProduct`(
	`id_order` INT UNSIGNED,
	`id_product` INT UNSIGNED,
	
	CONSTRAINT fk_order_order_product
	FOREIGN KEY (`id_order`)
	REFERENCES `$Order`(`id`),
	
	CONSTRAINT fk_product_order_product
	FOREIGN KEY (`id_product`)
	REFERENCES `$Product`(`id`)
);

# Часто обращаемся к покупателям по email
CREATE INDEX index_email ON `$Buyer`(`e_mail`);
# Часто образаемся к заказам по дате продаже
CREATE INDEX index_date ON `$Order`(`date`);


INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Ball', '9723', '12');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Chair', '13701', '12');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Bike', '16030', '13');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Ball', '12672', '2');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Fish', '8040', '3');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Chips', '3708', '16');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Shirt', '9480', '13');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Soap', '3292', '8');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Fish', '4360', '18');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Ball', '11335', '16');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Pants', '1595', '1');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Tuna', '8882', '20');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Gloves', '11630', '3');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Towels', '6917', '10');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Computer', '13145', '1');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Fish', '622', '17');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Fish', '5130', '18');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Gloves', '10739', '20');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Table', '19875', '6');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Computer', '10587', '6');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Table', '2251', '13');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Pizza', '13693', '7');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Soap', '19247', '9');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Soap', '9293', '11');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Soap', '19490', '19');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Bacon', '1589', '11');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Cheese', '4091', '10');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Shirt', '5891', '19');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Chair', '12602', '4');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Sausages', '1231', '4');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Bacon', '6650', '3');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Keyboard', '6645', '5');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Mouse', '18440', '10');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Hat', '17042', '6');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Towels', '19653', '19');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Towels', '13973', '7');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Sausages', '6150', '7');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Chicken', '14741', '18');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Chicken', '11652', '16');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Cheese', '14650', '4');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Shoes', '19917', '3');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Bike', '17918', '17');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Gloves', '3966', '16');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Salad', '4116', '14');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Chair', '12801', '12');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Bacon', '14439', '11');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Chair', '9502', '5');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Mouse', '1108', '12');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Computer', '4016', '2');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Fish', '16467', '14');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Shoes', '19593', '6');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Salad', '10753', '18');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Towels', '10547', '20');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Chips', '16050', '20');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Bacon', '4389', '6');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Pants', '18517', '20');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Bike', '4649', '4');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Hat', '19499', '10');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Soap', '15852', '1');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Chair', '6205', '6');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Chicken', '3379', '11');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Gloves', '15454', '13');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Bacon', '11224', '12');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Fish', '13574', '14');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Shoes', '784', '1');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Shoes', '19359', '11');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Mouse', '17891', '16');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Ball', '18221', '18');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Mouse', '14389', '2');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Soap', '14954', '6');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Pants', '7225', '6');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Mouse', '12182', '14');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Hat', '960', '13');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Ball', '17997', '1');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Shirt', '19351', '10');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Pants', '17034', '4');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Sausages', '15263', '10');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Chair', '5357', '2');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Chair', '11525', '3');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Chicken', '6807', '13');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Gloves', '15554', '2');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Chair', '18577', '2');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Bike', '15666', '6');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Keyboard', '18491', '8');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Pants', '1375', '19');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Sausages', '9675', '2');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Sausages', '18575', '4');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Bike', '8189', '17');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Mouse', '12749', '18');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Car', '10801', '2');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Shirt', '11900', '7');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Bike', '7617', '1');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Chips', '13116', '10');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Keyboard', '17131', '6');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Keyboard', '19483', '12');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Shirt', '4494', '12');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Shoes', '5898', '7');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Computer', '16803', '4');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Car', '12312', '10');
INSERT INTO `$Product` (`category`, `price_per_unit`, `count`) VALUES ('Chips', '4555', '3');

INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Rebeka_Rutherford98@yahoo.com', 'Reed', 'Greer', 'Stracke', '8-466-303-01-07');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Golden33@yahoo.com', 'Jeffry', 'Reign', 'Bernier', '3-558-525-71-81');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Annetta.Wehner87@hotmail.com', 'Trever', 'Elliott', 'Leuschke', '0-603-962-03-74');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Bailey23@yahoo.com', 'Vivienne', 'Angel', 'Gerhold', '4-288-666-30-41');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Neil23@yahoo.com', 'Darien', 'Marlowe', 'Reinger', '6-403-243-49-74');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Elenora.Kulas@hotmail.com', 'Miles', 'Micah', 'Kuhlman', '5-242-964-86-75');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Maximo88@yahoo.com', 'Jedediah', 'Anderson', 'Boyer', '7-533-693-09-72');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Abbigail26@hotmail.com', 'Alycia', 'Sasha', 'Feeney', '8-491-200-14-99');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Leanna73@gmail.com', 'Alysson', 'Alex', 'Brown', '3-783-533-77-98');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Lily_Hills22@yahoo.com', 'Breanna', 'Shiloh', 'Grant', '3-429-661-09-79');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Deon34@hotmail.com', 'Adolf', 'River', 'Friesen', '1-145-508-19-69');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Lucas.Kovacek76@gmail.com', 'Delaney', 'Alex', 'Cummerata', '4-857-941-52-56');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Bulah32@hotmail.com', 'Ona', 'Parker', 'Balistreri', '3-931-824-13-40');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Joaquin.Feil@hotmail.com', 'Chanelle', 'Kai', 'Lueilwitz', '3-402-980-76-67');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Ara_Mohr7@gmail.com', 'Easter', 'James', 'Stiedemann', '5-139-908-52-00');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Ramon.Schmitt@gmail.com', 'Stephany', 'Taylor', 'Buckridge', '1-695-552-13-43');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Claudia_Nicolas@yahoo.com', 'Kale', 'Jaden', 'Runolfsdottir', '8-409-727-90-15');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Marcia_Bahringer4@hotmail.com', 'Bryana', 'Taylor', 'Buckridge', '1-946-341-17-48');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Harley.Fritsch44@hotmail.com', 'Rose', 'James', 'Erdman', '0-501-573-71-04');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Jimmy40@hotmail.com', 'Brooklyn', 'Jamie', 'Nienow', '0-563-818-27-58');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Roscoe1@hotmail.com', 'Caleb', 'Arden', 'Rodriguez', '3-303-987-33-97');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Hal_Harvey14@yahoo.com', 'Meta', 'Kyle', 'Johnson', '7-268-634-52-05');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Evert_Schaden@yahoo.com', 'Beaulah', 'Billie', 'Jenkins', '6-815-458-72-03');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Anastasia_Will@yahoo.com', 'Maryse', 'Arden', 'Kilback', '7-713-810-07-90');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Lenna.Schowalter@hotmail.com', 'Margret', 'Reagan', 'Bins', '0-573-540-78-34');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Eryn_Shanahan@gmail.com', 'Claudie', 'Nico', 'Hane', '7-087-607-83-74');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Danika_Reynolds@gmail.com', 'Guadalupe', 'Skyler', 'Kutch', '4-634-998-76-10');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Greg_Lynch96@yahoo.com', 'Ansel', 'Sawyer', 'Herzog', '9-229-800-05-65');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Giovani14@yahoo.com', 'Angel', 'Bailey', 'Purdy', '7-067-514-74-41');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Cecelia83@gmail.com', 'Ona', 'Greer', 'Auer', '4-355-132-11-63');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Hettie31@hotmail.com', 'Casper', 'Shiloh', 'Nicolas', '0-872-061-38-41');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Ethel73@gmail.com', 'Parker', 'Arden', 'Dietrich', '9-021-459-14-06');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Janick40@yahoo.com', 'Charles', 'Sawyer', 'Beer', '6-681-216-76-32');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Ephraim8@gmail.com', 'Angel', 'Jordan', 'Ratke', '5-016-482-97-34');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Kattie.Brown@hotmail.com', 'Ophelia', 'Rory', 'Rowe', '7-448-338-35-09');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Terrill98@hotmail.com', 'Hettie', 'Emerson', 'Jakubowski', '5-259-544-62-10');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Jewel_Barton82@yahoo.com', 'Ryley', 'Parker', 'Wuckert', '2-855-897-68-98');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Kariane.Conroy@hotmail.com', 'Madilyn', 'Reese', 'Harber', '3-809-302-88-47');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Tomasa_Douglas@hotmail.com', 'Carlotta', 'Blake', 'Kovacek', '1-727-980-25-92');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Marjolaine62@hotmail.com', 'Barbara', 'Bowie', 'Spinka', '2-843-237-48-15');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Toney.Lindgren@hotmail.com', 'Cornelius', 'Bailey', 'Dicki', '5-507-445-83-60');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Dee_Corwin44@yahoo.com', 'Zula', 'Jaden', 'Hane', '7-484-004-44-29');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Juana.Medhurst@yahoo.com', 'Earnest', 'Jamie', 'Reichel', '6-864-944-33-98');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Mara93@gmail.com', 'Delta', 'Ryan', 'Jenkins', '8-789-146-83-94');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Camden.Littel@hotmail.com', 'Reed', 'Rory', 'Wunsch', '9-690-470-41-50');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Alanis.Gottlieb@gmail.com', 'Vickie', 'Greer', 'Anderson', '2-358-510-18-28');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Althea.Hudson16@yahoo.com', 'Lavina', 'Hayden', 'Satterfield', '1-911-546-65-27');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Ima_Gutmann88@gmail.com', 'Kacey', 'Micah', 'Beatty', '2-709-952-51-47');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Monty_Kiehn87@hotmail.com', 'Clement', 'Parker', 'Jerde', '1-037-463-30-99');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Austyn.Crona41@hotmail.com', 'Stephany', 'Corey', 'Lang', '2-788-651-00-65');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Carmel_Hoeger@gmail.com', 'Howell', 'Taylor', 'Swift', '7-159-031-58-45');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Iva_Friesen@yahoo.com', 'Assunta', 'Jamie', 'Collins', '1-876-458-13-02');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Trey84@hotmail.com', 'Shanon', 'Shiloh', 'Gerhold', '2-453-843-25-04');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Kayla_Frami56@gmail.com', 'Gia', 'Billie', 'Bradtke', '4-726-355-14-27');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Harmon34@gmail.com', 'Jeanie', 'North', 'Swaniawski', '0-713-031-49-21');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Kelly.Fadel@gmail.com', 'Jamison', 'Shawn', 'Lemke', '0-268-768-25-06');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Salma.Adams21@yahoo.com', 'Moses', 'Noah', 'Dare', '4-900-736-68-54');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Sabryna_Smitham1@hotmail.com', 'Burley', 'Logan', 'Dibbert', '1-073-865-67-33');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Roxanne.Lakin7@gmail.com', 'Howard', 'Cameron', 'Hermiston', '8-347-171-78-30');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Ahmad.Pfeffer@hotmail.com', 'Evan', 'Bowie', 'Williamson', '4-591-735-51-25');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Annamae.Murphy66@hotmail.com', 'Aracely', 'Brooklyn', 'Kerluke', '1-479-124-09-27');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Magali_Jacobs@hotmail.com', 'Lorena', 'Shiloh', 'Zboncak', '9-627-691-69-17');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Earl35@yahoo.com', 'Otha', 'Jordan', 'Kemmer', '1-185-517-62-51');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Colin89@hotmail.com', 'Herta', 'Gray', 'Jacobson', '7-113-495-20-22');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Jewell.Herzog8@gmail.com', 'Alyce', 'Leslie', 'Grimes', '6-127-336-62-44');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Elmira.Harvey@yahoo.com', 'Devan', 'Ryan', 'Heidenreich', '4-950-973-71-33');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Muriel_Hudson@hotmail.com', 'Breanna', 'Bailey', 'Daugherty', '2-068-418-74-17');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Cathryn.Conroy51@hotmail.com', 'Lois', 'Kennedy', 'Kautzer', '8-193-590-28-24');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Leslie.Harvey@gmail.com', 'Elnora', 'Billie', 'Legros', '0-029-464-24-64');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Hobart41@gmail.com', 'Lamont', 'Quinn', 'Mayert', '5-095-021-84-30');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Monserrate44@yahoo.com', 'Gayle', 'Angel', 'Ortiz', '0-595-389-48-10');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Kale.Bayer@hotmail.com', 'Jerrod', 'Nico', 'Klocko', '1-736-324-99-83');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Florian7@gmail.com', 'Jennings', 'Sawyer', 'Nienow', '7-893-486-16-45');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Dominique_Collins@yahoo.com', 'Nina', 'Emerson', 'Skiles', '0-951-310-45-54');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Judah68@hotmail.com', 'Brock', 'Bowie', 'Wintheiser', '8-684-995-71-26');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Ludwig.Lubowitz@gmail.com', 'Maynard', 'Cameron', 'Robel', '3-376-325-23-57');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Finn14@gmail.com', 'Mafalda', 'Bowie', 'Padberg', '8-083-159-77-68');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Flo41@yahoo.com', 'Brionna', 'Finley', 'Lind', '9-446-320-35-11');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Luis.Rowe@gmail.com', 'Elsie', 'Reign', 'Tillman', '6-298-578-74-54');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Cathryn_Zboncak84@gmail.com', 'Alize', 'Parker', 'Friesen', '1-251-857-00-77');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Marian24@hotmail.com', 'Kassandra', 'Emerson', 'Rippin', '5-519-667-19-83');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Aubree.Wilderman@hotmail.com', 'Ronny', 'August', 'Keeling', '0-156-637-20-18');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Brett34@gmail.com', 'Loraine', 'Kennedy', 'Balistreri', '6-609-804-38-91');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Megane.Raynor@gmail.com', 'Nathanial', 'London', 'Schoen', '7-133-955-28-85');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Polly80@gmail.com', 'Anna', 'Rory', 'Gleason', '5-486-919-06-82');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Kenna.Blick40@gmail.com', 'Rae', 'Noah', 'Legros', '1-648-415-86-20');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Vivianne.Weber@hotmail.com', 'Leonie', 'Ryan', 'Mueller', '0-649-827-20-02');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Edgardo_Waters@yahoo.com', 'Dillon', 'Rory', 'Wilkinson', '0-777-254-13-67');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Margaret62@hotmail.com', 'Kenyatta', 'Corey', 'Hauck', '1-396-958-64-30');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Zella.Farrell@yahoo.com', 'Unique', 'Jaden', 'McKenzie', '5-998-025-18-70');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Bryon.Vandervort40@gmail.com', 'Brandy', 'Arden', 'Watsica', '6-879-370-10-83');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Johanna_Swift@hotmail.com', 'Delphia', 'Arden', 'Pagac', '2-451-899-73-49');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Keshaun_Howell@yahoo.com', 'Bernie', 'Austin', 'Murazik', '4-090-867-63-92');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Nikita.Lubowitz0@gmail.com', 'Fae', 'Taylor', 'Grant', '1-545-482-41-02');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Lourdes_Greenfelder@hotmail.com', 'Lincoln', 'Sage', 'Pouros', '0-658-643-56-79');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Elizabeth32@yahoo.com', 'Jackeline', 'Reagan', 'Carter', '5-765-278-87-00');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Angelina_Barrows1@yahoo.com', 'Johann', 'Riley', 'Hagenes', '6-719-643-51-85');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Winona85@yahoo.com', 'Abigail', 'Marlowe', 'Wehner', '5-858-665-49-36');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Eulah_Kirlin@yahoo.com', 'Cary', 'Phoenix', 'Spinka', '1-544-845-16-15');
INSERT INTO `$Buyer` (`e_mail`, `first_name`, `second_name`, `last_name`, `phone_number`) VALUES ('Florencio_Rodriguez@gmail.com', 'Garrison', 'Charlie', 'Dickinson', '7-833-574-15-95');

INSERT INTO `$Order` (`id_buyer`) VALUES ('25');
INSERT INTO `$Order` (`id_buyer`) VALUES ('53');
INSERT INTO `$Order` (`id_buyer`) VALUES ('3');
INSERT INTO `$Order` (`id_buyer`) VALUES ('56');
INSERT INTO `$Order` (`id_buyer`) VALUES ('91');
INSERT INTO `$Order` (`id_buyer`) VALUES ('62');
INSERT INTO `$Order` (`id_buyer`) VALUES ('54');
INSERT INTO `$Order` (`id_buyer`) VALUES ('67');
INSERT INTO `$Order` (`id_buyer`) VALUES ('89');
INSERT INTO `$Order` (`id_buyer`) VALUES ('2');
INSERT INTO `$Order` (`id_buyer`) VALUES ('65');
INSERT INTO `$Order` (`id_buyer`) VALUES ('9');
INSERT INTO `$Order` (`id_buyer`) VALUES ('18');
INSERT INTO `$Order` (`id_buyer`) VALUES ('1');
INSERT INTO `$Order` (`id_buyer`) VALUES ('25');
INSERT INTO `$Order` (`id_buyer`) VALUES ('73');
INSERT INTO `$Order` (`id_buyer`) VALUES ('26');
INSERT INTO `$Order` (`id_buyer`) VALUES ('74');
INSERT INTO `$Order` (`id_buyer`) VALUES ('24');
INSERT INTO `$Order` (`id_buyer`) VALUES ('23');
INSERT INTO `$Order` (`id_buyer`) VALUES ('71');
INSERT INTO `$Order` (`id_buyer`) VALUES ('85');
INSERT INTO `$Order` (`id_buyer`) VALUES ('89');
INSERT INTO `$Order` (`id_buyer`) VALUES ('96');
INSERT INTO `$Order` (`id_buyer`) VALUES ('58');
INSERT INTO `$Order` (`id_buyer`) VALUES ('64');
INSERT INTO `$Order` (`id_buyer`) VALUES ('29');
INSERT INTO `$Order` (`id_buyer`) VALUES ('72');
INSERT INTO `$Order` (`id_buyer`) VALUES ('61');
INSERT INTO `$Order` (`id_buyer`) VALUES ('87');
INSERT INTO `$Order` (`id_buyer`) VALUES ('96');
INSERT INTO `$Order` (`id_buyer`) VALUES ('65');
INSERT INTO `$Order` (`id_buyer`) VALUES ('53');
INSERT INTO `$Order` (`id_buyer`) VALUES ('31');
INSERT INTO `$Order` (`id_buyer`) VALUES ('36');
INSERT INTO `$Order` (`id_buyer`) VALUES ('93');
INSERT INTO `$Order` (`id_buyer`) VALUES ('53');
INSERT INTO `$Order` (`id_buyer`) VALUES ('39');
INSERT INTO `$Order` (`id_buyer`) VALUES ('45');
INSERT INTO `$Order` (`id_buyer`) VALUES ('65');
INSERT INTO `$Order` (`id_buyer`) VALUES ('69');
INSERT INTO `$Order` (`id_buyer`) VALUES ('6');
INSERT INTO `$Order` (`id_buyer`) VALUES ('4');
INSERT INTO `$Order` (`id_buyer`) VALUES ('76');
INSERT INTO `$Order` (`id_buyer`) VALUES ('18');
INSERT INTO `$Order` (`id_buyer`) VALUES ('32');
INSERT INTO `$Order` (`id_buyer`) VALUES ('78');
INSERT INTO `$Order` (`id_buyer`) VALUES ('32');
INSERT INTO `$Order` (`id_buyer`) VALUES ('92');
INSERT INTO `$Order` (`id_buyer`) VALUES ('7');
INSERT INTO `$Order` (`id_buyer`) VALUES ('67');
INSERT INTO `$Order` (`id_buyer`) VALUES ('86');
INSERT INTO `$Order` (`id_buyer`) VALUES ('42');
INSERT INTO `$Order` (`id_buyer`) VALUES ('68');
INSERT INTO `$Order` (`id_buyer`) VALUES ('79');
INSERT INTO `$Order` (`id_buyer`) VALUES ('11');
INSERT INTO `$Order` (`id_buyer`) VALUES ('12');
INSERT INTO `$Order` (`id_buyer`) VALUES ('79');
INSERT INTO `$Order` (`id_buyer`) VALUES ('28');
INSERT INTO `$Order` (`id_buyer`) VALUES ('17');
INSERT INTO `$Order` (`id_buyer`) VALUES ('94');
INSERT INTO `$Order` (`id_buyer`) VALUES ('91');
INSERT INTO `$Order` (`id_buyer`) VALUES ('87');
INSERT INTO `$Order` (`id_buyer`) VALUES ('3');
INSERT INTO `$Order` (`id_buyer`) VALUES ('27');
INSERT INTO `$Order` (`id_buyer`) VALUES ('14');
INSERT INTO `$Order` (`id_buyer`) VALUES ('14');
INSERT INTO `$Order` (`id_buyer`) VALUES ('67');
INSERT INTO `$Order` (`id_buyer`) VALUES ('94');
INSERT INTO `$Order` (`id_buyer`) VALUES ('60');
INSERT INTO `$Order` (`id_buyer`) VALUES ('96');
INSERT INTO `$Order` (`id_buyer`) VALUES ('69');
INSERT INTO `$Order` (`id_buyer`) VALUES ('30');
INSERT INTO `$Order` (`id_buyer`) VALUES ('100');
INSERT INTO `$Order` (`id_buyer`) VALUES ('22');
INSERT INTO `$Order` (`id_buyer`) VALUES ('86');
INSERT INTO `$Order` (`id_buyer`) VALUES ('87');
INSERT INTO `$Order` (`id_buyer`) VALUES ('63');
INSERT INTO `$Order` (`id_buyer`) VALUES ('97');
INSERT INTO `$Order` (`id_buyer`) VALUES ('73');
INSERT INTO `$Order` (`id_buyer`) VALUES ('10');
INSERT INTO `$Order` (`id_buyer`) VALUES ('51');
INSERT INTO `$Order` (`id_buyer`) VALUES ('88');
INSERT INTO `$Order` (`id_buyer`) VALUES ('95');
INSERT INTO `$Order` (`id_buyer`) VALUES ('78');
INSERT INTO `$Order` (`id_buyer`) VALUES ('29');
INSERT INTO `$Order` (`id_buyer`) VALUES ('57');
INSERT INTO `$Order` (`id_buyer`) VALUES ('75');
INSERT INTO `$Order` (`id_buyer`) VALUES ('87');
INSERT INTO `$Order` (`id_buyer`) VALUES ('71');
INSERT INTO `$Order` (`id_buyer`) VALUES ('28');
INSERT INTO `$Order` (`id_buyer`) VALUES ('37');
INSERT INTO `$Order` (`id_buyer`) VALUES ('78');
INSERT INTO `$Order` (`id_buyer`) VALUES ('58');
INSERT INTO `$Order` (`id_buyer`) VALUES ('71');
INSERT INTO `$Order` (`id_buyer`) VALUES ('3');
INSERT INTO `$Order` (`id_buyer`) VALUES ('98');
INSERT INTO `$Order` (`id_buyer`) VALUES ('46');
INSERT INTO `$Order` (`id_buyer`) VALUES ('79');
INSERT INTO `$Order` (`id_buyer`) VALUES ('25');

INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('57', '88');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('53', '34');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('56', '51');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('31', '31');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('59', '73');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('39', '61');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('5', '64');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('9', '100');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('27', '90');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('99', '69');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('72', '46');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('36', '53');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('18', '53');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('62', '89');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('89', '27');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('64', '38');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('1', '54');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('9', '83');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('1', '56');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('56', '26');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('90', '48');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('28', '33');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('92', '70');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('65', '25');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('100', '67');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('40', '76');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('94', '44');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('74', '43');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('53', '70');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('38', '71');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('11', '63');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('1', '38');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('11', '8');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('38', '97');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('52', '58');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('52', '66');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('82', '93');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('95', '5');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('66', '55');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('9', '67');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('86', '12');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('43', '12');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('93', '20');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('27', '51');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('67', '9');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('96', '69');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('24', '64');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('66', '12');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('30', '31');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('64', '18');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('72', '76');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('1', '79');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('97', '69');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('67', '23');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('98', '45');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('24', '8');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('29', '33');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('18', '76');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('91', '58');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('25', '28');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('23', '99');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('35', '41');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('27', '27');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('72', '27');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('2', '5');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('18', '73');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('25', '91');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('24', '37');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('89', '47');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('84', '85');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('45', '19');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('80', '91');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('85', '78');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('69', '41');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('13', '33');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('87', '65');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('22', '7');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('25', '2');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('27', '74');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('25', '90');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('77', '82');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('99', '5');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('67', '93');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('13', '62');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('93', '60');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('54', '57');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('100', '50');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('59', '64');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('49', '46');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('6', '21');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('18', '10');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('54', '81');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('85', '94');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('79', '68');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('25', '99');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('40', '11');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('44', '32');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('9', '86');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('26', '84');
INSERT INTO `$OrderProduct` (`id_order`, `id_product`) VALUES ('42', '2');