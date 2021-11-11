CREATE TABLE customer
(CustNo NUMBER(4),
CustFName VARCHAR2(20) NOT NULL,
CustLName VARCHAR2(20) NOT NULL,
CustAddress VARCHAR2(30),
CustCity VARCHAR2(30),
CustState VARCHAR2(2),
CustZipCode VARCHAR2(5),
CustPhoneNo CHAR(10) NOT NULL,
    CONSTRAINT customer_CustNo_pk PRIMARY KEY (CustNo),
       CONSTRAINT customer_CustPhoneNo_uk UNIQUE(CustPhoneNo),
	CONSTRAINT customer_CustPhoneNo_ck CHECK (CustPhoneNo NOT LIKE '%[^0-9]'));

CREATE TABLE vehicle
(VIN CHAR(17),
CustNo NUMBER(4) NOT NULL,
VYear NUMBER(4) NOT NULL,
VMake VARCHAR2(20), 
VModel VARCHAR2(20), 
LicensePlateNo VARCHAR2(8) NOT NULL,
LicenseState VARCHAR2(2),
    CONSTRAINT vehicle_VIN_pk PRIMARY KEY (VIN),
	CONSTRAINT vehicle_CustNo_fk FOREIGN KEY (CustNo)
	   REFERENCES customer (CustNo));

CREATE TABLE repairorder
(RepairOrdNo NUMBER(4),
VIN CHAR(17) NOT NULL, 
RepairOrdDate DATE  NOT NULL,
CarOdReading VARCHAR2(12) NOT NULL,
    CONSTRAINT repairorder_RepairOrdNo_pk PRIMARY KEY(RepairOrdNo),
	CONSTRAINT repairorder_VIN_fk FOREIGN KEY (VIN)
	    REFERENCES vehicle (VIN));
		
CREATE TABLE part
(PartNo NUMBER(4),
PartName VARCHAR2(20) NOT NULL,
PartCost NUMBER(6,2) NOT NULL,
PartSize VARCHAR2(5),
    CONSTRAINT part_PartNo_pk PRIMARY KEY(PartNo),
	CONSTRAINT part_PartCost_ck CHECK (PartCost>0));
	
	
CREATE TABLE partused
(RepairOrdNo NUMBER(4),
PartNo NUMBER(4),
QtyUsed NUMBER NOT NULL,
    CONSTRAINT partused_RepairOrdNoPartNo_pk PRIMARY KEY (RepairOrdNo,PartNo),
	CONSTRAINT partused_RepairOrdNo_fk FOREIGN KEY (RepairOrdNo)
	    REFERENCES repairorder(RepairOrdNo),
	CONSTRAINT partused_PartNo_fk FOREIGN KEY (PartNo)
	    REFERENCES part(PartNo),
	CONSTRAINT partused_QtyUsed_ck CHECK(QtyUsed>=0));
	
CREATE TABLE branch
(BranchNo NUMBER(4),
BAddress VARCHAR2(50) NOT NULL,
BCity VARCHAR2(30) NOT NULL,
BState VARCHAR2(2) NOT NULL,
BZipcode VARCHAR2(5) NOT NULL,
BName VARCHAR2(50),
     CONSTRAINT branch_BranchNo_pk PRIMARY KEY(BranchNo),
     CONSTRAINT branch_BName_uk UNIQUE (BName));
	 

CREATE TABLE inventory
(PartNo NUMBER(4),
BranchNo NUMBER(4),
QtyOnHand NUMBER NOT NULL,
    CONSTRAINT inventory_PartNoBranchNo_pk PRIMARY KEY(PartNo,BranchNo),
	CONSTRAINT inventory_PartNo_fk FOREIGN KEY (PartNo)
	    REFERENCES part(PartNo),
	CONSTRAINT inventory_BranchNo_fk FOREIGN KEY(BranchNo)
	    REFERENCES branch(BranchNo),
	CONSTRAINT inventory_QtyOnHand_ck CHECK (QtyOnHand>0));


INSERT INTO customer(CustNo,CustFName,CustLName,CustAddress,CustCity,CustState,CustZipCode,CustPhoneNo)
  VALUES (0001,'Eric','Edem','909 Market St.','Normal','IL','61761','3099890714');

INSERT INTO customer(CustNo,CustFName,CustLName,CustAddress,CustCity,CustState,CustZipCode,CustPhoneNo)
  VALUES (0002,'Kuta','Achuo','114 W Locust St.','Normal','IL','61761','3094448972');

INSERT INTO customer(CustNo,CustFName,CustLName,CustAddress,CustCity,CustState,CustZipCode,CustPhoneNo)
  VALUES (0003,'Sean','Kuti','114 W Locust St.','Bloomington','IL','61701','3094446754');

INSERT INTO customer(CustNo,CustFName,CustLName,CustAddress,CustCity,CustState,CustZipCode,CustPhoneNo)
  VALUES (0004,'Emily','Danelle','808 S Linden St.','Normal','IL','61761','7736760398');

INSERT INTO customer(CustNo,CustFName,CustLName,CustAddress,CustCity,CustState,CustZipCode,CustPhoneNo)
  VALUES (0005,'Hannah','Payne','307 Oak St.','Peoria','IL','61602','2177099891');

INSERT INTO customer(CustNo,CustFName,CustLName,CustAddress,CustCity,CustState,CustZipCode,CustPhoneNo)
  VALUES (0006,'Chris','Jean','123 Main St.','Champaign','IL','61820','3127656784');

INSERT INTO customer(CustNo,CustFName,CustLName,CustAddress,CustCity,CustState,CustZipCode,CustPhoneNo)
  VALUES (0007,'Kevin','Baynes','304 N Walnut St.','Normal','IL','61761','3098185426');

INSERT INTO customer(CustNo,CustFName,CustLName,CustAddress,CustCity,CustState,CustZipCode,CustPhoneNo)
  VALUES (0008,'Monroe','Louisa','507 E Mulberry St.','Champaign','IL','61826','3125437684');

INSERT INTO customer(CustNo,CustFName,CustLName,CustAddress,CustCity,CustState,CustZipCode,CustPhoneNo)
  VALUES (0009,'Marley','Wayne','114 W Hollow St.','Peoria','IL','61525','7732148962');

INSERT INTO customer(CustNo,CustFName,CustLName,CustAddress,CustCity,CustState,CustZipCode,CustPhoneNo)
  VALUES (0010,'Kameron','Diaz','808 N Willow Rd.','Urbana','IL','61802','3097656743');

INSERT INTO customer(CustNo,CustFName,CustLName,CustAddress,CustCity,CustState,CustZipCode,CustPhoneNo)
  VALUES (0011,'Mike','Crawford','204 W Walnut St.','Decatur','IL','62522','3126731983');

INSERT INTO customer(CustNo,CustFName,CustLName,CustAddress,CustCity,CustState,CustZipCode,CustPhoneNo)
  VALUES (0012,'Ethan','Levi','213 E Main St.','Champaign','IL','61821','3124586742');	

INSERT INTO customer(CustNo,CustFName,CustLName,CustAddress,CustCity,CustState,CustZipCode,CustPhoneNo)
  VALUES (0013,'Aoagye','Thompson','345 Willow View Ct.','Urbana','IL','61802','2178764852');

INSERT INTO customer(CustNo,CustFName,CustLName,CustAddress,CustCity,CustState,CustZipCode,CustPhoneNo)
  VALUES (0014,'Sam','James','453 Linden St.','Pekin','IL','61607','3098764549');
  
  
INSERT INTO vehicle(VIN,VYear,VModel,VMake,LicensePlateNo,LicenseState,CustNo)
  VALUES ('1G2JF27A8JG178227',1998,'Chevrolet','Blazer','CD80519','IL',0007);
  
INSERT INTO vehicle(VIN,VYear,VModel,VMake,LicensePlateNo,LicenseState,CustNo)
  VALUES ('4H1JF27R9JP188221',1993,'Honda','Del Sol','BC51632','IL',0013);
  
INSERT INTO vehicle(VIN,VYear,VModel,VMake,LicensePlateNo,LicenseState,CustNo)
  VALUES ('444JF24B4JY198127',2000,'Buick','Regal','BC51813','IL',0002);
  
INSERT INTO vehicle(VIN,VYear,VModel,VMake,LicensePlateNo,LicenseState,CustNo)
  VALUES ('4H1JF27G9NP171423',1992,'Honda','Civic Si','CD80195','IL',0008);
  
INSERT INTO vehicle(VIN,VYear,VModel,VMake,LicensePlateNo,LicenseState,CustNo)
  VALUES ('141JF27I1JP178327',1985,'Buick','Corolla','CD78342','IL',0005);
  
INSERT INTO vehicle(VIN,VYear,VModel,VMake,LicensePlateNo,LicenseState,CustNo)
  VALUES ('4F5JF47Y7YP179227',2001,'Ford','Impala','BC56537','IL',0002);
  
INSERT INTO vehicle(VIN,VYear,VModel,VMake,LicensePlateNo,LicenseState,CustNo)
  VALUES ('1H7JF67T9JP171127',2000,'Honda','Accord','CD67462','IL',0007);
  
INSERT INTO vehicle(VIN,VYear,VModel,VMake,LicensePlateNo,LicenseState,CustNo)
  VALUES ('4L1JF2LV3XP178129',1999,'Lincoln','Towne Car','999AAA','IN',0012);
  
INSERT INTO vehicle(VIN,VYear,VModel,VMake,LicensePlateNo,LicenseState,CustNo)
  VALUES ('1H2JF97O2JP178227',1998,'Honda','Civic DX','5DM3796','MD',0009);
  
INSERT INTO vehicle(VIN,VYear,VModel,VMake,LicensePlateNo,LicenseState,CustNo)
  VALUES ('1T1JF17K0VP172326',1997,'Toyota','Landcruiser','BD78345','IL',0014);
  
INSERT INTO vehicle(VIN,VYear,VModel,VMake,LicensePlateNo,LicenseState,CustNo)
  VALUES ('419JF87L51P188127',2001,'Chevrolet','Cavalier','DJV1825','MI',0003);
  
INSERT INTO vehicle(VIN,VYear,VModel,VMake,LicensePlateNo,LicenseState,CustNo)
  VALUES ('4F3JF57D5JP134227',1998,'Ford','Escort','CD78461','IL',0011);
  
INSERT INTO vehicle(VIN,VYear,VModel,VMake,LicensePlateNo,LicenseState,CustNo)
  VALUES ('127JF37N8XP178227',1999,'Pontiac','Firehawk','6TRJ244','CA',0001);
  
INSERT INTO vehicle(VIN,VYear,VModel,VMake,LicensePlateNo,LicenseState,CustNo)
  VALUES ('4B2JF77M8XP118226',1999,'BMW','320i','789GHI','CA',0004);
  
INSERT INTO vehicle(VIN,VYear,VModel,VMake,LicensePlateNo,LicenseState,CustNo)
  VALUES ('1H6JF17Z3SP178121',1995,'Honda','Civic','BD66344','IL',0010);
  
INSERT INTO vehicle(VIN,VYear,VModel,VMake,LicensePlateNo,LicenseState,CustNo)
  VALUES ('4F3JF57X3YP171323',2000,'Ford','F-100','315-NKX','WI',0006);
  
INSERT INTO vehicle(VIN,VYear,VModel,VMake,LicensePlateNo,LicenseState,CustNo)
  VALUES ('1T6JF47U52P176721',2002,'Toyota','Celica','CD78363','IL',0009);
  
INSERT INTO vehicle(VIN,VYear,VModel,VMake,LicensePlateNo,LicenseState,CustNo)
  VALUES ('4T1JF27Y1XP173123',1999,'Toyota','Pick-Up','BD76732','IL',0008);
  
INSERT INTO vehicle(VIN,VYear,VModel,VMake,LicensePlateNo,LicenseState,CustNo)
  VALUES ('411JF57H81P178829',2001,'Chevrolet','Cavalier','103-UTS','WI',0003);
  
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0001,'168000','03-MAY-2021','1G2JF27A8JG178227');
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0002,'25500','03-MAY-2021','4H1JF27G9NP171423');
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0003,'60000','04-MAY-2021','1H7JF67T9JP171127');
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0004,'71600','06-MAY-2021','1G2JF27A8JG178227');
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0005,'92000','06-MAY-2021','1H7JF67T9JP171127');
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0006,'16000','07-MAY-2021','4H1JF27R9JP188221');
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0007,'11200','10-MAY-2021','411JF57H81P178829');
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0008,'25400','10-MAY-2021','419JF87L51P188127');
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0009,'45000','11-MAY-2021','4T1JF27Y1XP173123');
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0010,'20000','11-MAY-2021','4B2JF77M8XP118226');
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0011,'34000','12-MAY-2021','1H2JF97O2JP178227');
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0012,'56900','13-MAY-2021','4B2JF77M8XP118226');
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0013,'66700','14-MAY-2021','1T1JF17K0VP172326');
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0014,'23000','14-MAY-2021','4F3JF57D5JP134227');
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0015,'55000','14-MAY-2021','1H7JF67T9JP171127');
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0016,'23000','17-MAY-2021','1T1JF17K0VP172326');
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0017,'6000','17-MAY-2021','1H2JF97O2JP178227');
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0018,'44060','18-MAY-2021','4L1JF2LV3XP178129');
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0019,'32090','19-MAY-2021','4F5JF47Y7YP179227');
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0020,'10000','20-MAY-2021','127JF37N8XP178227');
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0021,'12900','21-MAY-2021','4H1JF27G9NP171423');
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0022,'13000','24-MAY-2021','141JF27I1JP178327');
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0023,'172000','24-MAY-2021','1T6JF47U52P176721');
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0024,'53000','25-MAY-2021','4F3JF57X3YP171323');
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0025,'22400','26-MAY-2021','1H6JF17Z3SP178121');
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0026,'28020','27-MAY-2021','411JF57H81P178829');
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0027,'11000','28-MAY-2021','444JF24B4JY198127');
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0028,'24300','31-MAY-2021','411JF57H81P178829');
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0029,'152040','01-JUN-2021','1G2JF27A8JG178227');
  
INSERT INTO repairorder (RepairOrdNo,CarOdReading,RepairOrdDate,VIN)
  VALUES (0030,'41000','02-JUN-2021','4H1JF27R9JP188221');
  

INSERT INTO part(PartNo,PartName,PartCost,PartSize)
  VALUES (0001,'Gearbox',25.00,'Item');
  
INSERT INTO part(PartNo,PartName,PartCost,PartSize)
  VALUES (0002,'Tail Light',3.00,'Dozen');
  
INSERT INTO part(PartNo,PartName,PartCost,PartSize)
  VALUES (0003,'Headlight',5.00,'Case');
  
INSERT INTO part(PartNo,PartName,PartCost,PartSize)
  VALUES (0004,'Tire',46.00,'Item');
  
INSERT INTO part(PartNo,PartName,PartCost,PartSize)
  VALUES (0005,'Rotor',16.00,'Item');
  
INSERT INTO part(PartNo,PartName,PartCost,PartSize)
  VALUES (0006,'Radiator Hose',3.00,'Dozen');
  
INSERT INTO part(PartNo,PartName,PartCost,PartSize)
  VALUES (0007,'Radiator',60.00,'Item');
  
INSERT INTO part(PartNo,PartName,PartCost,PartSize)
  VALUES (0008,'Battery',55.00,'Item');
  
INSERT INTO part(PartNo,PartName,PartCost,PartSize)
  VALUES (0009,'Timing Chain',22.99,'Item');
  
INSERT INTO part(PartNo,PartName,PartCost,PartSize)
  VALUES (0010,'Head Gasket',10.00,'Dozen');
  
INSERT INTO part(PartNo,PartName,PartCost,PartSize)
  VALUES (0011,'Tail Pipe',4.00,'Item');
  
INSERT INTO part(PartNo,PartName,PartCost,PartSize)
  VALUES (0012,'Muffler',15.00,'Item');
  
INSERT INTO part(PartNo,PartName,PartCost,PartSize)
  VALUES (0013,'Shock',6.00,'Item');
  
INSERT INTO part(PartNo,PartName,PartCost,PartSize)
  VALUES (0014,'Brake Lining',5.00,'Quart');
  
INSERT INTO part(PartNo,PartName,PartCost,PartSize)
  VALUES (0015,'10W-30 Oil',0.99,'Quart');
  
INSERT INTO part(PartNo,PartName,PartCost,PartSize)
  VALUES (0016,'Transmission Fluid',1.50,'Quart');
  
INSERT INTO part(PartNo,PartName,PartCost,PartSize)
  VALUES (0017,'Spark Plugs',0.99,'Item');
  
INSERT INTO part(PartNo,PartName,PartCost,PartSize)
  VALUES (0018,'Antifreeze',3.95,'Quart');
  
INSERT INTO part(PartNo,PartName,PartCost,PartSize)
  VALUES (0019,'Oil Filter',2.00,'Item');
  
INSERT INTO part(PartNo,PartName,PartCost,PartSize)
  VALUES (0020,'10W-40 Oil',1.00,'Quart');
  
  
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0001,0002,1);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0001,0003,4);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0002,0003,1);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0002,0004,5);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0003,0002,1);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0004,0003,2);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0004,0004,2);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0004,0020,2);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0005,0005,5);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0005,0006,5);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0006,0007,1);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0006,0008,2);

INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0007,0001,2);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0008,0001,4);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0008,0002,1);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0008,0003,1);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0008,0004,1);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0009,0009,1);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0009,0010,4);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0010,0004,4);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0011,0003,2);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0011,0004,1);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0012,0001,4);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0013,0007,1);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0013,0008,1);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0014,0003,6);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0014,0014,1);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0015,0013,1);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0015,0011,3);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0016,0009,1);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0017,0012,4);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0017,0007,1);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0018,0001,4);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0018,0015,5);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0018,0016,6);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0019,0008,2);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0020,0017,2);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0021,0018,1);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0022,0001,5);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0022,0016,1);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0023,0006,6);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0024,0003,2);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0025,0010,1);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0025,0013,1);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0026,0014,1);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0027,0004,6);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0028,0019,1);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0029,0004,1);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0029,0020,1);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0030,0002,1);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0030,0003,2);
  
INSERT INTO partused (RepairOrdNo,PartNo,QtyUsed)
  VALUES(0030,0006,6);
  
  
INSERT INTO branch(BranchNo,BAddress,BCity,BState,BZipcode,BName)
  VALUES(0111,'1443 S Adelaide St.','Normal','IL','61761','Team Automotive'); 
  
INSERT INTO branch(BranchNo,BAddress,BCity,BState,BZipcode,BName)
  VALUES(0222,'1505 W Springfield Ave.','Champaign','IL','61821','TMS Auto Service');
  
INSERT INTO branch(BranchNo,BAddress,BCity,BState,BZipcode,BName)
  VALUES(0333,'3243 W Farmington Rd.','Urbana','IL','61802','Foster"s Auto Care');


INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0001,0111,30);
  
INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0001,0222,45);
  
INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0001,0333,25);
  
INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0002,0333,10);
  
INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0002,0111,24);
  
INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0003,0222,23);
  
INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0003,0111,25);
  
INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0004,0111,40);
  
INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0004,0333,45);
  
INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0005,0222,33);
  
INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0006,0222,23);
  
 INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0007,0333,21);
  
INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0008,0111,23);
  
INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0009,0111,24);
  
INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0010,0333,15);
  
INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0011,0333,21);
  
INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0012,0111,14);
  
INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0012,0333,27);
  
INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0013,0222,15);
  
INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0014,0222,5);
  
INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0014,0111,7);
  
INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0015,0333,10);
  
INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0016,0222,12);
  
INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0016,0111,15);
  
INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0017,0333,18);
  
INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0018,0333,14);
  
INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0018,0222,12);
  
INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0019,0222,14);
  
INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0019,0333,10);
  
INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0020,0111,11);
  
INSERT INTO inventory (PartNo,BranchNo,QtyOnHand)
  VALUES(0020,0333,16);