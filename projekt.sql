drop database if exists autoservis;

create database autoservis default character set utf8;

use autoservis;

create table radionica(
sifra int primary key not null auto_increment,
naziv varchar (20),
datumosnutka datetime

);

create table zaposlenik(
sifra int primary key  not null auto_increment,
ime varchar(20) not null,
prezime varchar(20) not null,
ulicaibroj varchar (50) ,
mjesto varchar (20) ,
brojmobitela varchar(20) ,
email varchar (20) ,
datum_rođenja datetime ,
datumpocetkarada datetime not null ,
oib varchar (11) ,
brojugovora varchar(20) not null,
nadredjeni int not null,
radionica int ,
radninalog int,
napomena varchar (200)

);

create table radninalog (
sifra int primary key not null auto_increment,
radionica int not null,
zaposlenik int not null,
vozilo int not null,
kilometraza decimal (10,1),
opiskvara varchar (200),
datumpocetka datetime,
datumzavrsetka datetime,
napomena varchar (200)

);

create table zaposlenikradninalog (
zaposlenik int not null,
radninalog int not null

);

create table vozilo(
sifra int not null primary key auto_increment,
brojsasije varchar(20) not null,
vlasnik int not null,
datumprveregistracije datetime,
registarskaoznaka varchar (20),
markavozila varchar (20),
oznakamodela varchar (20),
napomena varchar (200)

);

create table vlasnik(
sifra int primary key not null auto_increment,
ime varchar(20) not null,
prezime varchar(20) not null,
ulicaibroj varchar (50) ,
mjesto varchar (20) ,
brojmobitela varchar(20) ,
email varchar (20) ,
datum_rođenja datetime ,
oib varchar (11) ,
napomena varchar (200)

);


alter table zaposlenik add foreign key (radionica) references radionica(sifra);

alter table radninalog add foreign key (radionica) references radionica(sifra);
alter table radninalog add foreign key (vozilo) references vozilo(sifra);

alter table zaposlenikradninalog add foreign key (zaposlenik) references zaposlenik(sifra);
alter table zaposlenikradninalog add foreign key (radninalog) references radninalog(sifra);

alter table vozilo add foreign key (vlasnik) references vlasnik(sifra);

alter table zaposlenik add foreign key (nadredjeni) references zaposlenik(sifra);



insert into radionica (sifra,naziv,datumosnutka) values
(null,'mehanika','2018-04-16'),
(null,'elektrika','2018-04-16'),
(null,'limarija','2018-04-16');











