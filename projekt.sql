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
(null,'mehanika','2018-04-16'),
(null,'elektrika','2018-04-16'),
(null,'limarija','2018-04-16');

insert into zaposlenik (sifra,ime,prezime,ulica_i_broj,mjesto,broj_mobitela,email,datum_rođenja,datum_pocetka_rada,oib,broj_ugovora) values
(null,'Ivica','Ivić','Jadranska ulica 5','Vinkovci','098111111','ivicaivic@gmail.com','1964-5-25','2018-04-16','12345678901','1');









