-- Comandos DDL
drop database if exists dbJoin01;
create database dbJoin01;
use dbJoin01;

-- Criação das tabelas
-- Tabelas fortes
create table Ramo_Atividade(
    cd_ramo INTEGER primary key auto_increment not null,
    ds_ramo varchar(32) not null
);

create table Tipo_Assinante(
    cd_tipo INTEGER primary key auto_increment not null,
    ds_tipo varchar(32) not null
);

create table Municipio(
    cd_municipio INTEGER primary key auto_increment not null,
    ds_municipio varchar(32)
);

-- Tabelas fracas
create table Assinante(
    cd_assinante INTEGER PRIMARY key auto_increment not null,
    nm_assinante varchar(64) not null,
    cd_ramo INTEGER not null,
    cd_tipo INTEGER not null,
    constraint fk_ramo FOREIGN key (cd_ramo) references Ramo_Atividade(cd_ramo) on delete cascade on update cascade,
    constraint fk_tipo foreign key (cd_tipo) references Tipo_Assinante (cd_tipo) on delete cascade on update cascade
);

create table Endereco(
    cd_endereco integer primary key auto_increment not null,
    ds_endereco varchar(128) not null,
    complemento varchar(128) not null,
    bairro varchar(64) not null,
    CEP varchar(16) not null,
    cd_municipio INTEGER not null,
    cd_assinante INTEGER not null,
    CONSTRAINT fk_municipio foreign key (cd_municipio) references Municipio (cd_municipio) on delete cascade on update cascade,
    CONSTRAINT fk_assinante foreign key (cd_assinante) references Assinante (cd_assinante ) on delete cascade on update cascade
);

create table Telefone(
    cd_fone INTEGER primary key auto_increment not null,
    ddd INTEGER(3) not NULL,
    n_fone varchar(16) not null,
    cd_endereco INTEGER not null,
    constraint fk_endereco foreign key (cd_endereco) references Endereco(cd_endereco) on update cascade on delete cascade
);


-- Comandos DML
insert into Ramo_Atividade values (default, 'Educação'),
    (default,'Industria');

insert into Tipo_Assinante values(default, 'Padrão'),
    (default, 'Avançado'),
    (default, 'Comercial');   

insert into Municipio values(default, 'Hortolândia'),
    (default, 'Pouso Alegre'),
    (default, 'Pelotas');

insert into Assinante values(default, 'Rafael', 1, 1),
    (default, 'Bruno', 2,3);    

insert into Endereco values(default, "Rua Rio de Janeiro", "Perto do Mercado", "Tijuca", "13520-135", 2, 1),  
    (default, "Rua Vicente", "Residencial", "Tijuca", "13520-135", 3, 1),   
    (default, "Av Atlantida", "Perdo da Padaria", "Nossa Senhora do Carmo", "8513-710", 1, 2);

insert into Telefone values(default,035,"97158-7858",1),
    (default, 035,"3422-6508",1),
    (default, 019,"9857-8596",1),
    (default, 019,"3421-8956",3);

-- a


-- b


-- C


-- d


-- e



