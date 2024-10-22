SELECT distinct
    name,
    lastname,
    type,
    sum(money) as volume,
    currency_name,
    last_rate_to_usd,
    (sum(money) * last_rate_to_usd) as total_volume_in_usd
FROM (
		SELECT DISTINCT
			COALESCE(u.name, 'not defined')		AS name,
			COALESCE(u.lastname, 'not defined')	AS lastname,
			b.type,
			b.money,
			COALESCE(c.name, 'not defined')		AS currency_name,
			COALESCE(last_value(c.rate_to_usd) over(partition by c.id), 1)	AS last_rate_to_usd
		FROM "user" u
			FULL JOIN balance b ON b.user_id = u.id
			FULL JOIN currency c ON b.currency_id = c.id
		) t1
GROUP BY name, lastname, type, currency_name, last_rate_to_usd
ORDER BY name desc, lastname, type;