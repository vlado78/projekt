drop database if exists autoservis;

create database autoservis default character set utf8;

use autoservis;

create table radionica(
sifra int primary key not null auto_increment,
naziv varchar (20),
datum_osnutka datetime

);

create table zaposlenik(
sifra int primary key  not null auto_increment,
ime varchar(20) not null,
prezime varchar(20) not null,
ulica_i_broj varchar (50) ,
mjesto varchar (20) ,
broj_mobitela varchar(20) ,
email varchar (20) ,
datum_rođenja datetime ,
datum_pocetka_rada datetime not null ,
oib varchar (11) ,
broj_ugovora varchar(20) not null,
nadredjeni int ,
radionica int ,
radni_nalog int,
napomena varchar (200)

);

create table radni_nalog (
sifra int primary key not null auto_increment,
radionica int not null,
zaposlenik int not null,
vozilo int not null,
kilometraza decimal (10,1),
opis_kvara varchar (200),
datum_pocetka datetime,
datum_zavrsetka datetime,
napomena varchar (200)

);

create table zaposlenik_radni_nalog (
zaposlenik int not null,
radni_nalog int not null

);

create table vozilo(
sifra int not null primary key auto_increment,
broj_sasije varchar(20) not null,
vlasnik int not null,
datum_prve_registracije datetime,
registarska_oznaka varchar (20),
marka_vozila varchar (20),
oznaka_modela varchar (20),
napomena varchar (200)

);

create table vlasnik(
sifra int primary key not null auto_increment,
ime varchar(20) not null,
prezime varchar(20) not null,
ulica_i_broj varchar (50) ,
mjesto varchar (20) ,
broj_mobitela varchar(20) ,
email varchar (20) ,
datum_rođenja datetime ,
oib varchar (11) ,
napomena varchar (200)

);


alter table zaposlenik add foreign key (radionica) references radionica(sifra);

alter table radni_nalog add foreign key (radionica) references radionica(sifra);
alter table radni_nalog add foreign key (vozilo) references vozilo(sifra);

alter table zaposlenik_radni_nalog add foreign key (zaposlenik) references zaposlenik(sifra);
alter table zaposlenik_radni_nalog add foreign key (radni_nalog) references radni_nalog(sifra);

alter table vozilo add foreign key (vlasnik) references vlasnik(sifra);

alter table zaposlenik add foreign key (nadredjeni) references zaposlenik(sifra);



insert into radionica (sifra,naziv,datum_osnutka) values
(null,'mehanika','2008-04-16'),
(null,'elektrika','2008-04-16'),
(null,'limarija','2008-04-16');

insert into zaposlenik (sifra,ime,prezime,ulica_i_broj,mjesto,broj_mobitela,email,datum_rođenja,datum_pocetka_rada,oib,broj_ugovora) values
(null,'Ivica','Ivić','Jadranska ulica 5','Vinkovci','098111111','ivicaivic@gmail.com','1964-5-25','2008-04-16','12345678901','1'),
(null,'Marko','Marić','Savska ulica 5','Vinkovci','098111112','markomaric@gmail.com','1969-3-2','2008-04-16','12345678902','2'),
(null,'Tomislav','Tomić','Dravska ulica 14','Osijek','098111113','tomislav@gmail.com','1978-11-04','2008-04-16','12345678903','3'),
(null,'Ivan','Ivić','Zadarska ulica 14','Osijek','098111114','ivica@gmail.com','1987-12-25','2008-04-26','12345678904','4'),
(null,'Andrija','Hebrang','Hebrangova ulica 14','Ilok','098111115','hebrang@gmail.com','1988-01-01','2008-04-26','12345678905','5'),
(null,'Josip','Jozić','Strossmayerova ulica 25','Tovarnik','098111116','joza@gmail.com','1975-01-18','2008-04-26','12345678906','6'),
(null,'Krešo','Jozić','Strossmayerova ulica 27','Tovarnik','098111117','kreso@gmail.com','1977-06-18','2008-04-26','12345678907','7'),
(null,'Karolina','Antolović','Josipa Broza Tita 25','Osijek','098111118','Karolina@gmail.com','1998-05-25','2010-08-06','12345678908','8'),
(null,'Antonela','Harambaša','Vinkovačka ulica 1','Osijek','098111119','a1997@gmail.com','1997-04-20','2018-08-06','12345678909','9');


insert into vlasnik (sifra,ime,prezime,ulica_i_broj,mjesto,broj_mobitela,email,oib) values
(null,'Robert','Marjanović','Kneza Branimira 78','Osijek','091123654789','robi@yahoo.com','22556633221'),
(null,'Alen','Marković','25.svibnja 5' ,'Osijek','091225545554','alen@yahoo.com','25454569874'),
(null,'Ivan','Kobalt','J.J. Strossmayera 34' ,'Osijek','095123456','ivan123@gmail.com','85698541254'),
(null,'Boris','Jozinović','Iločka ulica 5' ,'Osijek','0985632541','boris@gmail.com','98563258745'),
(null,'Ivan','Jnaković','Zapadna ulica 56' ,'Osijek','09325412','zapadni@gmail.com','25874569654'),
(null,'Mario','Kazanović','Istočna ulica 5' ,'Osijek','0985647777','marac@gmail.com','25636666954'),
(null,'Ivan','Kotromanović','Gajeva 5' ,'Bilje','098565656','birtija@gmail.com','22846575251'),
(null,'James','Bond','Baruna Trenka 1','Osijek','0981111120','007@gmail.com','12345678910'),
(null,'Hercul','Stević','Sarajevska ulica 34','Osijek','0981111121','sarajlija@gmail.com','12345678910');












