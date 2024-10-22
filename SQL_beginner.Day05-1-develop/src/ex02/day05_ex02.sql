create index idx_person_name on person (upper(name));

SELECT * FROM person WHERE UPPER(name) = 'DENIS';

SET enable_seqscan TO off;

EXPLAIN ANALYZE
SELECT * FROM person WHERE UPPER(name) = 'DENIS';