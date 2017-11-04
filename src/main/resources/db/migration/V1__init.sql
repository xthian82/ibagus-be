CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `description` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `document` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) NOT NULL,
  `data` longblob NOT NULL,
  `category_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_category_id` (`category_id`),
  CONSTRAINT `fk_category_id` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `password` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_8sewwnpamngi6b1dwaa88askk` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

CREATE TABLE `user_roles` (
  `user_id` bigint(20) NOT NULL,
  `roles_id` int(11) NOT NULL,
  UNIQUE KEY `UK_amwlmdeik2qdnksxgd566knop` (`roles_id`),
  KEY `FK55itppkw3i07do3h7qoclqd4k` (`user_id`),
  CONSTRAINT `FK55itppkw3i07do3h7qoclqd4k` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FKj9553ass9uctjrmh0gkqsmv0d` FOREIGN KEY (`roles_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `rubro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into `rubro` values (1, 'Trabajo Previo');
insert into `rubro` values (2, 'Estructura Hormigon Armado');
insert into `rubro` values (3, 'Fundacion');
insert into `rubro` values (4, 'Mamposteria');
insert into `rubro` values (5, 'Aislacion');
insert into `rubro` values (6, 'Dintel');
insert into `rubro` values (7, 'Contrapiso');
insert into `rubro` values (8, 'Revoque');
insert into `rubro` values (9, 'Techo');
insert into `rubro` values (10, 'Piso');
insert into `rubro` values (11, 'Cielorraso');
insert into `rubro` values (12, 'Zocalo');
insert into `rubro` values (13, 'Revestido');
insert into `rubro` values (14, 'Desague');
insert into `rubro` values (15, 'Agua Corriente');
insert into `rubro` values (16, 'Colocacion Art. Sanitario');
insert into `rubro` values (17, 'Instalacion Electrica');
insert into `rubro` values (18, 'Carpinteria Madera');
insert into `rubro` values (19, 'Carpinteria Metalica');
insert into `rubro` values (20, 'Pintura');
insert into `rubro` values (21, 'Varios');

CREATE TABLE `subrubro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `nota` varchar(255),
  `rubro_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_rubro` (`rubro_id`),
  CONSTRAINT `fk_rubro` FOREIGN KEY (`rubro_id`) REFERENCES `rubro` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------------
--  --------------- TRABAJOS PREVIOS ----------------------------
insert into `subrubro` values (1, 'Relleno y Compactación', null, 1);
insert into `subrubro` values (2, 'Cartel de Obra', 'De 2,00x1,00 m en chapa Nº 26 y caño 20x20 a retirar y sin colocación', 1);
insert into `subrubro` values (3, 'Vallado de Obra', null, 1);

--  --------------- ESTRUCTURA DE HORMIGO ARMADO ----------------------------
insert into `subrubro` values (4,'Zapata',null,2);
insert into `subrubro` values (5,'Columnas',null,2);
insert into `subrubro` values (6,'Vigas',null,2);
insert into `subrubro` values (7,'Losa',null,2);
insert into `subrubro` values (8,'Encadenado Inferior 13x20 en PB',null,2);
insert into `subrubro` values (9,'Encadenado 13x30 cm',null,2);
insert into `subrubro` values (10,'Encadenado 30x30 cm',null,2);
insert into `subrubro` values (11,'Escalera de HºAº con 15 escalones de 0,30x1,10',null,2);
insert into `subrubro` values (12,'Losa Rap','h=17cm, L=5cm, luces hasta 4m (1:2:3)',2);
insert into `subrubro` values (13,'Losa Listalosa',null,2);

-- --------------- FUNDACION ----------------------------
insert into `subrubro` values (14,'Cimiento PBC con cal (1/2:1:4)',null,3);
insert into `subrubro` values (15,'Cimiento PBC sin cal (1:12)',null,3);
insert into `subrubro` values (16,'Cimiento de Hº de Cascotes - Tierra Gorda',null,3);
insert into `subrubro` values (17,'Cimiento de Hº de Cascotes - Arena Lavada',null,3);
insert into `subrubro` values (18,'Hotmigón Ciclopeo (1:2:6)',null,3);

-- --------------- MAMPOSTERIA ----------------------------
insert into `subrubro` values (19,'De Nivelación','Con ladrillo común y junta de 2cm, de 0,30m de ancho (1:2:8) con cemento Tipo 1',4);
insert into `subrubro` values (20,'De 0,30m armada (1:4) con cemento PZ',null,4);
insert into `subrubro` values (21,'De 0,45m de ancho (1:2:8) con cemento Tipo 1',null,4);
insert into `subrubro` values (22,'De Elevación','Con ladrillo común y junta de 2cm, de 0,15m de ancho (1:2:10) con cemento Tipo 1',4);
insert into `subrubro` values (23,'De 0,20m (1:2:10) con cemento Tipo 1',null,4);
insert into `subrubro` values (24,'De 0,30m (1:2:10) con cemento Tipo 1',null,4);
insert into `subrubro` values (25,'De 0,07m (1:2:10) con cemento Tipo 1 y juntas de 1,5cm',null,4);
insert into `subrubro` values (26,'De Elevación','Con ladrillo ceramicos huecos y junta de 1,5cm, de 0,15m de ancho (1:2:8) con cemento Tipo 1',4);
insert into `subrubro` values (27,'De 0,15m (1:2:8) con cemento Tipo PZ',null,4);
insert into `subrubro` values (28,'De 0,20m (1:2:8) con cemento Tipo 1',null,4);
insert into `subrubro` values (29,'De 0,20m (1:2:8) con cemento Tipo 1',null,4);
insert into `subrubro` values (30,'De Elevación a la Vista','Con ladrillo ceramicos y junta de 1,5cm, de 0,15m de ancho (1:2:8) con cemento Tipo PZ',4);
insert into `subrubro` values (31,'Sardinel de Ladrillos Comunes',null,4);
insert into `subrubro` values (32,'Ladrillo Convocó',null,4);
insert into `subrubro` values (33,'Muro de Piedra Bruta de 30cm (1/2:1:4)',null,4);
insert into `subrubro` values (34,'Pilar de Ladrillo Común 30x30 (1:1:6)',null,4);
insert into `subrubro` values (35,'Muralla de Ladrillo Común','(e=0,15m, h=2,00m, con pilares de 0,30x0,30 cada 2,00m)',4);

-- --------------- AISLACION ----------------------------
insert into `subrubro` values (36,'Horizontal 0,30 con asfalto',null,5);
insert into `subrubro` values (37,'Horizontal 0,15 con asfalto',null,5);
insert into `subrubro` values (38,'Vertical con Panderete 0,15m',null,5);
insert into `subrubro` values (39,'De Losa con Piso de Tejuelita Prensada',null,5);
insert into `subrubro` values (40,'De Losa Para Baño',null,5);

-- --------------- DINTEL ----------------------------
insert into `subrubro` values (41,'De Varilla Sobre Abertura',null,6);
insert into `subrubro` values (42,'De Hormigón Prefabricado',null,6);

-- --------------- CONTRAPISO ----------------------------
insert into `subrubro` values (43,'De 7cm (1/4:1:4:6)',null,7);
insert into `subrubro` values (44,'De 10cm (1/4:1:4:6)',null,7);
insert into `subrubro` values (45,'De 20cm en Losa Sanitaria',null,7);

-- --------------- REVOQUE ----------------------------
insert into `subrubro` values (46,'A 1 Capa, Espesor 1,5cm (1:4:16) con hidrófugo',null,8);
insert into `subrubro` values (47,'Salpicado (1:3)',null,8);
insert into `subrubro` values (48,'Azotada Impermeable (1:3), Espesor 0,5cm',null,8);
insert into `subrubro` values (49,'De Cielorraso (1:4:12)',null,8);

-- --------------- TECHO ----------------------------
insert into `subrubro` values (50,'Teja española sobre Tejuelón con madera de Ybyrapyta',null,9);
insert into `subrubro` values (51,'Teja Esmaltada Española o Colonial Irene sobre Tejuelón',null,9);
insert into `subrubro` values (52,'Teja Española sobre Tejuelita',null,9);
insert into `subrubro` values (53,'Teja Francesa, Marsellesa o Romana sobre Machimbre',null,9);
insert into `subrubro` values (54,'Teja de Cemento Doble Romana King sobre Machimbre',null,9);
insert into `subrubro` values (55,'Chapa Galvanizada Nº28 sobre Estructura de Madera',null,9);
insert into `subrubro` values (56,'Chapa Galvanizada Nº28 sobre Estructura de Varillas Torsionadas',null,9);
insert into `subrubro` values (57,'Chapa de Fibrocemento Ondulada 5mm',null,9);
insert into `subrubro` values (58,'Entrepiso de Madera',null,9);

-- --------------- PISO ----------------------------
insert into `subrubro` values (59,'Baldosa Calcárea',null,10);
insert into `subrubro` values (60,'Mosaico Granítico (base gris 30x30)',null,10);
insert into `subrubro` values (61,'Vereda Cerámica Vainilla',null,10);
insert into `subrubro` values (62,'Cerámica Esmaltada',null,10);
insert into `subrubro` values (63,'Layota 28x28 cm',null,10);
insert into `subrubro` values (64,'Plancha para Revestido de Escalera',null,10);
insert into `subrubro` values (65,'Piedra Losa Rompecabeza',null,10);
insert into `subrubro` values (66,'Alisada de Cemento',null,10);
insert into `subrubro` values (67,'Baldosones de Hormigón',null,10);
insert into `subrubro` values (68,'Alfombra (2mm sin carpeta)',null,10);
insert into `subrubro` values (69,'Carpeta para Piso Ceramico o Alfombra',null,10);
insert into `subrubro` values (70,'Empedrado',null,10);
insert into `subrubro` values (71,'Hormigón Armado 12cm',null,10);

-- --------------- CIELORRASO ----------------------------
insert into `subrubro` values (72,'De Machimbre con Armazón de Madera, no Incluye Corniza',null,11);

-- --------------- ZOCALO ----------------------------
insert into `subrubro` values (73,'Cemento Alisado',null,12);
insert into `subrubro` values (74,'Calcáreo Base Gris',null,12);
insert into `subrubro` values (75,'Madera 3/4x3',null,12);
insert into `subrubro` values (76,'Alfombra',null,12);
insert into `subrubro` values (77,'Cerámica Esmaltada',null,12);
insert into `subrubro` values (78,'Mosaico Granítico (base blanca pulido 10x30cm)',null,12);
insert into `subrubro` values (79,'Layota 28x10 cm',null,12);

-- --------------- REVESTIDO ----------------------------
insert into `subrubro` values (80,'Azulejo 20x30 cm',null,13);
insert into `subrubro` values (81,'Ladrillejo',null,13);
insert into `subrubro` values (82,'Piedra Laja Fina (1 a 2 cm de espesor)',null,13);

-- --------------- DESAGUE ----------------------------
insert into `subrubro` values (83,'Boca Desagüe Abierta 20x20x20cm',null,14);
insert into `subrubro` values (84,'Boca Desagüe Abierta 30x30x30cm',null,14);
insert into `subrubro` values (85,'Boca Desagüe Abierta 40x40x40cm',null,14);
insert into `subrubro` values (86,'Registro 30x30x30cm',null,14);
insert into `subrubro` values (87,'Registro 40x40x40cm',null,14);
insert into `subrubro` values (88,'Registro 60x60x60cm',null,14);
insert into `subrubro` values (89,'Caño PVC 40mm Tigre',null,14);
insert into `subrubro` values (90,'Caño PVC 50mm Tigre',null,14);
insert into `subrubro` values (91,'Caño PVC 100mm Tigre',null,14);
insert into `subrubro` values (92,'Caño Material Vidriado 4',null,14);
insert into `subrubro` values (93,'Caño de Hormigón 50cm','Hormigón roto comprimido - Macho/Hembra',14);
insert into `subrubro` values (94,'Caño de Hormigón 60cm','Hormigón roto comprimido - Macho/Hembra',14);
insert into `subrubro` values (95,'Caño 80cm','H˚A˚ Vibrado simple - Macho/Hembra',14);
insert into `subrubro` values (96,'Pozo Ciego','(Diam=1,50m y h=3,00m)',14);
insert into `subrubro` values (97,'Camara Séptica (1x1.60x1.20m)',null,14);
insert into `subrubro` values (98,'Rejilla de Piso Sifonada',null,14);
insert into `subrubro` values (99,'Desague Cloacal Para Baño de Servicio','Hasta el primer registro',14);
insert into `subrubro` values (100,'Desague Cloacal Para Baño de Completo','Hasta el primer registro',14);
insert into `subrubro` values (101,'Desague Cloacal Para Baño de Social','Hasta el primer registro',14);
insert into `subrubro` values (102,'Desague Para Pileta de Lavar y Lavarropa',null,14);
insert into `subrubro` values (103,'Desague Para Pileta de Cocina',null,14);

-- --------------- AGUA CORRIENTE ----------------------------
insert into `subrubro` values (104,'Caño PVC de 1',null,15);
insert into `subrubro` values (105,'Caño PVC de 3/4',null,15);
insert into `subrubro` values (106,'Caño PVC de 1/2',null,15);
insert into `subrubro` values (107,'Instalación Agua Fria en Baño Completo',null,15);
insert into `subrubro` values (108,'Instalación Agua Caliente y Fria en Baño Completo',null,15);
insert into `subrubro` values (109,'Instalación Agua Fria en Baño Servicio',null,15);
insert into `subrubro` values (110,'Instalación Agua Fria en Baño Social',null,15);
insert into `subrubro` values (111,'Instalación Agua Fria para Pileta de Lavar y Lavarropas',null,15);
insert into `subrubro` values (112,'Instalación Agua Fria para Pileta de Cocina',null,15);
insert into `subrubro` values (113,'Instalación Agua Caliente y Fria p/ Pileta de Cocina',null,15);

-- --------------- COLOCACION ART. SANITARIO ----------------------------
insert into `subrubro` values (114,'Baño Completo -  Frio y Caliente','No incluye bañera',16);
insert into `subrubro` values (115,'Baño Completo con Bañera Común',null,16);
insert into `subrubro` values (116,'Baño Completo con Bañera Hidromasaje',null,16);
insert into `subrubro` values (117,'Baño Completo -  Frio solo',null,16);
insert into `subrubro` values (118,'Baño Completo -  Frio Caliente - Superior',null,16);
insert into `subrubro` values (119,'Baño de Servicio',null,16);
insert into `subrubro` values (120,'Baño Social - Standard',null,16);
insert into `subrubro` values (121,'Baño Social - Superior',null,16);
insert into `subrubro` values (122,'Pileta de Cocina','Acero Inoxidable - Frio solo',16);
insert into `subrubro` values (123,'Pileta de Cocina','Acero Inoxidable - Frio y Caliente',16);
insert into `subrubro` values (124,'Pileta de Lavar y Lavarropas',null,16);
insert into `subrubro` values (125,'Mesada de Granito para Cocina',null,16);
insert into `subrubro` values (126,'Mesada de Mármol para Baño Social (0,70x0,60m)',null,16);
insert into `subrubro` values (127,'Mesada de Mármol para Baño Completo (1,00x0,60m)',null,16);

-- --------------- INSTALACION ELECTRICA ----------------------------
insert into `subrubro` values (128,'Pilar de Mamposteria','(0,45x0,45x1,70m - No inchuye cimiento y nivelación)',17);
insert into `subrubro` values (129,'Registro eléctrico 30x30x70cm',null,17);
insert into `subrubro` values (130,'Registro eléctrico 40x40x70cm',null,17);
insert into `subrubro` values (131,'Puesto de medición Provisorio - Monofásico con limitadora hasta 40 A',null,17);
insert into `subrubro` values (132,'Puesto de medición Provisorio - Trifásico con limitadora hasta 45 A',null,17);
insert into `subrubro` values (133,'Puesto de medición Definitivo - Monofásico con acometida de 3m y limitadora hasta 40 A','con linea subterránea o embutido en mampostería',17);
insert into `subrubro` values (134,'Puesto de medición Definitivo - Trifásico con acometida de 3m y limitadora hasta 45 A',null,17);
insert into `subrubro` values (135,'Linea Subterránea Monofásica con cable de 4 a 10mm',null,17);
insert into `subrubro` values (136,'Linea Subterránea Trifásica con cable de 4 a 10mm',null,17);
insert into `subrubro` values (137,'Linea Embutida en Mamposteria - Monofásica con cable de 4 a 10mm',null,17);
insert into `subrubro` values (138,'Tablero Principal con 6 llaves TM',null,17);
insert into `subrubro` values (139,'Una Lámpara con su Interruptor',null,17);
insert into `subrubro` values (140,'Una Lámpara con 2 Llaves de Combinación',null,17);
insert into `subrubro` values (141,'Un Tomacorriente',null,17);
insert into `subrubro` values (142,'Circuito para Calefón/AA/Ducha Eléctrica',null,17);
insert into `subrubro` values (143,'Linea Embutida para AA sin Cableado',null,17);
insert into `subrubro` values (144,'Línea de Teléfono con su Toma',null,17);
insert into `subrubro` values (145,'Linea de Timbre con su pulsador',null,17);
insert into `subrubro` values (146,'Toma para Antena de TV o Audio',null,17);

-- --------------- CARPINTERIA MADERA ----------------------------
insert into `subrubro` values (147,'Marco Recto de Ybyrapyta de 0,70m de ancho (0,15cm para puerta de 2,10m de alto)',null,18);
insert into `subrubro` values (148,'Marco Recto de Ybyrapyta de 0,80m de ancho (0,15cm para puerta de 2,10m de alto)',null,18);
insert into `subrubro` values (149,'Marco Recto de Ybyrapyta de 1,50m de ancho (0,15cm para puerta de 2,10m de alto)',null,18);
insert into `subrubro` values (150,'Marco Recto de Ybyrapyta de 1,50m de ancho (0,15cm para ventana de 1,20m de alto)',null,18);
insert into `subrubro` values (151,'Marco Recto de Ybyrapyta de 2,00m de ancho (0,15cm para ventana de 1,20m de alto)',null,18);
insert into `subrubro` values (152,'Puerta de 2,10m de alto - Placa de Cedro (0,80x2,10m)',null,18);
insert into `subrubro` values (153,'Puerta de 2,10m de alto - Tablero (0,80x2,10m)',null,18);
insert into `subrubro` values (154,'Puerta de 2,10m de alto - Tablero, Punta Diamante (0,80x2,10m)',null,18);
insert into `subrubro` values (155,'Puerta de 2,10m de alto - Vidriera Sencilla (1,50x2,10m - 3hojas de abrir)',null,18);
insert into `subrubro` values (156,'Puerta de 2,10m de alto - Perciana (1,50x2,10m - 3hojas de abrir)',null,18);
insert into `subrubro` values (157,'Ventana de 1,20m de alto - Vidriera (1,50x1,20m - 3 hojas de abrir)',null,18);
insert into `subrubro` values (158,'Ventana de 1,20m de alto - Vidriera (2,00x1,20m - 4 hojas de abrir)',null,18);
insert into `subrubro` values (159,'Ventana de 1,20m de alto - Perciana (1,50x1,20m - 3 hojas de abrir)',null,18);
insert into `subrubro` values (160,'Ventana de 1,20m de alto - Persiana (2,00x1,20m - 4 hojas de abrir)',null,18);
insert into `subrubro` values (161,'Colocación de Contramarco',null,18);

-- --------------- CARPINTERIA METALICA ----------------------------
insert into `subrubro` values (162,'Balancín hasta 1 m2',null,19);
insert into `subrubro` values (163,'Puerta Metálica Tipo Reja (0,80x2,10m)',null,19);
insert into `subrubro` values (164,'Cortina Metálica (2,40x2,60m)',null,19);
insert into `subrubro` values (165,'Reja de Hierro Artística Sencila (1,5x1,20m)',null,19);
insert into `subrubro` values (166,'Baranda Metálica de Escalera',null,19);
insert into `subrubro` values (167,'Portón Metálico (1,00x1,50m)',null,19);
insert into `subrubro` values (168,'Portón Cochera (3,00x2,00m)',null,19);
insert into `subrubro` values (169,'Escalera Metálica Recta',null,19);

-- --------------- PINTURA ----------------------------
insert into `subrubro` values (170,'Pintura de Pared a la Cal',null,20);
insert into `subrubro` values (171,'Pintura de Cielorraso a la Cal',null,20);
insert into `subrubro` values (172,'Al Látex Interior con Enduido',null,20);
insert into `subrubro` values (173,'Al Látex Exterior con Enduido',null,20);
insert into `subrubro` values (174,'Enduido',null,20);
insert into `subrubro` values (175,'Tejuela o Tejuelón al Barniz',null,20);
insert into `subrubro` values (176,'Tejuela a la Cal y Maderamen con Esmalte Sintético',null,20);
insert into `subrubro` values (177,'Barnizado de Machimbre',null,20);
insert into `subrubro` values (178,'Abertura de Madera con Esmalte',null,20);
insert into `subrubro` values (179,'Abertura de Madera con Barniz',null,20);
insert into `subrubro` values (180,'Abertura de Metálica con Esmalte',null,20);
insert into `subrubro` values (181,'Canaleta y Bajada con Esmalte Sintético',null,20);
insert into `subrubro` values (182,'Tratamiento de Ladrillo Visto',null,20);

-- --------------- PINTURA ----------------------------

insert into `subrubro` values (183,'Moldura Doble',null,21);
insert into `subrubro` values (184,'Moldura Sencilla',null,21);
insert into `subrubro` values (185,'Estufa (Boca de 1,00m)',null,21);
insert into `subrubro` values (186,'Parrilla (Boca de 1,00m)',null,21);
insert into `subrubro` values (187,'Balaustre Sencillo',null,21);
insert into `subrubro` values (188,'Tanque de Agua en Fibra de Vidrio 1000L',null,21);
insert into `subrubro` values (189,'Tanque de Agua en Fibra de Vidrio 500L',null,21);

CREATE TABLE `medida` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into `medida` values (1, 'l');
insert into `medida` values (2, 'ml');
insert into `medida` values (3, 'kg');
insert into `medida` values (4, 'm2');
insert into `medida` values (5, 'm3');
insert into `medida` values (6, 'un');
insert into `medida` values (7, 'pie');
insert into `medida` values (8, 'par');
insert into `medida` values (9, 'juego');
insert into `medida` values (10, 'c/hoja');
insert into `medida` values (11, 'tn');
insert into `medida` values (12, 'pulg/m');

CREATE TABLE `material` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descripcion` varchar(255) NOT NULL,
  `medida_id` int(11) NOT NULL,
  `precio` decimal(18) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_medida` (`medida_id`),
  CONSTRAINT `fk_medida` FOREIGN KEY (`medida_id`) REFERENCES `medida` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

insert into `material` values (1,'Abrazadera p/ jabalina Intelli',6,4620);
insert into `material` values (2,'Aceite de linaza',6,10000);
insert into `material` values (3,'Acido muriático',1,6600);
insert into `material` values (4,'Adeshivo 75cc',6,7975);
insert into `material` values (5,'Aguarrás',6,7800);
