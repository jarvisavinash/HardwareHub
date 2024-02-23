use HardwareShop;
show tables;


select * from customers;
select * from customerAddresses;
select * from category;
select * from subCategories;
select * from products;
select * from productInfo;
select * from paymentInfo;
select * from orders;
select * from orderDetails;
select * from counters;



CREATE TABLE `counters`(
	counterId varchar(20),
    nextValue int,
    intitialValue varchar(20),
    PRIMARY KEY (`counterId`)
);

select * from counters;

insert into counters values ('customer', 100, 'CU');
insert into counters values ('customerAddress', 100, 'CA');
insert into counters values ('category', 0, 'CAT');
insert into counters values ('subCategory', 1012, 'SUBCAT');
insert into counters values ('product', 1179, 'PRD');
insert into counters values ('productInfo', 1179, 'PRDIF');
insert into counters values ('order', 100, 'ORD');
insert into counters values ('payment', 0, 'PAY');

select * from counters;


CREATE TABLE `customers` (
	`customerId` varchar(50) NOT NULL,
	`firstName` varchar(50) NOT NULL,
	`lastName` varchar(50) NOT NULL,
	`emailId` varchar(50) NOT NULL UNIQUE,
	`mobileNumber` varchar(12) NOT NULL UNIQUE,
	`password` varchar(50) NOT NULL,
	PRIMARY KEY (`customerId`)
);

select * from customer;


CREATE TABLE `customerAddresses` (
	`addressId` varchar(50) NOT NULL,
	`customerId` varchar(50) NOT NULL,
	`completeAddress` varchar(100) NOT NULL,
	PRIMARY KEY (`addressId`)
);

select * from customerAddresses;


ALTER TABLE `customerAddresses` ADD CONSTRAINT `customerAddresses_fk0` FOREIGN KEY (`customerId`) REFERENCES `customers`(`customerId`);




CREATE TABLE `category` (
	`categoryId` varchar(10) NOT NULL,
	`categoryName` varchar(50) NOT NULL,
	PRIMARY KEY (`categoryId`)
);

insert into category values( 'CAT1', 'Door Accessories');

select * from category;



CREATE TABLE `subCategories` (
	`subCategoryId` varchar(10) NOT NULL,
	`subCategoryName` varchar(50) NOT NULL,
	`categoryId` varchar(10) NOT NULL,
	PRIMARY KEY (`subCategoryId`)
);

ALTER TABLE `subCategories` ADD CONSTRAINT `subCategories_fk0` FOREIGN KEY (`categoryId`) REFERENCES `category`(`categoryId`);

create view allCategoriesInfo as select category.categoryId, categoryName, subCategoryName from category, subCategories 
where category.categoryId = subCategories.categoryId;

insert into subCategories values('SUBCAT1001', 'Control Systems', 'CAT1');
insert into subCategories values('SUBCAT1002', 'Double Door Attachment', 'CAT1');
insert into subCategories values('SUBCAT1003', 'Glass Combo Set', 'CAT1');
insert into subCategories values('SUBCAT1004', 'Gaurd And Stoppers', 'CAT1');
insert into subCategories values('SUBCAT1005', 'Hinges', 'CAT1');
insert into subCategories values('SUBCAT1006', 'Lever Handles', 'CAT1');
insert into subCategories values('SUBCAT1007', 'Patch Fittings', 'CAT1');
insert into subCategories values('SUBCAT1008', 'Pull Handles', 'CAT1');
insert into subCategories values('SUBCAT1009', 'Safety Bolts', 'CAT1');
insert into subCategories values('SUBCAT1010', 'Tower Bolts', 'CAT1');
insert into subCategories values('SUBCAT1011', 'Door Viewers', 'CAT1');
insert into subCategories values('SUBCAT1012', 'Digital Locks', 'CAT1');

select * from subCategories;


CREATE TABLE `products` (
	`productId` varchar(10) NOT NULL,
	`productName` varchar(50) NOT NULL,
	`subCategoryId` varchar(10) NOT NULL,
	`imagePath` varchar(200) NOT NULL,
	PRIMARY KEY (`productId`)
);


insert into products values('PRD1001', 'DC 40 SM', 'SUBCAT1001', '../images/Door Accessories/Control Systems/DC 40 SM.png');
insert into products values('PRD1002', 'DC 60 SM', 'SUBCAT1001', '../images/Door Accessories/Control Systems/DC 60 SM.png');
insert into products values('PRD1003', 'DC 60', 'SUBCAT1001', '../images/Door Accessories/Control Systems/DC 60.png');
insert into products values('PRD1004', 'DC 65 CO', 'SUBCAT1001', '../images/Door Accessories/Control Systems/DC 65 CO.png');
insert into products values('PRD1005', 'DC 80 EXT WP', 'SUBCAT1001', '../images/Door Accessories/Control Systems/DC 80 EXT WP.png');
insert into products values('PRD1006', 'DC 80 EXT', 'SUBCAT1001', '../images/Door Accessories/Control Systems/DC 80 EXT.png');
insert into products values('PRD1007', 'DC 80 PDC WP', 'SUBCAT1001', '../images/Door Accessories/Control Systems/DC 80 PDC WP.png');
insert into products values('PRD1008', 'DC 80 PDC', 'SUBCAT1001', '../images/Door Accessories/Control Systems/DC 80 PDC.png');
insert into products values('PRD1009', 'DC 80 CO', 'SUBCAT1001', '../images/Door Accessories/Control Systems/DC 85 CO.png');
insert into products values('PRD1010', 'DOOR CLOSER', 'SUBCAT1001', '../images/Door Accessories/Control Systems/FIRE RATED DOOR CLOSER.jpeg');
insert into products values('PRD1011', 'FS 100', 'SUBCAT1001', '../images/Door Accessories/Control Systems/FS100.png');
insert into products values('PRD1012', 'FS 120', 'SUBCAT1001', '../images/Door Accessories/Control Systems/FS120.png');
insert into products values('PRD1013', 'FS 150', 'SUBCAT1001', '../images/Door Accessories/Control Systems/FS150.png');
insert into products values('PRD1014', 'FS 6080 ', 'SUBCAT1001', '../images/Door Accessories/Control Systems/FS6080.png');
insert into products values('PRD1015', 'FS 6120', 'SUBCAT1001', '../images/Door Accessories/Control Systems/FS6120.png');
insert into products values('PRD1016', 'FS 7070', 'SUBCAT1001', '../images/Door Accessories/Control Systems/FS7070.png');
insert into products values('PRD1017', 'FS TP/BP', 'SUBCAT1001', '../images/Door Accessories/Control Systems/FSTPBP.png');

insert into products values('PRD1018', 'FOR DEAD LOCK', 'SUBCAT1002', '../images/Door Accessories/Double Door Attachment/FOR-DEAD-LOCK.png');
insert into products values('PRD1019', 'FOR MORTISE LOCK', 'SUBCAT1002', '../images/Door Accessories/Double Door Attachment/FOR-MORTISE-LOCK.png');

insert into products values('PRD1020', 'CS 70', 'SUBCAT1003', '../images/Door Accessories/Glass Combo Set/CS70.jpeg');
insert into products values('PRD1021', 'CS 70 WL', 'SUBCAT1003', '../images/Door Accessories/Glass Combo Set/CS70WL.jpeg');
insert into products values('PRD1022', 'CS 80', 'SUBCAT1003', '../images/Door Accessories/Glass Combo Set/CS80.jpeg');
insert into products values('PRD1023', 'CS 80 WL', 'SUBCAT1003', '../images/Door Accessories/Glass Combo Set/CS80WL.jpeg');
insert into products values('PRD1024', 'CS 100', 'SUBCAT1003', '../images/Door Accessories/Glass Combo Set/CS100.jpeg');
insert into products values('PRD1025', 'CS 100 WL', 'SUBCAT1003', '../images/Door Accessories/Glass Combo Set/CS100WL.jpeg');

insert into products values('PRD1026', 'BUFFER BLACK', 'SUBCAT1004', '../images/Door Accessories/Guard And Stoppers/BUFFER-BLACK.png');
insert into products values('PRD1027', 'BUFFER PVC WHITE', 'SUBCAT1004', '../images/Door Accessories/Guard And Stoppers/BUFFER-PVC-WHITE.png');
insert into products values('PRD1028', 'FLOOR MOUNTED', 'SUBCAT1004', '../images/Door Accessories/Guard And Stoppers/FLOOR-MOUNTED.png');
insert into products values('PRD1029', 'GUARD BUCKL TYPE', 'SUBCAT1004', '../images/Door Accessories/Guard And Stoppers/GUARD-BUCKLE-TYPE.png');
insert into products values('PRD1030', 'KADI TALA', 'SUBCAT1004', '../images/Door Accessories/Guard And Stoppers/KADI-TALA.png');
insert into products values('PRD1031', 'MAGNETIC DOOR CATCHER', 'SUBCAT1004', '../images/Door Accessories/Guard And Stoppers/MAGNETIC-DOOR-CATCHER.png');
insert into products values('PRD1032', 'MAGNETIC CONCEALED STOPPER', 'SUBCAT1004', '../images/Door Accessories/Guard And Stoppers/MAGNETO-CONCEALED-STOPPER.png');
insert into products values('PRD1033', 'MOUNTED HANGING TYPE', 'SUBCAT1004', '../images/Door Accessories/Guard And Stoppers/MOUNTED-HANGING-TYPE.png');
insert into products values('PRD1034', 'SAFETY CHAIN', 'SUBCAT1004', '../images/Door Accessories/Guard And Stoppers/SAFETY-CHAIN.png');
insert into products values('PRD1035', 'TAP', 'SUBCAT1004', '../images/Door Accessories/Guard And Stoppers/TAP.png');
insert into products values('PRD1036', 'WALL MOUNTED WC', 'SUBCAT1004', '../images/Door Accessories/Guard And Stoppers/WALL-MOUNTED-WITH-COVER.png');
insert into products values('PRD1037', 'WALL MOUNTED WOC', 'SUBCAT1004', '../images/Door Accessories/Guard And Stoppers/WALL-MOUNTED-WITHOUT-COVER.png');

insert into products values('PRD1038', 'BALL BEARING', 'SUBCAT1005', '../images/Door Accessories/Hinges/Ball-Bearings.png');
insert into products values('PRD1039', 'FIRE RATED BALL BEARING', 'SUBCAT1005', '../images/Door Accessories/Hinges/Fire-Rated-Ball-Bearing.jpeg');
insert into products values('PRD1040', 'PIN TYPE', 'SUBCAT1005', '../images/Door Accessories/Hinges/Pin-Type.png');
insert into products values('PRD1041', 'ROUND CORNER', 'SUBCAT1005', '../images/Door Accessories/Hinges/Round-Corner.png');

insert into products values('PRD1042', 'ARGUS', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/ARGUS.png');
insert into products values('PRD1043', 'ATELIER', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/ATELIER.png');
insert into products values('PRD1044', 'AXOR', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/AXOR.png');
insert into products values('PRD1045', 'BLOB', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/BLOB.png');
insert into products values('PRD1046', 'C-TYPE', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/C-TYPE.png');
insert into products values('PRD1047', 'CELISA', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/CELISA.png');
insert into products values('PRD1048', 'CELLA', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/CELLA.png');
insert into products values('PRD1049', 'CORNUS', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/CORNUS.png');
insert into products values('PRD1050', 'D TYPE WITH OPTION', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/D-TYPE-WITH-PLATE.png');
insert into products values('PRD1051', 'D TYPE WITH SQUARE', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/D-TYPE-WITH-SQUARE-PLATE.png');


insert into products values('PRD1052', 'D TYPE', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/D-TYPE.png');
insert into products values('PRD1053', 'DANA', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/DANA.png');
insert into products values('PRD1054', 'DECO 105 BLACK', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/DECO-105-BLACK.png');
insert into products values('PRD1055', 'DECO 105 GOLD', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/DECO-105-GOLD.png');
insert into products values('PRD1056', 'DECO 105 SILVER', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/DECO-105-SILVER.png');
insert into products values('PRD1057', 'DROP ON PLATE', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/DROP-ON-PLATE.png');
insert into products values('PRD1058', 'DROP', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/DROP.png');
insert into products values('PRD1059', 'EDEN', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/EDEN.png');
insert into products values('PRD1060', 'ELMO', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/ELMO.png');
insert into products values('PRD1061', 'FLAP', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/FLAP.png');
insert into products values('PRD1062', 'FLO', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/FLO.png');
insert into products values('PRD1063', 'GLOBO 104 BLACK', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/GLOBO-104-BLACK.png');
insert into products values('PRD1064', 'GLOBO 104 BRONZE', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/GLOBO-104-BRONZE.png');
insert into products values('PRD1065', 'GLOBO 104 GOLD', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/GLOBO-104-GOLD.png');
insert into products values('PRD1066', 'GLOBO 104 SILVER', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/GLOBO-104-SILVER.png');
insert into products values('PRD1067', 'INFINITO', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/INFINITO.png');
insert into products values('PRD1068', 'JULIET', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/JULIET.png');
insert into products values('PRD1069', 'KONICA 102 BLACK', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/KONICA-102-BLACK.png');
insert into products values('PRD1070', 'KONICA 102 GOLD', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/KONICA-102-GOLD.png');
insert into products values('PRD1071', 'KRYSTA', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/KRYSTA.png');
insert into products values('PRD1072', 'L TYPE', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/L-TYPE.png');
insert into products values('PRD1073', 'LEVA 101 BLACK', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/LEVA-101-BLACK.png');
insert into products values('PRD1074', 'LEVA 101 BRONZE', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/LEVA-101-BRONZE.png');
insert into products values('PRD1075', 'LEVA 101 GOLD', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/LEVA-101-GOLD.png');
insert into products values('PRD1076', 'LEVA 101 SILVER', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/LEVA-101-SILVER.png');
insert into products values('PRD1077', 'MADONNA', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/MADONNA.png');
insert into products values('PRD1078', 'MERINA', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/MERINA.png');
insert into products values('PRD1079', 'NOS', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/NOS.jpeg');
insert into products values('PRD1080', 'OPTIO', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/OPTIO.png');
insert into products values('PRD1081', 'ORBIA', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/ORBIA.png');
insert into products values('PRD1082', 'ORIUS', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/ORIUS.png');
insert into products values('PRD1083', 'PILOT', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/PILOT.png');
insert into products values('PRD1084', 'PRIMO', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/PRIMO.png');
insert into products values('PRD1085', 'REFLEX', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/REFLEX.png');
insert into products values('PRD1086', 'ROCCIO 101 BLACK', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/ROCCIO-101-BLACK.png');
insert into products values('PRD1087', 'ROCCIO 101 BRONZ', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/ROCCIO-101-BLACK.png');
insert into products values('PRD1088', 'ROCCIO 101 GOLD', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/ROCCIO-101-GOLD.png');
insert into products values('PRD1089', 'RYDER', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/RYDER.png');
insert into products values('PRD1090', 'SEP', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/SEP.png');
insert into products values('PRD1091', 'SIERA', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/SIERA.png');
insert into products values('PRD1092', 'SLP', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/SLP.png');
insert into products values('PRD1093', 'SO', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/SO.png');
insert into products values('PRD1094', 'SPEERA', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/SPEERA.png');
insert into products values('PRD1095', 'TORSE 102 BLACK', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/TORSE-102-BLACK.png');
insert into products values('PRD1096', 'TORSE 102 BRONZE', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/TORSE-102-BRONZE.png');
insert into products values('PRD1097', 'TORSE 102 GOLD', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/TORSE-102-GOLD.png');
insert into products values('PRD1098', 'TORSE 102 SILVER', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/TORSE-102-SILVER.png');
insert into products values('PRD1099', 'TRASE', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/TRASE.png');
insert into products values('PRD1100', 'TWIRL 103 BRONZE', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/TWIRL-103-BRONZE.png');
insert into products values('PRD1101', 'TWIRL 103 SILVER', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/TWIRL-103-SILVER.png');
insert into products values('PRD1102', 'TWIRL 103 BLACK', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/TWRIL-103-BLACK.png');
insert into products values('PRD1103', 'TWIRL 103 GOLD', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/TWRIL-103-GOLD.png');
insert into products values('PRD1104', 'U TYPE', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/U-TYPE.png');
insert into products values('PRD1105', 'VELVET', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/VELVET.png');
insert into products values('PRD1106', 'VITRA', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/VITRA.png');
insert into products values('PRD1107', 'VOLEX', 'SUBCAT1006', '../images/Door Accessories/Lever Handles/VOLEX.png');

insert into products values('PRD1108', 'BOTTOM PATCH', 'SUBCAT1007', '../images/Door Accessories/Patch Fitting/BOTTOM-PATCH.png');
insert into products values('PRD1109', 'DBL PATCH FIN & PIVOT', 'SUBCAT1007', '../images/Door Accessories/Patch Fitting/DOUBLE-PATCH-FIN-AND-PIVOT.png');
insert into products values('PRD1110', 'OVER PANEL L', 'SUBCAT1007', '../images/Door Accessories/Patch Fitting/OVER-PANEL-L-PATCH.png');
insert into products values('PRD1111', 'OVER PANEL PIVOT', 'SUBCAT1007', '../images/Door Accessories/Patch Fitting/OVER-PANEL-PIVOT-PATCH.png');
insert into products values('PRD1112', 'OVER PANEL R', 'SUBCAT1007', '../images/Door Accessories/Patch Fitting/OVER-PANEL-R-PATCH.png');
insert into products values('PRD1113', 'WALL TO GLASS', 'SUBCAT1007', '../images/Door Accessories/Patch Fitting/PATCH FITTING-FOR-WALL-TO-GLASS.png');
insert into products values('PRD1114', 'FOUR GLASS', 'SUBCAT1007', '../images/Door Accessories/Patch Fitting/PATCH-FITTING-FOR-FOUR-GLASS.png');
insert into products values('PRD1115', 'FOUR GLASS WITH PIVOT', 'SUBCAT1007', '../images/Door Accessories/Patch Fitting/PATCH-FITTING-FOR-GLASS-TO-GLASS-FOR-FOUR-GLASS-WITH-FIN.png');
insert into products values('PRD1116', 'GLASS TO GLASS WITH FIN', 'SUBCAT1007', '../images/Door Accessories/Patch Fitting/PATCH-FITTING-FOR-GLASS-TO-GLASS-WITH-FIN.png');
insert into products values('PRD1117', 'TWO GLASS PANEL', 'SUBCAT1007', '../images/Door Accessories/Patch Fitting/PATCH-FITTING-FOR-TWO-GLASS-PANEL.png');
insert into products values('PRD1118', 'SIDE CORNER L', 'SUBCAT1007', '../images/Door Accessories/Patch Fitting/SIDE-CORNER-L-PATCH.png');
insert into products values('PRD1119', 'TOP CORNER', 'SUBCAT1007', '../images/Door Accessories/Patch Fitting/TOP-CORNER-PATCH.png');
insert into products values('PRD1120', 'TOP PATCH', 'SUBCAT1007', '../images/Door Accessories/Patch Fitting/TOP-PATCH.png');
insert into products values('PRD1121', 'TOP PIVOT', 'SUBCAT1007', '../images/Door Accessories/Patch Fitting/TOP-PIVOT.png');
insert into products values('PRD1122', 'WALL TO GLASS CONN', 'SUBCAT1007', '../images/Door Accessories/Patch Fitting/WALL-TO-GLASS-CONNECTOR.png');

insert into products values('PRD1123', 'ACE FOR GLASS DOOR', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/ACE-FOR-GLASS-DOOR.png');
insert into products values('PRD1124', 'ACE', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/ACE.png');
insert into products values('PRD1125', 'ALINE', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/ALINE.png');
insert into products values('PRD1126', 'ALITO', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/ALITO.png');
insert into products values('PRD1127', 'ARCH', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/ARCH.png');
insert into products values('PRD1128', 'ATINO', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/ATINA.png');
insert into products values('PRD1129', 'CUALLI', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/CUALLI.png');
insert into products values('PRD1130', 'CURVE', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/CURVE.png');
insert into products values('PRD1131', 'D TYPE', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/D-TYPE.jpeg');
insert into products values('PRD1132', 'DELFINO', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/DELFINO-WITHOUT-CRYSTAL.png');
insert into products values('PRD1133', 'EBONY', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/EBONY.png');
insert into products values('PRD1134', 'EDEN', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/EDEN.jpeg');
insert into products values('PRD1136', 'ELXIER', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/ELXIER.png');
insert into products values('PRD1137', 'FORTE', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/FORTE.png');
insert into products values('PRD1138', 'FORZA', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/FORZA.png');
insert into products values('PRD1139', 'GALAXY', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/GALAXY.png');
insert into products values('PRD1140', 'H TYPE', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/H-TYPE.png');
insert into products values('PRD1141', 'INSPIRE', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/INSPIRE.png');
insert into products values('PRD1142', 'LEEBA', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/LEEBA.png');
insert into products values('PRD1143', 'MADONNA', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/MADONNA.png');
insert into products values('PRD1144', 'MOHANA', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/MOHANA.png');
insert into products values('PRD1145', 'MYSTIQUE', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/MYSTIQUE.png');
insert into products values('PRD1146', 'NIKA', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/NIKA.png');
insert into products values('PRD1147', 'OPERA', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/OPERA.png');
insert into products values('PRD1148', 'PIENO', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/PIENO.png');
insert into products values('PRD1149', 'PRIMO', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/PRIMO.jpeg');
insert into products values('PRD1150', 'SANA', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/SANA.png');
insert into products values('PRD1151', 'SEP TYPE', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/SEP-TYPE.jpeg');
insert into products values('PRD1152', 'SIROCCO', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/SIROCCO.png');
insert into products values('PRD1153', 'TEESTA', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/TEESTA.png');
insert into products values('PRD1154', 'TERO', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/TERO.png');
insert into products values('PRD1155', 'VERSA', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/VERSA.png');
insert into products values('PRD1156', 'XIA', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/XIA.png');
insert into products values('PRD1157', 'ZARA', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/ZARA.png');
insert into products values('PRD1158', 'ZUMA', 'SUBCAT1008', '../images/Door Accessories/Pull Handles/ZUMA.png');

insert into products values('PRD1159', 'BABY LATCH BIG', 'SUBCAT1009', '../images/Door Accessories/Safety Bolts/BABY-LATCH-BIG.png');
insert into products values('PRD1160', 'BABY LATCH SMALL', 'SUBCAT1009', '../images/Door Accessories/Safety Bolts/BABY-LATCH-SMALL.png');
insert into products values('PRD1161', 'INDICATOR BOLT', 'SUBCAT1009', '../images/Door Accessories/Safety Bolts/INDICATOR-BOLT.png');

insert into products values('PRD1162', 'BRASS', 'SUBCAT1010', '../images/Door Accessories/Tower Bolt/BRASS.png');
insert into products values('PRD1163', 'STAINLESS STEEL', 'SUBCAT1010', '../images/Door Accessories/Tower Bolt/STAINLESS-STEEL.png');

insert into products values('PRD1164', 'MAGIC EYE WITH FLAP', 'SUBCAT1011', '../images/Door Accessories/Viewers/MAGIC-EYE-WITH-FLAP.png');
insert into products values('PRD1165', 'MAGIC EYE', 'SUBCAT1011', '../images/Door Accessories/Viewers/MAGIC-EYE.png');

insert into products values('PRD1166', 'DG 101', 'SUBCAT1012', '../images/Door Accessories/Digital Locks/DG-101-BLACK.png');
insert into products values('PRD1167', 'DG 501 BLACK', 'SUBCAT1012', '../images/Door Accessories/Digital Locks/DG-501-BLACK.jpeg');
insert into products values('PRD1168', 'DG 501 GOLD', 'SUBCAT1012', '../images/Door Accessories/Digital Locks/DG-501-GOLD.png');
insert into products values('PRD1169', 'DG 502', 'SUBCAT1012', '../images/Door Accessories/Digital Locks/DG-502-BLACK.jpeg');
insert into products values('PRD1170', 'DG 503', 'SUBCAT1012', '../images/Door Accessories/Digital Locks/DG-503-BLACK.jpeg');
insert into products values('PRD1171', 'DG 504', 'SUBCAT1012', '../images/Door Accessories/Digital Locks/DG-504-BLACK.jpeg');
insert into products values('PRD1172', 'DG 501', 'SUBCAT1012', '../images/Door Accessories/Digital Locks/DG-601-BLACK.jpeg');
insert into products values('PRD1173', 'DG 603', 'SUBCAT1012', '../images/Door Accessories/Digital Locks/DG-603-BLACK.jpeg');
insert into products values('PRD1174', 'DG 606', 'SUBCAT1012', '../images/Door Accessories/Digital Locks/DG-606-BLACK.jpeg');
insert into products values('PRD1175', 'DG 607', 'SUBCAT1012', '../images/Door Accessories/Digital Locks/DG-607-BLACK.jpeg');
insert into products values('PRD1176', 'DG 801', 'SUBCAT1012', '../images/Door Accessories/Digital Locks/DG-801-BLACK.jpeg');
insert into products values('PRD1177', 'DG 806', 'SUBCAT1012', '../images/Door Accessories/Digital Locks/DG-806-BLACK.png');
insert into products values('PRD1178', 'DG 807', 'SUBCAT1012', '../images/Door Accessories/Digital Locks/DG-807-BLACK.png');
insert into products values('PRD1179', 'DG GLASS WITH REMOTE', 'SUBCAT1012', '../images/Door Accessories/Digital Locks/DG-GLASS-WITH-REMOTE.png');


CREATE TABLE `productInfo` (
	`productInfoId` varchar(10) NOT NULL,
	`totalStock` int NOT NULL,
	`unitPrice` int NOT NULL,
	`totalPrice` int NOT NULL,
	`productId` varchar(10) NOT NULL,
	PRIMARY KEY (`productInfoId`)
);

ALTER TABLE `productInfo` ADD CONSTRAINT `productInfo_fk0` FOREIGN KEY (`productId`) REFERENCES `products`(`productId`);

insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1001', 100, 2200, 220000, 'PRD1001');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1002', 100, 2100, 210000, 'PRD1002');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1003', 100, 2345, 234500, 'PRD1003');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1004', 100, 2120, 212000, 'PRD1004');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1005', 100, 2200, 220000, 'PRD1005');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1006', 100, 2100, 210000, 'PRD1006');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1007', 100, 2345, 234500, 'PRD1007');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1008', 100, 2120, 212000, 'PRD1008');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1009', 100, 2200, 220000, 'PRD1009');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1010', 100, 2100, 210000, 'PRD1010');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1011', 100, 2345, 234500, 'PRD1011');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1012', 100, 2120, 212000, 'PRD1012');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1013', 100, 2120, 212000, 'PRD1013');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1014', 100, 2200, 220000, 'PRD1014');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1015', 100, 2100, 210000, 'PRD1015');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1016', 100, 2345, 234500, 'PRD1016');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1017', 100, 2120, 212000, 'PRD1017');

insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1018', 100, 250, 25000, 'PRD1018');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1019', 100, 300, 30000, 'PRD1019');

insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1020', 100, 725, 72500, 'PRD1020');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1021', 100, 750, 75000, 'PRD1021');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1022', 100, 730, 73000, 'PRD1022');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1023', 100, 760, 76000, 'PRD1023');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1024', 100, 740, 74000, 'PRD1024');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1025', 100, 780, 78000, 'PRD1025');

insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1026', 100, 40, 4000, 'PRD1026');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1027', 100, 30, 3000, 'PRD1027');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1028', 100, 50, 5000, 'PRD1028');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1029', 100, 80, 8000, 'PRD1029');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1030', 100, 650, 65000, 'PRD1030');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1031', 100, 150, 15000, 'PRD1031');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1032', 100, 120, 12000, 'PRD1032');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1033', 100, 240, 24000, 'PRD1033');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1034', 100, 180, 18000, 'PRD1034');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1035', 100, 60, 6000, 'PRD1035');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1036', 100, 80, 8000, 'PRD1036');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1037', 100, 100, 10000, 'PRD1037');

insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1038', 100, 120, 12000, 'PRD1038');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1039', 100, 180, 18000, 'PRD1039');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1040', 100, 125, 12500, 'PRD1040');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1041', 100, 160, 16000, 'PRD1041');

insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1042', 100, 350, 35000, 'PRD1042');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1043', 100, 320, 32000, 'PRD1043');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1044', 100, 280, 28000, 'PRD1044');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1045', 100, 300, 30000, 'PRD1045');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1046', 100, 290, 29000, 'PRD1046');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1047', 100, 330, 33000, 'PRD1047');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1048', 100, 340, 34000, 'PRD1048');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1049', 100, 360, 36000, 'PRD1049');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1050', 100, 280, 28000, 'PRD1050');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1051', 100, 270, 27000, 'PRD1051');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1052', 100, 310, 31000, 'PRD1052');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1053', 100, 325, 32500, 'PRD1053');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1054', 100, 350, 35000, 'PRD1054');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1055', 100, 320, 32000, 'PRD1055');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1056', 100, 280, 28000, 'PRD1056');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1057', 100, 300, 30000, 'PRD1057');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1058', 100, 290, 29000, 'PRD1058');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1059', 100, 330, 33000, 'PRD1059');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1060', 100, 340, 34000, 'PRD1060');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1061', 100, 360, 36000, 'PRD1061');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1062', 100, 280, 28000, 'PRD1062');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1063', 100, 270, 27000, 'PRD1063');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1064', 100, 310, 31000, 'PRD1064');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1065', 100, 325, 32500, 'PRD1065');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1066', 100, 350, 35000, 'PRD1066');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1067', 100, 320, 32000, 'PRD1067');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1068', 100, 280, 28000, 'PRD1068');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1069', 100, 300, 30000, 'PRD1069');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1070', 100, 290, 29000, 'PRD1070');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1071', 100, 330, 33000, 'PRD1071');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1072', 100, 340, 34000, 'PRD1072');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1073', 100, 360, 36000, 'PRD1073');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1074', 100, 330, 33000, 'PRD1074');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1075', 100, 280, 28000, 'PRD1075');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1076', 100, 270, 27000, 'PRD1076');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1077', 100, 310, 31000, 'PRD1077');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1078', 100, 325, 32500, 'PRD1078');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1079', 100, 350, 35000, 'PRD1079');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1080', 100, 320, 32000, 'PRD1080');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1081', 100, 280, 28000, 'PRD1081');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1082', 100, 300, 30000, 'PRD1082');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1083', 100, 290, 29000, 'PRD1083');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1084', 100, 330, 33000, 'PRD1084');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1085', 100, 340, 34000, 'PRD1085');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1086', 100, 360, 36000, 'PRD1086');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1087', 100, 280, 28000, 'PRD1087');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1088', 100, 270, 27000, 'PRD1088');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1089', 100, 310, 31000, 'PRD1089');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1090', 100, 325, 32500, 'PRD1090');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1091', 100, 350, 35000, 'PRD1091');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1092', 100, 320, 32000, 'PRD1092');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1093', 100, 280, 28000, 'PRD1093');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1094', 100, 300, 30000, 'PRD1094');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1095', 100, 290, 29000, 'PRD1095');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1096', 100, 330, 33000, 'PRD1096');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1097', 100, 340, 34000, 'PRD1097');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1098', 100, 360, 36000, 'PRD1098');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1099', 100, 280, 28000, 'PRD1099');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1100', 100, 270, 27000, 'PRD1100');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1101', 100, 310, 31000, 'PRD1101');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1102', 100, 325, 32500, 'PRD1102');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1103', 100, 350, 35000, 'PRD1103');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1104', 100, 320, 32000, 'PRD1104');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1105', 100, 280, 28000, 'PRD1105');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1106', 100, 300, 30000, 'PRD1106');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1107', 100, 290, 29000, 'PRD1107');

insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1108', 100, 120, 12000, 'PRD1108');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1109', 100, 180, 18000, 'PRD1109');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1110', 100, 125, 12500, 'PRD1110');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1111', 100, 160, 16000, 'PRD1111');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1112', 100, 130, 13000, 'PRD1112');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1113', 100, 150, 15000, 'PRD1113');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1114', 100, 125, 12500, 'PRD1114');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1115', 100, 160, 16000, 'PRD1115');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1116', 100, 120, 12000, 'PRD1116');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1117', 100, 180, 18000, 'PRD1117');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1118', 100, 125, 12500, 'PRD1118');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1119', 100, 160, 16000, 'PRD1119');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1120', 100, 120, 12000, 'PRD1120');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1121', 100, 180, 18000, 'PRD1121');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1122', 100, 125, 12500, 'PRD1122');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1123', 100, 160, 16000, 'PRD1123');

insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1124', 100, 120, 12000, 'PRD1124');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1125', 100, 180, 18000, 'PRD1125');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1126', 100, 125, 12500, 'PRD1126');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1127', 100, 160, 16000, 'PRD1127');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1128', 100, 130, 13000, 'PRD1128');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1129', 100, 150, 15000, 'PRD1129');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1130', 100, 125, 12500, 'PRD1130');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1131', 100, 160, 16000, 'PRD1131');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1132', 100, 120, 12000, 'PRD1132');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1133', 100, 180, 18000, 'PRD1133');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1134', 100, 125, 12500, 'PRD1134');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1136', 100, 120, 12000, 'PRD1136');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1137', 100, 180, 18000, 'PRD1137');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1138', 100, 125, 12500, 'PRD1138');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1139', 100, 160, 16000, 'PRD1139');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1140', 100, 120, 12000, 'PRD1140');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1141', 100, 180, 18000, 'PRD1141');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1142', 100, 125, 12500, 'PRD1142');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1143', 100, 160, 16000, 'PRD1143');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1144', 100, 130, 13000, 'PRD1144');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1145', 100, 150, 15000, 'PRD1145');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1146', 100, 125, 12500, 'PRD1146');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1147', 100, 160, 16000, 'PRD1147');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1148', 100, 120, 12000, 'PRD1148');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1149', 100, 180, 18000, 'PRD1149');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1150', 100, 125, 12500, 'PRD1150');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1151', 100, 160, 16000, 'PRD1151');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1152', 100, 120, 12000, 'PRD1152');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1153', 100, 180, 18000, 'PRD1153');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1154', 100, 125, 12500, 'PRD1154');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1155', 100, 160, 16000, 'PRD1155');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1156', 100, 125, 12500, 'PRD1156');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1157', 100, 175, 17500, 'PRD1157');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1158', 100, 125, 12500, 'PRD1158');

insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1159', 100, 160, 16000, 'PRD1159');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1160', 100, 175, 17500, 'PRD1160');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1161', 100, 125, 12500, 'PRD1161');

insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1162', 100, 275, 27500, 'PRD1162');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1163', 100, 250, 25000, 'PRD1163');

insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1164', 100, 225, 22500, 'PRD1164');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1165', 100, 230, 23000, 'PRD1165');

insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1166', 100, 10500, 1050000, 'PRD1166');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1167', 100, 11000, 1100000, 'PRD1167');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1168', 100, 13500, 1350000, 'PRD1168');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1169', 100, 14000, 1400000, 'PRD1169');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1170', 100, 14500, 1450000, 'PRD1170');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1171', 100, 12800, 1280000, 'PRD1171');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1172', 100, 8500, 850000, 'PRD1172');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1173', 100, 7800, 780000, 'PRD1173');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1174', 100, 8000, 800000, 'PRD1174');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1175', 100, 7500, 750000, 'PRD1175');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1176', 100, 12000, 1200000, 'PRD1176');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1177', 100, 4300, 430000, 'PRD1177');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1178', 100, 4500, 450000, 'PRD1178');
insert into productInfo (productInfoId, totalStock, unitPrice, totalPrice, productId) values('PRDIF1179', 100, 18000, 1800000, 'PRD1179');



CREATE TABLE `orders` (
	`orderId` varchar(10) NOT NULL,
	`orderDate` DATE NOT NULL,
	`deliveryDate` DATE NOT NULL,
	`customerId` varchar(10) NOT NULL,
	PRIMARY KEY (`orderId`)
);

ALTER TABLE `orders` ADD CONSTRAINT `orders_fk0` FOREIGN KEY (`customerId`) REFERENCES `customers`(`customerId`);

CREATE TABLE `orderDetails` (
	`orderId` varchar(10) NOT NULL,
	`productId` varchar(10) NOT NULL,
	`quantity` int NOT NULL,
	PRIMARY KEY (`orderId`)
);

ALTER TABLE `orderDetails` ADD CONSTRAINT `orderDetails_fk0` FOREIGN KEY (`orderId`) REFERENCES `orders`(`orderId`);

ALTER TABLE `orderDetails` ADD CONSTRAINT `orderDetails_fk1` FOREIGN KEY (`productId`) REFERENCES `productInfo`(`productId`);


CREATE TABLE `paymentInfo` (
	`paymentId` varchar(10) NOT NULL,
	`orderId` varchar(10) NOT NULL,
	`paymentDate` DATE NOT NULL,
	`cardNumber` bigint,
	`cardExpiryDate` DATE,
	`cardCVV` int(3),
	`amount` int NOT NULL,
	`cardHolderName` varchar(50),
	`accountNumber` bigint,
	`chequeNumber` bigint,
	PRIMARY KEY (`paymentId`, `orderId`)
);

ALTER TABLE `paymentInfo` ADD CONSTRAINT `paymentInfo_fk0` FOREIGN KEY (`orderId`) REFERENCES `orderDetails`(`orderId`);



























