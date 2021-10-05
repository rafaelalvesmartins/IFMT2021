-- Modelagem Física

-- Criar DB - DDL - Data Definition Language
drop database if exists seguradora;
create database seguradora;
use seguradora;

-- Criação das tabelas
create table clientes(
    id integer not null auto_increment primary key,
    nome varchar(64) not null,
    conjuge varchar(64),
    created_at datetime not null,
    updated_at datetime null,
    constraint unique_nome unique (nome)
);

create table apolices(
    id integer not null auto_increment primary key,
    validade integer not null,
    created_at datetime not null,
    updated_at datetime
);

create table premios(
    id integer primary key auto_increment,
    apolice_id integer not null,
    data_pagamento date,
    data_vecimento date not null,
    created_at datetime not null,
    updated_at datetime,
    constraint fk_apolice foreign key (apolice_id) references apolices(id) on delete cascade on update cascade
);

create table carros(
    id integer not null primary key auto_increment,
    cliente_id integer not null,
    apolice_id integer,
    modelo varchar(32) not null,
    marca varchar(32) not null,
    created_at datetime not null,
    updated_at datetime,
    constraint fk_cliente_carro foreign key (cliente_id) references clientes(id) on delete cascade on update cascade,
    constraint fk_apolice_carro foreign key (apolice_id) references apolices(id) on delete cascade on update cascade
);

create table acidentes(
    id integer not null  primary key auto_increment,
    local_acidente varchar(64) default 'sem local' not null,
    created_at datetime not null,
    updated_at datetime
);

create table carros_acidentes(
    carro_id integer not null,
    acidente_id integer not null,
    constraint pk_carro_id_acidente_id primary key (carro_id,acidente_id),
    constraint fk_acidente_carro foreign key (acidente_id) references acidentes(id) on delete cascade on update cascade,
    constraint fk_carrro_acidente foreign key (carro_id) references carros(id) on delete cascade on update cascade
);

-- Data Manipulation Language - DML
INSERT INTO clientes (id, nome, conjuge, created_at, updated_at) VALUES(DEFAULT, 'Rafael', NULL, '2021-10-05 10:09', NULL);
INSERT INTO clientes values(DEFAULT, 'Rodrigo', 'Maria', '2021-09-05 10:09:13', NULL);
INSERT INTO clientes values(DEFAULT, 'Leonardo', 'Joana', '2021-09-05 10:09:13', NULL);
DELETE FROM clientes where nome = 'Leonardo';
UPDATE clientes SET nome = 'Rafael M Alves', conjuge = 'Waldirene' where nome = 'Rafael';


INSERT INTO apolices VALUES 
    (DEFAULT, 2, '2021-10-05 10:09', NULL), 
    (DEFAULT, 1, '2021-09-05 10:09', NULL);


INSERT INTO premios VALUES
    (DEFAULT, 1, '2021-10-01', '2021-10-01', '2021-10-05 10:09:45', NULL),
    (DEFAULT, 2, '2021-09-01', '2021-09-01', '2021-09-05 10:09:51', NULL);

INSERT INTO carros VALUES
    (DEFAULT, 1, 1, 'Polo', 'VW', '2021-10-05 10:09:45', NULL),
    (DEFAULT, 2, 2, 'Palio', 'Fiat', '2020-10-05 10:09:45', NULL),
    (DEFAULT, 2, 2, 'Uno', 'Fiat', '2021-10-05 10:09:45', NULL);

INSERT INTO acidentes VALUES
    (DEFAULT, 'Jaguariúna - SP, condomínio Águas Verdes', '2021-10-05 10:09:45', NULL); 

INSERT INTO carros_acidentes VALUES
    (1, 1),
    (2, 1);


-- DML - consultas SQL 
SELECT * FROM clientes;
SELECT id, nome FROM clientes;

SELECT * FROM carros where marca = 'Fiat';
SELECT cliente_id, modelo FROM carros where UPPER(marca) = 'FIAT';
SELECT cliente_id, modelo FROM carros where UPPER(marca) = 'FIAT' and created_at > '2021-01-01';
SELECT cliente_id, modelo FROM carros where UPPER(marca) = 'FIAT' and created_at > '2021-01-01';