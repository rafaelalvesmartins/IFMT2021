-- Comandos DDL
drop database if exists dbJoin02;
create database dbJoin02;
use dbJoin02;

-- Criação das tabelas
CREATE TABLE cliente(
    CPF VARCHAR(20) primary key not null,
    Nome VARCHAR(60) NOT NULL,
    DtNasc DATE
);

CREATE TABLE Modelo(
    CodMod INTEGER PRIMARY KEY auto_increment not null,
    Desc_2 VARCHAR(40) not null
);

CREATE TABLE Patio(
    Num INTEGER primary key auto_increment not null,
    Ender VARCHAR(40) not null,
    Capacidade INTEGER not null
);

CREATE TABLE Veiculo(
    Placa VARCHAR(8) primary key not null,
    Modelo_codMod INTEGER not null,
    Cliente_cpf VARCHAR(20) not null,
    Cor VARCHAR(20) not null,
    constraint fk_CodMod FOREIGN key (Modelo_codMod) references Modelo(CodMod) on delete cascade on update cascade,
    constraint fk_cpf foreign key (Cliente_cpf) references cliente (CPF) on delete cascade on update cascade
);

CREATE TABLE Estaciona(
    cod INTEGER primary key not null auto_increment,
    Patio_num INTEGER not null,
    Veiculo_placa VARCHAR(8) not null,
    DtEntrada VARCHAR(10) not null,
    DtSaida VARCHAR(10) not null,
    HsEbtrada VARCHAR(10) not null,
    HsSaida VARCHAR(10) not null,
    constraint fk_num FOREIGN key (Patio_num) references Patio(Num) on delete cascade on update cascade,
    constraint fk_placa foreign key (Veiculo_placa) references Veiculo (Placa) on delete cascade on update cascade
);

-- Comandos DML
insert into cliente values ('48503989483', 'Bruno', 12-01-1996),
    ('515552514525','Roberto', 01-12-1999);

insert into Modelo values(default, '2000'),
    (default, '1998');   

insert into Patio values(default, 'Rua Vicente', 25),
    (default, 'Av Atlantida' ,25);

insert into Veiculo values('JEG-1010',1 , "48503989483", "Verde"),
    ('QXI-2909',1 , "48503989483", "Verde"),
    ('JJJ-2020',2, '515552514525','Laranja'); 

insert into Estaciona values(default, 1, "JEG-1010", "12/03/2021", "13/03/2021","12h35min", "16h45min"),  
(default, 1, "QXI-2909", "17/05/2021", "20/06/2021","12h35min", "16h45min"),
( default, 2, "JJJ-2020", "04/05/2021", "20/07/2021", "12h35min", "16h45min");

-- a


-- b


-- C


-- d

