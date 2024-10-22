create view v_generated_dates as 
SELECT generate_series('2022-01-01'::date, '2022-01-31'::date, '1 day'::interval) AS generated_date;