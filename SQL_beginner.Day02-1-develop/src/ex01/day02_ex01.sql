WITH AllDates AS (
  SELECT generate_series('2022-01-01'::date, '2022-01-10'::date, '1 day')::date AS visit_date
),
VisitedDates AS (
  SELECT visit_date
  FROM person_visits
  WHERE person_id = 1
    OR person_id = 2
)
SELECT ad.visit_date as missing_date
FROM AllDates ad
  LEFT JOIN VisitedDates vd ON ad.visit_date = vd.visit_date
WHERE vd.visit_date IS NULL
ORDER BY 1;