--BORRAR ESQUEMA --
drop schema if exists  andrea_brea_rodriguez cascade;

-- CREAR ESQUEMA --

CREATE SCHEMA andrea_brea_rodriguez AUTHORIZATION runrvlkf;

--CREAR UNA TABLAS --

--Tabla grupo empresarial --
CREATE table  andrea_brea_rodriguez.egroup(
	idgroup varchar(10) not NULL, --PK
	company varchar(50) not null,
	constraint egroup_PK primary key (idgroup)
);

--Tabla marcas --
create table andrea_brea_rodriguez.brand(

	idbrand varchar(10) not NULL, --PK
	idgroup varchar(10) not NULL, --FK
	brand_name varchar(20) not null,
	constraint brand_PK primary key (idbrand)
);

-- TABLA MODELO --
create table andrea_brea_rodriguez.model(

	idmodel varchar(10) not NULL, --PK
	idbrand varchar(10) not NULL, --FK
	model_name varchar(20) not null,
	constraint model_PK primary key (idmodel)
);

-- Tabla coche --
create table andrea_brea_rodriguez.cars(

	idcars varchar(10) not null, --PK
	idmodel varchar(10) not null,  --FK
	color varchar(10) not null,
	license varchar(8) not null,
	km integer not null,
	purchase date not null,
	
	constraint cars_PK primary key (idcars)
);

-- Tabla aseguradora --

create table andrea_brea_rodriguez.insurance(
	idinsurance varchar(10) not null, --PK
	idinsuranceNames varchar(20) not null, --FK
	idcars varchar(10) not null, --FK
	policyNumber integer not null,

	constraint insurance_PK primary key (idinsurance)
	);


create table andrea_brea_rodriguez.insuranceNames(
	idinsuranceNames varchar(20) not null, --PK
	insuranceNames varchar(10) not null,
	
	constraint insuranceNames_PK primary key (idinsuranceNames)
	);


create table andrea_brea_rodriguez.inspections(
	idinspections integer not null,
	date_insp date not null, --PK
	idinsuranceNames varchar(20) not null,	-- FK
	idcurrency varchar(10) not null default '00', --FK
	idcars varchar(10) not null, --FK
	km_insp integer not null,
	price integer not null,
	
	constraint inspections_PK primary key (idinspections)
	);

create table andrea_brea_rodriguez.currency(
	idcurrency varchar(10) not null default '00',
	currency varchar(15) not null,
	
	constraint currency_PK primary key (idcurrency)
);


-- DECLARAMOS LAS FK --

--En brand referenciamos a egroup
alter table andrea_brea_rodriguez.brand
	add constraint brand_egroup foreign key (idgroup)
	references andrea_brea_rodriguez.egroup (idgroup);
	
	
--En model referenciamos a brand
alter table andrea_brea_rodriguez.model 
	add constraint model_brand foreign key (idbrand)
	references andrea_brea_rodriguez.brand (idbrand);

--En car referenciamos a model
alter table andrea_brea_rodriguez.cars 
	add constraint cars_model foreign key (idmodel)
	references andrea_brea_rodriguez.model (idmodel);

--En insurance referenciamos a cars
alter table andrea_brea_rodriguez.insurance 
	add constraint insurance_cars foreign key (idcars)
	references andrea_brea_rodriguez.cars (idcars);

--En inspections referenciamos a cars
alter table andrea_brea_rodriguez.inspections 
	add constraint inspections_cars foreign key (idcars)
	references andrea_brea_rodriguez.cars (idcars);

--En currency referenciamos a inspections
alter table andrea_brea_rodriguez.inspections 
	add constraint currency_inspections foreign key (idcurrency)
	references andrea_brea_rodriguez.currency (idcurrency);

--En currency referenciamos a inspections
alter table andrea_brea_rodriguez.insurance 
	add constraint inspections_insuranceNames foreign key (idinsuranceNames)
	references andrea_brea_rodriguez.insuranceNames (idinsuranceNames);


--------SQL-DML--------

--GRUPOS AUTOMOTIVE--

insert into andrea_brea_rodriguez.egroup 
	(idgroup, company)
	VALUES('VW', 'VOLKSWAGEN');

insert into andrea_brea_rodriguez.egroup 
	(idgroup, company)
	VALUES('PSA', 'PEUGEOT-CITROËN');

insert into andrea_brea_rodriguez.egroup 
	(idgroup, company)
	VALUES('MBG', 'DAIMLER');

--MARCAS COCHES

insert into andrea_brea_rodriguez.brand
	(idbrand, idgroup, brand_name)
	VALUES('01A', 'VW', 'SEAT');

insert into andrea_brea_rodriguez.brand
	(idbrand, idgroup, brand_name)
	VALUES('01B', 'VW', 'VOLKSWAGEN');

insert into andrea_brea_rodriguez.brand
	(idbrand, idgroup, brand_name)
	VALUES('01D', 'VW', 'CUPRA');
--
insert into andrea_brea_rodriguez.brand
	(idbrand, idgroup, brand_name)
	VALUES('02A', 'PSA', 'PEUGEOT');

--
insert into andrea_brea_rodriguez.brand
	(idbrand, idgroup, brand_name)
	VALUES('03A', 'MBG', 'MERCEDES');

insert into andrea_brea_rodriguez.brand
	(idbrand, idgroup, brand_name)
	VALUES('03B', 'MBG', 'SMART');

--model
--seat
insert into andrea_brea_rodriguez.model
	(idmodel, idbrand, model_name)
	VALUES('001','01A', 'IBIZA');

insert into andrea_brea_rodriguez.model
	(idmodel, idbrand, model_name)
	VALUES('002','01A', 'LEON');

insert into andrea_brea_rodriguez.model
	(idmodel, idbrand, model_name)
	VALUES('003','01A', 'MII');
--VW
insert into andrea_brea_rodriguez.model
	(idmodel, idbrand, model_name)
	VALUES('004','01B', 'GOLF');

insert into andrea_brea_rodriguez.model
	(idmodel, idbrand, model_name)
	VALUES('005','01D', 'BORN');

insert into andrea_brea_rodriguez.model
	(idmodel, idbrand, model_name)
	VALUES('006','01D', 'FORMENTOR');

insert into andrea_brea_rodriguez.model
	(idmodel, idbrand, model_name)
	VALUES('007','02A', '208');

insert into andrea_brea_rodriguez.model
	(idmodel, idbrand, model_name)
	VALUES('008','02A', '2008');

insert into andrea_brea_rodriguez.model
	(idmodel, idbrand, model_name)
	VALUES('010','03A', 'CLASE A');

insert into andrea_brea_rodriguez.model
	(idmodel, idbrand, model_name)
	VALUES('011','03A', 'CLASE C');

insert into andrea_brea_rodriguez.model
	(idmodel, idbrand, model_name)
	VALUES('012','03B', '#1');


--CARS
insert into andrea_brea_rodriguez.cars
	(idcars,idmodel,color,license,km,purchase)
	VALUES('001','012', 'NEGRO','0000AAA','35202','2018-01-22');

insert into andrea_brea_rodriguez.cars
	(idcars,idmodel,color,license,km,purchase)
	VALUES('002','012', 'AZUL','4485BCC','105000','2016-05-03');

insert into andrea_brea_rodriguez.cars
	(idcars,idmodel,color,license,km,purchase)
	VALUES('003','011', 'NEGRO','1234LMV','10000','2020-05-13');

insert into andrea_brea_rodriguez.cars
	(idcars,idmodel,color,license,km,purchase)
	VALUES('004','010', 'BLANCO','5678JZM','1000','2022-06-05');

insert into andrea_brea_rodriguez.cars
	(idcars,idmodel,color,license,km,purchase)
	VALUES('005','008', 'MARRON','1111JXM','200000','2018-10-05');

insert into andrea_brea_rodriguez.cars
	(idcars,idmodel,color,license,km,purchase)
	VALUES('006','008', 'NEGRO','2222RXM','5000','2019-11-15');

insert into andrea_brea_rodriguez.cars
	(idcars,idmodel,color,license,km,purchase)
	VALUES('007','007', 'NEGRO','2242RXM','10000','2010-03-20');

insert into andrea_brea_rodriguez.cars
	(idcars,idmodel,color,license,km,purchase)
	VALUES('008','006', 'GRIS','9875LLL','10500','2020-03-20');

insert into andrea_brea_rodriguez.cars
	(idcars,idmodel,color,license,km,purchase)
	VALUES('009','005', 'GRIS','9875LTL','1500','2022-06-28');
	
insert into andrea_brea_rodriguez.cars
	(idcars,idmodel,color,license,km,purchase)
	VALUES('011','003', 'NEGRO','0520JYL','103000','2019-04-07');
	
insert into andrea_brea_rodriguez.cars
	(idcars,idmodel,color,license,km,purchase)
	VALUES('012','003', 'NEGRO','0526JYL','105050','2019-04-08');
	
insert into andrea_brea_rodriguez.cars
	(idcars,idmodel,color,license,km,purchase)
	VALUES('013','002', 'BLANCO','9516JYX','168000','2017-02-01');
	
insert into andrea_brea_rodriguez.cars
	(idcars,idmodel,color,license,km,purchase)
	VALUES('014','001', 'NEGRO','4762FMV','205235','2008-02-26');
	
insert into andrea_brea_rodriguez.cars
	(idcars,idmodel,color,license,km,purchase)
	VALUES('015','001', 'BLANCO','4763KMV','20535','2018-09-25');
	
insert into andrea_brea_rodriguez.cars
	(idcars,idmodel,color,license,km,purchase)
	VALUES('016','001', 'NEGRO','5662FMV','20523','2017-05-09');
	


insert into andrea_brea_rodriguez.insuranceNames
	(idinsuranceNames, insuranceNames)
	VALUES('M', 'MAPFRE');

insert into andrea_brea_rodriguez.insuranceNames
	(idinsuranceNames, insuranceNames)
	VALUES('A', 'AXA');


insert into andrea_brea_rodriguez.insurance
	(idinsurance, idinsuranceNames, idcars, policyNumber)
	VALUES('AA','M','016','012345');
insert into andrea_brea_rodriguez.insurance
	(idinsurance, idinsuranceNames, idcars, policyNumber)
	VALUES('AB','M','015','125623');
insert into andrea_brea_rodriguez.insurance
	(idinsurance, idinsuranceNames, idcars, policyNumber)
	VALUES('AC','M','014','598265');
insert into andrea_brea_rodriguez.insurance
	(idinsurance, idinsuranceNames, idcars, policyNumber)
	VALUES('AD','M','013','785690');
insert into andrea_brea_rodriguez.insurance
	(idinsurance, idinsuranceNames, idcars, policyNumber)
	VALUES('AE','M','012','526584');
insert into andrea_brea_rodriguez.insurance
	(idinsurance, idinsuranceNames, idcars, policyNumber)
	VALUES('AF','M','011','598629');
insert into andrea_brea_rodriguez.insurance
	(idinsurance, idinsuranceNames, idcars, policyNumber)
	VALUES('AG','M','009','500012');
insert into andrea_brea_rodriguez.insurance
	(idinsurance, idinsuranceNames, idcars, policyNumber)
	VALUES('AH','A','008','623598');
insert into andrea_brea_rodriguez.insurance
	(idinsurance, idinsuranceNames, idcars, policyNumber)
	VALUES('AI','A','007','526859');
insert into andrea_brea_rodriguez.insurance
	(idinsurance, idinsuranceNames, idcars, policyNumber)
	VALUES('AJ','A','006','526985');
insert into andrea_brea_rodriguez.insurance
	(idinsurance, idinsuranceNames, idcars, policyNumber)
	VALUES('AK','A','005','526042');
insert into andrea_brea_rodriguez.insurance
	(idinsurance, idinsuranceNames, idcars, policyNumber)
	VALUES('AL','A','004','002222');
insert into andrea_brea_rodriguez.insurance
	(idinsurance, idinsuranceNames, idcars, policyNumber)
	VALUES('AM','A','003','652722');
insert into andrea_brea_rodriguez.insurance
	(idinsurance, idinsuranceNames, idcars, policyNumber)
	VALUES('AN','A','002','598122');
insert into andrea_brea_rodriguez.insurance
	(idinsurance, idinsuranceNames, idcars, policyNumber)
	VALUES('AO','A','001','012325');

--CURRENCY
insert into andrea_brea_rodriguez.currency
	(idcurrency, currency)
	VALUES('EUR', 'EURO');

insert into andrea_brea_rodriguez.currency
	(idcurrency, currency)
	VALUES('GBP', 'LIBRA ESTERLINA');
	

--INSPECTIONS
insert into andrea_brea_rodriguez.inspections
	(idinspections,date_insp, idinsuranceNames, idcurrency, idcars, km_insp, price)
	VALUES('0001','2022-10-01','M','EUR','016','15000','100');
insert into andrea_brea_rodriguez.inspections
	(idinspections, date_insp, idinsuranceNames, idcurrency, idcars, km_insp, price)
	VALUES('0002','2021-10-01','M','EUR','016','10000','100');
insert into andrea_brea_rodriguez.inspections
	(idinspections, date_insp, idinsuranceNames, idcurrency, idcars, km_insp, price)
	VALUES('0003','2020-10-02','M','EUR','016','15000','100');
insert into andrea_brea_rodriguez.inspections
	(idinspections,date_insp, idinsuranceNames, idcurrency, idcars, km_insp, price)
	VALUES('0004','2022-09-01','A','EUR','015','150000','150');
insert into andrea_brea_rodriguez.inspections
	(idinspections,date_insp, idinsuranceNames, idcurrency, idcars, km_insp, price)
	VALUES('0005','2020-05-01','M','GBP','015','150000','10');
insert into andrea_brea_rodriguez.inspections
	(idinspections,date_insp, idinsuranceNames, idcurrency, idcars, km_insp, price)
	VALUES('0006','2020-07-01','A','EUR','014','20000','1000');
insert into andrea_brea_rodriguez.inspections
	(idinspections,date_insp, idinsuranceNames, idcurrency, idcars, km_insp, price)
	VALUES('0007','2020-01-08','A','EUR','014','1000','1000');
insert into andrea_brea_rodriguez.inspections
	(idinspections,date_insp, idinsuranceNames, idcurrency, idcars, km_insp, price)
	VALUES('0008','2022-10-01','M','EUR','013','15000','100');
insert into andrea_brea_rodriguez.inspections
	(idinspections,date_insp, idinsuranceNames, idcurrency, idcars, km_insp, price)
	VALUES('0009','2020-01-10','M','EUR','011','20000','50');
insert into andrea_brea_rodriguez.inspections
	(idinspections,date_insp, idinsuranceNames, idcurrency, idcars, km_insp, price)
	VALUES('0010','2015-03-01','A','EUR','009','15000','200');
insert into andrea_brea_rodriguez.inspections
	(idinspections,date_insp, idinsuranceNames, idcurrency, idcars, km_insp, price)
	VALUES('0011','2019-06-05','M','EUR','008','1500','125');


