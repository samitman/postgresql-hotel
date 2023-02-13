--- Mock data for hotel DB

\connect hotel;

--- Guests
INSERT INTO guests VALUES(1,'Sam','Itman','sam@samitman.com');
INSERT INTO guests VALUES(2, 'Weylin','Machado','weyl.mac@arvinmeritor.info');
INSERT INTO guests VALUES(3,'Felix','Mattern','feli-mat@diaperstack.com');
INSERT INTO guests VALUES(4,'Bogdan','Lohman','bo.lohma@careful-organics.org');
INSERT INTO guests VALUES(5,'Delcine','Carpio','delcine_carpi@egl-inc.info');
INSERT INTO guests VALUES(6,'Nelson','Carvajal','nel_carva@egl-inc.info');
INSERT INTO guests VALUES(7,'Geary','Chaidez','gea-ch@autozone-inc.info');
INSERT INTO guests VALUES(8,'Fairley','Widner','fair_wid@progressenergyinc.info');
INSERT INTO guests VALUES(9,'Madeline','Peterkin','madeli.pe@arvinmeritor.info');
INSERT INTO guests VALUES(10,'Brittney','Lampert','brit.la@arketmay.com');

--- Rooms
INSERT INTO rooms VALUES(1,'single',100);
INSERT INTO rooms VALUES(2,'single',100);
INSERT INTO rooms VALUES(3,'single',100);
INSERT INTO rooms VALUES(4,'single',100);
INSERT INTO rooms VALUES(5,'single',100);
INSERT INTO rooms VALUES(6,'single',100);
INSERT INTO rooms VALUES(7,'single',100);
INSERT INTO rooms VALUES(8,'single',100);
INSERT INTO rooms VALUES(9,'single',100);
INSERT INTO rooms VALUES(10,'single',100);
INSERT INTO rooms VALUES(11,'double',150);
INSERT INTO rooms VALUES(12,'double',150);
INSERT INTO rooms VALUES(13,'double',150);
INSERT INTO rooms VALUES(14,'double',150);
INSERT INTO rooms VALUES(15,'double',150);
INSERT INTO rooms VALUES(16,'double',150);
INSERT INTO rooms VALUES(17,'double',150);
INSERT INTO rooms VALUES(18,'double',150);
INSERT INTO rooms VALUES(19,'double',150);
INSERT INTO rooms VALUES(20,'double',150);

--- Reservations
INSERT INTO reservations VALUES(1, 1, 1, CURRENT_TIMESTAMP, '2023-02-13', '2023-02-15');
INSERT INTO reservations VALUES(2, 4, 10, CURRENT_TIMESTAMP, '2023-02-15', '2023-02-21');
INSERT INTO reservations VALUES(3, 6, 5, CURRENT_TIMESTAMP, '2023-02-19', '2023-02-22');
INSERT INTO reservations VALUES(4, 3, 6, CURRENT_TIMESTAMP, '2023-03-03', '2023-03-08');
INSERT INTO reservations VALUES(5, 7, 12, CURRENT_TIMESTAMP, '2023-03-08', '2023-03-15');
INSERT INTO reservations VALUES(6, 9, 17, CURRENT_TIMESTAMP, '2023-03-14', '2023-03-19');
INSERT INTO reservations VALUES(7, 10, 11, CURRENT_TIMESTAMP, '2023-03-14', '2023-03-21');
INSERT INTO reservations VALUES(8, 2, 8, CURRENT_TIMESTAMP, '2023-03-18', '2023-03-23');