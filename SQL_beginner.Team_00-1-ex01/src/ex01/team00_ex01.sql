WITH RECURSIVE all_roads AS (
    SELECT
        point1 as tour,
        point1,
        point2,
        cost,
        cost as sum
    FROM
        nodes_name
    WHERE
        point1 = 'a'
    UNION ALL
    SELECT
        parent.tour|| ',' || parent.point2 as tour,
        child.point1,
        child.point2,
        child.cost,
        parent.sum + child.cost AS sum
    FROM
        nodes_name as child
    INNER JOIN all_roads as parent ON child.point1 = parent.point2
    WHERE tour NOT LIKE '%' || parent.point2 || '%'
)

SELECT sum as total_cost,
       '{' || tour || ',' || point2 || '}' as tour
FROM all_roads
WHERE point2 = 'a' AND
	  tour ~ 'a' AND
	  tour ~ 'b' AND
	  tour ~ 'c' AND
	  tour ~ 'd' AND
	  point2 = 'a'
ORDER BY 1,2;