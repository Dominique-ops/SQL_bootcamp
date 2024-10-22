CREATE TABLE nodes_name (
point1 varchar,
point2 varchar,
cost bigint
);

insert into nodes_name (point1, point2, cost)
values ('a', 'b', 10),
('b', 'a', 10),
('a', 'c', 15),
('c', 'a', 15),
('c', 'b', 35),
('b', 'c', 35),
('a', 'd', 20),
('d', 'a', 20),
('c', 'd', 30),
('d', 'c', 30),
('d', 'b', 25),
('b', 'd', 25); 