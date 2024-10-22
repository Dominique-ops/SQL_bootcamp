WITH GenderVisitCounts AS (
    SELECT
        pz.name AS pizzeria_name,
        ps.gender,
        COUNT(pv.id) AS visit_count
    FROM
        person_visits pv
        JOIN person ps ON pv.person_id = ps.id
        JOIN pizzeria pz ON pv.pizzeria_id = pz.id
    GROUP BY
        pz.name,
        ps.gender
)
SELECT
    gv1.pizzeria_name
FROM
    GenderVisitCounts gv1
    LEFT JOIN GenderVisitCounts gv2
        ON gv1.pizzeria_name = gv2.pizzeria_name
        AND gv1.gender != gv2.gender
WHERE
    gv1.visit_count > COALESCE(gv2.visit_count, 0)
ORDER BY
    gv1.pizzeria_name;
