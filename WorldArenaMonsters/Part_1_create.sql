#Необходимо создать БД, которая будет хранить информацию о:

#•	Тренерах (их рейтинг, стиль подготовки, уровень опыта).

CREATE TABLE IF NOT EXISTS `/Treners`(
	`id` INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT ,
	`style` ENUM('Master','Magic','Mercenary') NOT NULL ,
	`rating` INTEGER UNSIGNED ,
	`exp` INTEGER UNSIGNED,
	`name` VARCHAR(20)
);

INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Magic', '1', '550', 'Alanna');
INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Mercenary', '2', '62', 'Trystan');
INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Mercenary', '3', '111', 'Kurt');
INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Magic', '4', '657', 'Else');
INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Magic', '5', '106', 'Brooklyn');
INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Mercenary', '6', '391', 'Heber');
INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Mercenary', '7', '734', 'Diana');
INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Mercenary', '8', '182', 'Yasmin');
INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Mercenary', '9', '939', 'Dejah');
INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Mercenary', '10', '682', 'Tessie');
INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Mercenary', '11', '344', 'Magnus');
INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Master', '12', '557', 'Amie');
INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Mercenary', '13', '720', 'Morton');
INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Master', '14', '811', 'Barbara');
INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Mercenary', '15', '28', 'Zella');
INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Magic', '16', '96', 'Toby');
INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Mercenary', '17', '620', 'Arnoldo');
INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Master', '18', '851', 'Caitlyn');
INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Mercenary', '19', '964', 'Everette');
INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Master', '20', '946', 'Adela');
INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Mercenary', '21', '743', 'Lessie');
INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Magic', '22', '977', 'Barton');
INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Master', '23', '700', 'Cristal');
INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Master', '24', '810', 'Bryce');
INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Magic', '25', '630', 'Marjolaine');
INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Master', '26', '778', 'Boyd');
INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Mercenary', '27', '794', 'Anya');
INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Mercenary', '28', '422', 'Annette');
INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Mercenary', '29', '465', 'Caroline');
INSERT INTO `/Treners` (`style`, `rating`, `exp`, `name`) VALUES ('Mercenary', '30', '943', 'Cyrus');

#•	Монстрах (их характеристики, клички, происхождение, тренеры и победы).

CREATE TABLE IF NOT EXISTS `/Monsters`(
	`id` INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT ,
	`nickname` VARCHAR(30) NOT NULL ,
	`hp` INTEGER UNSIGNED NOT NULL ,
	`attack` INTEGER UNSIGNED NOT NULL ,
	`armor` INTEGER UNSIGNED NOT NULL ,
	`origin` ENUM('Smaug','Azazel','Grum','Krak') NOT NULL ,
	`id_trener` INTEGER UNSIGNED NOT NULL ,
	`wins` INTEGER UNSIGNED ,
	
	CONSTRAINT fk_monster_trener
	FOREIGN KEY (`id_trener`)
	REFERENCES `/Treners`(`id`)
);

INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Jannie_Denesik', '118', '86', '69', 'Grum', '26', '0');
INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Alycia.Nienow40', '110', '82', '57', 'Smaug', '22', '0');
INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Jaylen_Klein11', '93', '76', '67', 'Azazel', '13', '0');
INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Kayli28', '87', '85', '66', 'Grum', '14', '0');
INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Meda.Keeling94', '98', '86', '50', 'Azazel', '17', '0');
INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Geo_Beer57', '88', '72', '59', 'Azazel', '24', '0');
INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Murl43', '105', '76', '55', 'Azazel', '26', '0');
INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Gertrude77', '87', '73', '59', 'Krak', '11', '0');
INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Shaina_Vandervort92', '98', '87', '54', 'Krak', '12', '0');
INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Ayla.Erdman29', '113', '73', '64', 'Grum', '8', '0');
INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Michael95', '118', '73', '67', 'Azazel', '10', '0');
INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Stefan_Breitenberg83', '100', '88', '69', 'Smaug', '25', '0');
INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Cletus.Hammes24', '82', '82', '67', 'Grum', '16', '0');
INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Hazel5', '104', '74', '50', 'Azazel', '1', '0');
INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Ron.Breitenberg', '97', '88', '50', 'Grum', '6', '0');
INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Dylan_Runolfsson16', '87', '75', '52', 'Grum', '7', '0');
INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Elmo.Terry', '115', '87', '57', 'Azazel', '3', '0');
INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Dustin.Bergnaum36', '94', '86', '61', 'Grum', '11', '0');
INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Melany.Mraz19', '88', '79', '67', 'Smaug', '25', '0');
INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Brian.Farrell', '96', '88', '55', 'Smaug', '28', '0');
INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Donnell_Purdy', '114', '71', '57', 'Grum', '29', '0');
INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Celestine_Schaefer', '93', '80', '67', 'Grum', '3', '0');
INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Esta31', '93', '81', '62', 'Krak', '13', '0');
INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Ignacio.Rogahn', '113', '84', '50', 'Grum', '9', '0');
INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Werner_Reichel', '102', '81', '57', 'Grum', '17', '0');
INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Jonas_Cummerata', '105', '87', '63', 'Smaug', '25', '0');
INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Mylene.Bins', '107', '85', '60', 'Krak', '17', '0');
INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Royal_Bartell', '102', '88', '61', 'Azazel', '22', '0');
INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Katlynn.Corwin', '116', '84', '57', 'Krak', '14', '0');
INSERT INTO `/Monsters` (`nickname`, `hp`, `attack`, `armor`, `origin`, `id_trener`, `wins`) VALUES ('Deondre_Mraz63', '118', '86', '51', 'Grum', '22', '0');

#•	Турнирах (призовой фонд, участники, результаты, дата начала и конца).

CREATE TABLE if NOT EXISTS `/Tournaments`(
	`id` INTEGER UNSIGNED Primary KEY AUTO_INCREMENT ,
	`prize_pool` INTEGER UNSIGNED NOT NULL ,
	`winer` INTEGER UNSIGNED NOT NULL, 
	`start` DATE NOT NULL , 
	`final` DATE NOT NULL,
	
	CONSTRAINT fk_winer_monster
	FOREIGN KEY (`winer`)
	REFERENCES `/Monsters`(`id`)
);

INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('18551', '6', '2024-10-20', '2025-04-29');
INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('38055', '28', '2024-08-16', '2025-11-27');
INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('18066', '8', '2025-01-08', '2025-10-05');
INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('7429', '21', '2024-08-20', '2025-09-23');
INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('80092', '16', '2024-02-12', '2025-04-24');
INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('52436', '16', '2024-12-21', '2025-10-28');
INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('70811', '23', '2024-10-01', '2025-01-26');
INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('92590', '21', '2024-12-08', '2025-02-22');
INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('58143', '23', '2025-03-26', '2025-08-20');
INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('75467', '3', '2024-09-08', '2025-10-14');
INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('23739', '12', '2024-06-10', '2025-09-09');
INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('59927', '1', '2024-05-21', '2025-07-20');
INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('30018', '24', '2024-04-21', '2025-08-18');
INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('33901', '3', '2024-12-05', '2026-01-21');
INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('24799', '11', '2024-12-25', '2025-03-08');
INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('75733', '20', '2025-03-26', '2025-09-10');
INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('91707', '9', '2024-10-26', '2025-08-28');
INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('35486', '14', '2024-04-20', '2025-08-08');
INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('55802', '2', '2024-11-23', '2025-05-05');
INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('87178', '19', '2024-08-30', '2025-03-19');
INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('13716', '5', '2024-10-17', '2025-10-14');
INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('44807', '3', '2025-01-19', '2025-05-09');
INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('35067', '17', '2024-06-26', '2025-12-28');
INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('42754', '15', '2024-06-18', '2025-08-02');
INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('4822', '6', '2024-03-05', '2025-04-27');
INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('53787', '17', '2024-06-30', '2025-09-14');
INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('84796', '5', '2024-12-22', '2025-08-25');
INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('95109', '18', '2025-03-26', '2026-01-23');
INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('27756', '10', '2024-03-21', '2025-04-19');
INSERT INTO `/Tournaments` (`prize_pool`, `winer`, `start`, `final`) VALUES ('20010', '9', '2024-03-15', '2026-01-10');