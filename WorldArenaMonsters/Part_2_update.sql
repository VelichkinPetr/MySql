##1.	Всем монстрам, занявшим 1-е место в турнирах, увеличить количество побед на 1
UPDATE `/Monsters` monster
INNER JOIN(
				SELECT  mon.id,COUNT(*)AS count FROM  `/Tournaments` tour
							INNER JOIN `/Monsters` mon
							ON mon.id = tour.winer
							GROUP BY  mon.id) AS count_wins
ON monster.id = count_wins.id
SET monster.wins = count_wins.count;

##2.	Добавить новую таблицу Arena, связать её с Турнирами (каждый турнир может происходить только на одной арене)
CREATE TABLE IF NOT EXISTS `/Arena`(
	`id` INTEGER UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	`type` ENUM('Colosseum of Shadows','Sandbox')
);

#Заполняем таблицу
INSERT INTO `/Arena` (`type`) VALUE('Colosseum of Shadows'),('Sandbox');

#Создаем столбец ссылок на арены
ALTER TABLE `/Tournaments`
ADD COLUMN id_arena INTEGER UNSIGNED NOT NULL;


##3.	Для всех турниров с призовым фондом выше среднего установить арену “Колизей Теней”, для турниров с фондом ниже среднего - “Песочница”
UPDATE `/Tournaments` t
SET t.id_arena = 2
WHERE t.prize_pool < (SELECT * FROM (SELECT AVG(prize_pool) FROM `/Tournaments`) AS t1);

UPDATE `/Tournaments` t
SET t.id_arena = 1
WHERE t.prize_pool > (SELECT * FROM (SELECT AVG(prize_pool) FROM `/Tournaments`) AS t1);

#Внешний ключ на Арены(можно установить только при заполненном столбце
ALTER TABLE `/Tournaments` 
ADD FOREIGN KEY (`id_arena`)
	REFERENCES `/Arena`(`id`);
	
#4.	Добавить индекс для обеспечения быстрого поиска по кличке монстра
CREATE INDEX `nick_monster` 
ON `/Monsters` (`nickname`)