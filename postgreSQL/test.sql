 psql user=tony
Password for user tony: 
psql (12.2)
WARNING: Console code page (437) differs from Windows code page (1252)
         8-bit characters might not work correctly. See psql reference
         page "Notes for Windows users" for details.
Type "help" for help.

tony=# select * from flights;
 id |  origin  | destination | duration                                                                                                                                          
----+----------+-------------+----------
  1 | New York | London      |      415
  2 | Shanghai | Paris       |      760
  3 | Istanbul | Tokyo       |      700
  4 | New York | Paris       |      435
  5 | Moscow   | Paris       |      245
  6 | Lima     | New York    |      455
(6 rows)


tony=# select avg(duration) from flights;
         avg
----------------------
 501.6666666666666667
(1 row)


tony=# select origin,count(*) from flights group by origin;
  origin  | count
----------+-------
 Shanghai |     1
 Moscow   |     1
 Istanbul |     1
 New York |     2
 Lima     |     1
(5 rows)

tony=# select destination,count(*) from flights group by destination;
 destination | count 
-------------+-------
 Paris       |     3
 New York    |     1
 Tokyo       |     1
 London      |     1
(4 rows)


 update flights
 set duration = 430
 where origin = 'New York'
and destination = 'London';
UPDATE 1
 create table passengers(
 id serial primary key,
 name varchar not null,
 flight_id INTEGER REFERENCES flights);
CREATE TABLE
tony=# insert into passengers(name,flight_id) values ('Alice',1);
INSERT 0 1
tony=# insert into passengers(name,flight_id) values ('ABob',1);
INSERT 0 1
tony=# update passengers
tony-# set name = 'Bob'
tony-# where name = 'ABob' AND flights_id = 1;.
tony=# update passengers
tony-# set name = 'Bob'
tony-# where name = 'ABob' AND flight_id = 1;
UPDATE 1
tony=# select * from passengers;
 id | name  | flight_id
----+-------+-----------
  1 | Alice |         1
  2 | Bob   |         1
(2 rows)


tony=# insert into passengers(name,flight_id) values ('Charlie',2);
INSERT 0 1
tony=# insert into passengers(name,flight_id) values ('Dave',2);
INSERT 0 1
tony=# insert into passengers(name,flight_id) values ('Erin',4);
INSERT 0 1
tony=# insert into passengers(name,flight_id) values ('Frank',6);
INSERT 0 1
tony=# insert into passengers(name,flight_id) values ('Grace',6);
INSERT 0 1
tony=# select origin ,destination, name from flights join passengers on
tony-# passengers.flight_id=flights.id;
  origin  | destination |  name
----------+-------------+---------
 New York | London      | Alice
 New York | London      | Bob
 Shanghai | Paris       | Charlie
 Shanghai | Paris       | Dave
 New York | Paris       | Erin
 Lima     | New York    | Frank
 Lima     | New York    | Grace
(7 rows)


tony=# select origin ,destination, name from flights left join passengers on passengers.flight_id = flights.id;
  origin  | destination |  name
----------+-------------+---------
 New York | London      | Alice
 New York | London      | Bob
 Shanghai | Paris       | Charlie
 Shanghai | Paris       | Dave
 New York | Paris       | Erin
 Lima     | New York    | Frank
 Lima     | New York    | Grace
 Moscow   | Paris       |
 Istanbul | Tokyo       |
(9 rows)


tony=# select origin ,destination, name from flights right join passengers on passengers.flight_id = flights.id;
  origin  | destination |  name
----------+-------------+---------
 New York | London      | Alice
 New York | London      | Bob
 Shanghai | Paris       | Charlie
 Shanghai | Paris       | Dave
 New York | Paris       | Erin
 Lima     | New York    | Frank
 Lima     | New York    | Grace
(7 rows)


tony=# select origin ,destination, name from flights inner join passengers on passengers.flight_id = flights.id;
  origin  | destination |  name
----------+-------------+---------
 New York | London      | Alice
 New York | London      | Bob
 Shanghai | Paris       | Charlie
 Shanghai | Paris       | Dave
 New York | Paris       | Erin
 Lima     | New York    | Frank
 Lima     | New York    | Grace
(7 rows)


tony=# select origin ,destination, name from flights outer join passengers on passengers.flight_id = flights.id;
ERROR:  syntax error at or near "outer"
LINE 1: select origin ,destination, name from flights outer join pas...
                                                      ^
tony=# select origin ,destination, name from flights left join passengers on passengers.flight_id = flights.id;
  origin  | destination |  name
----------+-------------+---------
 New York | London      | Alice
 New York | London      | Bob
 Shanghai | Paris       | Charlie
 Shanghai | Paris       | Dave
 New York | Paris       | Erin
 Lima     | New York    | Frank
 Lima     | New York    | Grace
 Moscow   | Paris       |
 Istanbul | Tokyo       |
(9 rows)


tony=# select # from flights where id in (select flight_id from passengers group by flight_id having count(*)>1);
ERROR:  syntax error at or near "from"
LINE 1: select # from flights where id in (select flight_id from pas...
                 ^
tony=# select * from flights where id in (select flight_id from passengers group by flight_id having count(*)>1);
 id |  origin  | destination | duration
----+----------+-------------+----------
  2 | Shanghai | Paris       |      760
  6 | Lima     | New York    |      455
  1 | New York | London      |      430
(3 rows)

