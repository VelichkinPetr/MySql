##1.	Получить список всех монстров с их тренерами и количеством побед
SELECT monster.nickname, trener.`name`, monster.wins 
FROM `/Monsters` monster
INNER JOIN `/Treners` trener
ON trener.id = monster.id_trener;

##2.	Вывести победителей турниров
SELECT monster.nickname
FROM `/Monsters` monster
INNER JOIN `/Tournaments` tour
ON tour.winer = monster.id;

##3.	Получить список всех турниров с аренами и статус - прошёл турнир, в процессе или планируется в будущем
ALTER TABLE `/Tournaments`
ADD COLUMN `status` VARCHAR(20);

UPDATE `/Tournaments` t
SET t.`status` = 'планируется'
WHERE t.`start` > CURDATE();

UPDATE `/Tournaments` t
SET t.`status` = 'в процессе'
WHERE CURDATE() BETWEEN t.`start` AND t.final;

UPDATE `/Tournaments` t
SET t.`status` = 'прошёл'
WHERE t.`final` < CURDATE();

SELECT tour.id, arena.`type`, tour.`status`
FROM `/Tournaments` tour
INNER JOIN `/Arena` arena
ON arena.id = tour.id_arena;

##4.	Вывести средний призовой фонд турниров
SELECT AVG(prize_pool) AS avg_prize FROM `/Tournaments` ;

##5.	Вывести всех монстров, у которых количество побед выше среднего
SELECT * FROM `/Monsters`
WHERE wins > (SELECT AVG(wins) FROM `/Monsters`);

##6.	Получить всех тренеров и количество их монстров
SELECT tren.`name`, IFNULL(trener.count,0) AS count
FROM (SELECT tren.id, COUNT(*) AS count FROM `/Monsters` mon
		LEFT JOIN  `/Treners` tren
		ON tren.id = mon.id_trener
		GROUP BY tren.id) AS trener
right JOIN `/Treners` tren
ON tren.id = trener.id;

##7.	Получить общий призовой фонд для каждой арены
SELECT ar.`type`AS arena,SUM(tour.prize_pool) AS prize_fond FROM `/Tournaments` tour
JOIN `/Arena` ar
ON ar.id = tour.id_arena
GROUP BY tour.id_arena;

##8.	Получить количество турниров, проведённых на каждой арене
SELECT ar.`type` AS arena, COUNT(*) AS count FROM `/Tournaments` tour
JOIN `/Arena` ar
ON ar.id = tour.id_arena
GROUP BY tour.id_arena;

##9.	Найти среднее количество побед монстров у каждого тренера
SELECT tren.`name`, IFNULL(trener.avg,0) AS avg
FROM (SELECT tren.id, AVG(mon.wins) AS avg FROM `/Monsters` mon
		RIGHT JOIN  `/Treners` tren
		ON tren.id = mon.id_trener
		GROUP BY tren.id) AS trener
right JOIN `/Treners` tren
ON tren.id = trener.id;

##10.	Получить имена тренеров, чьи монстры выиграли турниры

SELECT tren.`name`
FROM `/Treners` tren

JOIN `/Monsters` mon 
ON mon.id_trener = tren.id

JOIN `/Tournaments` tour
ON tour.winer = mon.id

GROUP BY tren.id;

##11.	Найти тренеров, которые победили более 5 турниров
SELECT tren.`name`, sum(mon.wins) AS wins 
FROM `/Monsters` mon

JOIN  `/Treners` tren
ON tren.id = mon.id_trener

GROUP BY tren.id
HAVING wins > 2