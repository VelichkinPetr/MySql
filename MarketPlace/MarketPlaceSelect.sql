# 1. Получить список всех покупателей, которые сделали ровно один заказ

SELECT `$Buyer`.`id`, `$Buyer`.`first_name`,COUNT(*) AS `orders` 
FROM `$Buyer`

INNER JOIN `$Order`
ON `$Buyer`.id = `$Order`.id_buyer

GROUP BY `$Buyer`.id
HAVING COUNT(*) = 1;

# 2. Вывести топ 3 покупателей, которые сделали больше всего заказов

SELECT `$Buyer`.`id`, `$Buyer`.`first_name`,COUNT(*) AS `orders` 
FROM `$Buyer`

INNER JOIN `$Order`
ON `$Buyer`.id = `$Order`.id_buyer

GROUP BY `$Buyer`.id

ORDER BY COUNT(*) DESC
LIMIT 3;

# 3. Вывести 5 самых популярных товаров

SELECT `$Product`.category, COUNT(*) AS `products` 
FROM `$Order`

INNER JOIN `$OrderProduct`
ON `$Order`.id = `$OrderProduct`.id_order

INNER JOIN `$Product`
ON `$OrderProduct`.id_product = `$Product`.id

GROUP BY `$OrderProduct`.id_order

ORDER BY COUNT(*) DESC
LIMIT 5;

# 4. Получить 3 последних оформленных заказа с указанием их общей стоимости

SELECT `$Order`.id,`$Order`.`date`, SUM(`$Product`.price_per_unit) AS `summa` 
FROM `$Order`

INNER JOIN `$OrderProduct`
ON `$Order`.id = `$OrderProduct`.id_order

INNER JOIN `$Product`
ON `$OrderProduct`.id_product = `$Product`.id

GROUP BY `$OrderProduct`.id_order

ORDER BY `$Order`.`date` DESC
LIMIT 3;


# 5. Вывести название самого дорогого товара в каждом заказе

SELECT `$Order`.id,`$Product`.category, MAX(`$Product`.price_per_unit) AS `max_price` 
FROM `$Order`

INNER JOIN `$OrderProduct`
ON `$Order`.id = `$OrderProduct`.id_order

INNER JOIN `$Product`
ON `$OrderProduct`.id_product = `$Product`.id

GROUP BY `$OrderProduct`.id_order

ORDER BY `$Order`.id;

# 6. Посчитать среднюю стоимость заказа для каждого покупателя

SELECT `id`, `first_name`, `avg_price` 
FROM `$Buyer`

INNER JOIN (SELECT `$Order`.id_buyer, AVG(`$Product`.price_per_unit) AS `avg_price` 
				FROM `$Order`
				INNER JOIN `$OrderProduct`
				ON `$Order`.id = `$OrderProduct`.id_order
				INNER JOIN `$Product`
				ON `$OrderProduct`.id_product = `$Product`.id
				GROUP BY `$OrderProduct`.id_order
				) AS `avg`

ON `$Buyer`.id = `avg`.`id_buyer`;

# 7. Найти покупателей, которые сделали заказы на сумму 
#   выше средней суммы заказа по всем клиентам

SELECT `id`, `first_name`, `sum_price` 
FROM `$Buyer`

INNER JOIN (SELECT `$Order`.id_buyer, SUM(`$Product`.price_per_unit) AS `sum_price` 
				FROM `$Order`
				
				INNER JOIN `$OrderProduct`
				ON `$Order`.id = `$OrderProduct`.id_order
				
				INNER JOIN `$Product`
				ON `$OrderProduct`.id_product = `$Product`.id
				
				GROUP BY `$OrderProduct`.id_order
				) AS `sum`

ON `$Buyer`.id = `sum`.`id_buyer`

WHERE `sum_price` > (SELECT AVG(`avg_price`) 
							FROM (
									SELECT `$Order`.id_buyer, AVG(`$Product`.price_per_unit) AS `avg_price` FROM `$Order`
									
									INNER JOIN `$OrderProduct`
									ON `$Order`.id = `$OrderProduct`.id_order
									
									INNER JOIN `$Product`
									ON `$OrderProduct`.id_product = `$Product`.id
									
									GROUP BY `$OrderProduct`.id_order) AS `avg`
									);

# 8. Вывести количество заказов, сделанных в каждый день

SELECT `date`, COUNT(*) AS count_order 
FROM `$Order`

GROUP BY `date`;

# 9. Определить, какие товары ещё ни разу не заказывались

SELECT `id`,`category` 
FROM `$Product`

LEFT JOIN `$OrderProduct`
ON `$Product`.id = `$OrderProduct`.id_product

WHERE `$OrderProduct`.id_product IS NULL;


# 10. Вывести список покупателей, у которых сумма всех заказов больше, 
#      чем у любого другого покупателя

SELECT `id`, `first_name`, `sum_price` 
FROM `$Buyer`

INNER JOIN (SELECT `$Order`.id_buyer, SUM(`$Product`.price_per_unit) AS `sum_price` 
				FROM `$Order`
				
				INNER JOIN `$OrderProduct`
				ON `$Order`.id = `$OrderProduct`.id_order
				
				INNER JOIN `$Product`
				ON `$OrderProduct`.id_product = `$Product`.id
				
				GROUP BY `$OrderProduct`.id_order
				) AS `sum`

ON `$Buyer`.id = `sum`.`id_buyer`

ORDER BY `sum`.`sum_price` DESC 
LIMIT 5;
