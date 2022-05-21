
CREATE TABLE Sensores (
	id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	idRegiao int NOT NULL FOREIGN KEY REFERENCES Regiao(id)
);

CREATE TABLE Registros (
	id int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	idSensor int NOT NULL FOREIGN KEY REFERENCES Sensores(id),
	Nivel int NOT NULL,
	DataHora datetime NOT NULL
);

INSERT INTO Sensores(idRegiao)VALUES(1)
INSERT INTO Sensores(idRegiao)VALUES(2)
INSERT INTO Sensores(idRegiao)VALUES(3)
INSERT INTO Sensores(idRegiao)VALUES(4)
INSERT INTO Sensores(idRegiao)VALUES(5)
INSERT INTO Sensores(idRegiao)VALUES(6)
INSERT INTO Sensores(idRegiao)VALUES(7)
INSERT INTO Sensores(idRegiao)VALUES(8)
INSERT INTO Sensores(idRegiao)VALUES(9)
INSERT INTO Sensores(idRegiao)VALUES(10)
INSERT INTO Sensores(idRegiao)VALUES(11)
INSERT INTO Sensores(idRegiao)VALUES(12)
INSERT INTO Sensores(idRegiao)VALUES(13)
INSERT INTO Sensores(idRegiao)VALUES(14)
INSERT INTO Sensores(idRegiao)VALUES(15)
INSERT INTO Sensores(idRegiao)VALUES(16)
INSERT INTO Sensores(idRegiao)VALUES(17)
INSERT INTO Sensores(idRegiao)VALUES(18)
INSERT INTO Sensores(idRegiao)VALUES(19)
INSERT INTO Sensores(idRegiao)VALUES(20)

set dateformat ymd
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (1,25,'2021-05-26 14:25:30.123');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (2,40,'2021-05-26 14:30:40.253');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (3,25,'2021-05-26 14:50:30.139');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (4,40,'2021-05-26 14:25:30.123');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (5,25,'2021-05-29 10:10:30.123');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (6,40,'2021-05-29 10:25:50.134');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (7,55,'2021-05-29 10:30:50.135');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (8,55,'2021-05-31 18:40:50.135');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (9,40,'2021-05-31 18:40:50.135');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (10,25,'2021-05-31 19:45:52.235');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (11,25,'2021-05-31 20:00:00.135');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (12,40,'2021-06-05 12:05:10.156');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (13,40,'2021-06-05 12:30:06.145');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (14,55,'2021-06-05 15:09:05.157');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (15,25,'2021-06-09 19:00:07.141');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (16,40,'2021-06-09 19:45:10.412');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (17,25,'2021-06-15 09:15:10.156');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (18,55,'2021-06-15 08:25:25.654');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (19,55,'2021-06-15 19:55:25.543');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (20,40,'2021-06-15 20:25:25.138');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (1,40,'2021-07-02 23:25:30.123');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (2,25,'2021-07-02 22:58:40.258');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (3,55,'2021-07-05 21:30:28.198');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (4,25,'2021-07-05 21:00:30.123');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (5,55,'2021-07-15 05:14:26.154');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (6,40,'2021-07-16 07:23:59.134');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (7,40,'2021-07-26 04:28:50.135');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (8,55,'2021-08-03 02:50:40.368');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (9,25,'2021-08-09 00:20:00.135');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (10,40,'2021-08-15 11:48:59.158');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (11,25,'2021-08-21 06:08:00.138');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (12,25,'2021-08-21 07:15:18.136');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (13,55,'2021-08-30 15:10:04.521');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (14,40,'2021-09-05 12:56:04.978');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (15,25,'2021-09-09 17:10:45.111');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (16,25,'2021-09-11 10:00:15.425');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (17,40,'2021-09-22 18:30:15.164');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (18,55,'2021-09-23 16:20:20.644');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (19,55,'2021-09-26 14:45:25.431');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (20,55,'2021-09-29 17:56:28.138');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (1,25,'2021-10-02 05:36:38.139');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (2,40,'2021-10-04 11:28:00.580');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (3,40,'2021-10-04 12:00:08.108');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (4,55,'2021-10-08 16:05:00.133');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (5,25,'2021-10-15 09:25:20.143');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (6,55,'2021-10-20 17:20:54.141');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (7,25,'2021-10-29 22:00:45.139');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (8,40,'2021-11-03 21:40:30.368');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (9,40,'2021-11-03 22:00:00.135');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (10,55,'2021-11-12 19:02:50.158');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (11,40,'2021-11-15 09:00:00.008');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (12,40,'2021-11-18 17:00:25.131');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (13,25,'2021-11-25 00:10:04.511');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (14,25,'2021-11-25 04:18:14.178');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (15,55,'2021-12-07 07:15:35.114');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (16,40,'2021-12-11 15:10:17.245');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (17,55,'2021-12-11 22:06:14.146');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (18,25,'2021-12-22 18:00:00.604');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (19,40,'2021-12-28 13:25:45.313');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (20,25,'2021-12-29 10:41:38.188');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (1,55,'2021-12-29 11:26:04.191');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (2,25,'2021-12-29 11:45:00.012');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (3,55,'2021-12-29 19:04:28.018');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (4,40,'2022-01-03 06:30:20.131');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (5,40,'2022-01-03 10:35:21.431');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (6,25,'2022-01-03 14:25:51.151');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (7,40,'2022-01-06 07:09:25.191');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (8,25,'2022-01-06 21:20:26.238');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (9,55,'2022-01-12 17:16:25.151');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (10,25,'2022-01-17 08:25:30.181');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (11,55,'2022-01-17 16:40:00.081');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (12,25,'2022-01-18 04:02:21.111');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (13,40,'2022-01-18 09:18:24.519');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (14,55,'2022-01-18 11:20:24.781');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (15,25,'2022-01-18 16:35:35.144');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (16,25,'2022-01-21 00:30:18.455');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (17,40,'2022-01-21 05:30:16.148');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (18,55,'2022-01-21 06:09:40.414');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (19,25,'2022-01-21 17:14:54.338');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (20,40,'2022-01-29 00:00:00.188');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (1,55,'2022-01-29 14:34:12.193');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (2,40,'2022-02-04 06:45:00.012');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (3,25,'2022-02-04 08:04:28.118');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (4,25,'2022-02-04 08:30:25.133');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (5,25,'2022-02-04 14:30:31.834');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (6,40,'2022-02-04 14:45:41.351');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (7,55,'2022-02-04 21:39:45.919');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (8,25,'2022-02-09 06:10:46.336');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (9,40,'2022-02-09 07:06:51.117');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (10,40,'2022-02-09 14:25:20.781');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (11,55,'2022-02-09 16:00:20.181');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (12,55,'2022-02-09 16:25:14.651');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (13,55,'2022-02-09 17:00:29.119');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (14,25,'2022-02-18 03:10:44.691');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (15,40,'2022-02-18 04:15:45.444');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (16,55,'2022-02-22 05:20:58.454');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (17,25,'2022-02-22 07:16:46.484');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (18,40,'2022-02-28 01:14:50.364');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (19,40,'2022-02-28 16:17:58.938');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (20,25,'2022-02-28 17:00:10.358');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (1,55,'2022-03-01 06:20:22.793');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (2,55,'2022-03-01 06:55:10.012');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (3,40,'2022-03-01 09:10:18.164');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (4,40,'2022-03-01 09:40:15.333');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (5,55,'2022-03-01 17:20:51.134');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (6,25,'2022-03-05 10:00:11.051');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (7,25,'2022-03-05 10:21:00.900');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (8,40,'2022-03-05 10:50:00.000');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (9,25,'2022-03-05 16:00:01.017');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (10,55,'2022-03-11 03:05:10.181');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (11,40,'2022-03-11 04:02:25.145');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (12,40,'2022-03-11 04:10:04.051');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (13,55,'2022-03-11 05:05:23.419');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (14,55,'2022-03-11 05:07:14.291');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (15,25,'2022-03-17 06:45:25.344');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (16,25,'2022-03-17 06:47:08.454');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (17,40,'2022-03-17 08:00:16.684');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (18,55,'2022-03-17 17:00:40.464');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (19,55,'2022-03-17 17:30:41.847');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (20,40,'2022-03-24 04:04:20.358');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (1,25,'2022-03-24 07:00:02.093');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (2,40,'2022-03-24 07:15:00.002');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (3,55,'2022-03-29 06:00:08.064');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (4,40,'2022-03-29 21:00:15.433');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (5,40,'2022-03-29 21:20:11.114');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (6,25,'2022-03-29 23:46:39.151');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (7,40,'2022-03-29 23:58:10.000');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (8,40,'2022-03-30 00:10:10.100');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (9,40,'2022-04-02 08:50:11.317');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (10,40,'2022-04-02 09:00:20.381');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (11,25,'2022-04-02 10:00:00.144');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (12,55,'2022-04-02 16:08:09.041');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (13,25,'2022-04-11 01:00:13.467');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (14,40,'2022-04-11 05:00:00.191');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (15,25,'2022-04-11 05:00:21.024');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (16,40,'2022-04-11 05:27:03.444');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (17,25,'2022-04-11 05:30:10.184');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (18,40,'2022-04-11 06:01:20.064');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (19,25,'2022-04-11 06:10:01.147');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (20,55,'2022-04-11 13:10:36.758');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (1,40,'2022-04-11 14:20:12.193');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (2,55,'2022-04-11 14:35:10.102');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (3,25,'2022-04-11 19:01:18.164');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (4,25,'2022-04-11 21:12:12.443');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (5,55,'2022-04-11 22:10:31.414');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (6,40,'2022-04-11 23:16:00.001');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (7,25,'2022-04-11 23:50:00.000');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (8,25,'2022-04-18 06:11:11.110');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (9,25,'2022-04-18 06:20:31.117');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (10,55,'2022-04-18 07:00:00.081');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (11,55,'2022-04-18 07:09:01.444');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (12,40,'2022-04-18 07:30:10.051');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (13,40,'2022-04-18 07:35:16.567');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (14,25,'2022-04-18 07:40:17.181');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (15,55,'2022-04-18 16:10:11.124');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (16,55,'2022-04-18 16:27:05.144');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (17,55,'2022-04-18 16:38:20.184');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (18,55,'2022-04-18 16:55:58.464');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (19,40,'2022-04-18 17:00:09.447');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (20,40,'2022-04-18 17:10:16.658');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (1,55,'2022-04-24 00:10:22.593');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (2,40,'2022-04-24 00:38:30.102');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (3,40,'2022-04-24 00:45:28.364');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (4,40,'2022-04-24 01:10:02.443');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (5,25,'2022-04-24 06:01:21.614');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (6,25,'2022-04-24 06:24:10.301');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (7,40,'2022-04-24 06:45:00.020');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (8,55,'2022-04-24 07:00:01.010');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (9,25,'2022-05-01 04:10:21.147');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (10,25,'2022-05-01 04:15:01.181');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (11,40,'2022-05-01 05:00:00.044');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (12,40,'2022-05-01 05:12:30.451');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (13,55,'2022-05-01 06:10:14.667');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (14,40,'2022-05-01 06:50:18.181');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (15,25,'2022-05-01 16:00:00.000');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (16,25,'2022-05-01 16:03:01.114');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (17,25,'2022-05-01 16:30:00.384');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (18,40,'2022-05-12 03:25:18.564');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (19,55,'2022-05-12 03:40:00.547');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (20,40,'2022-05-12 03:42:26.558');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (1,40,'2022-05-12 03:50:00.503');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (2,55,'2022-05-12 05:30:31.502');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (3,25,'2022-05-12 08:43:08.464');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (4,25,'2022-05-12 10:00:12.543');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (5,40,'2022-05-12 11:10:23.114');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (6,40,'2022-05-12 16:10:00.581');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (7,55,'2022-05-19 06:10:10.320');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (8,40,'2022-05-19 06:20:11.610');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (9,55,'2022-05-19 06:24:20.247');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (10,55,'2022-05-19 06:27:31.481');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (11,55,'2022-05-19 07:02:10.244');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (12,25,'2022-05-19 11:10:50.751');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (13,25,'2022-05-19 11:13:44.567');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (14,25,'2022-05-19 11:57:55.181');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (15,55,'2022-05-19 16:10:50.030');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (16,55,'2022-05-19 16:30:56.112');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (17,40,'2022-05-19 16:57:01.284');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (18,25,'2022-05-19 23:00:17.164');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (19,25,'2022-05-19 23:40:00.147');
INSERT INTO Registros (idSensor, Nivel, DataHora) VALUES (20,25,'2022-05-19 23:57:16.689');


select * from Registros


