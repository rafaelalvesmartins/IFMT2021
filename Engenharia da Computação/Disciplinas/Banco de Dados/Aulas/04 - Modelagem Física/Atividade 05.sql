-- Modelagem Física

-- Criar DB
drop database if exists seguradora;
create database seguradora;
use seguradora;

-- Criação das tabelas
create table clientes(
    id integer not null auto_increment primary key,
    nome varchar(64) not null,
    conjuge varchar(64),
    created_at datetime not null,
    updated_at datetime not null,
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
    constraint fk_apolice foreign key (apolice_id) references apolices(id) 
);

create table carros(
    id integer not null primary key auto_increment,
    cliente_id integer not null,
    apolice_id integer,
    modelo varchar(32) not null,
    marca varchar(32) not null,
    created_at datetime not null,
    updated_at datetime,
    constraint fk_cliente_carro foreign key (cliente_id) references clientes(id),
    constraint fk_apolice_carro foreign key (apolice_id) references apolices(id)
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

-- Deletar tabela

drop table if exists carros_acidentes;


create table carros_acidentes(
    carro_id integer not null,
    acidente_id integer not null,
    constraint pk_carro_id_acidente_id primary key (carro_id,acidente_id),
    constraint fk_acidente_carro foreign key (acidente_id) references acidentes(id) on delete cascade on update cascade,
    constraint fk_carrro_acidente foreign key (carro_id) references carros(id) on delete cascade on update cascade
);

alter table carros_acidentes
    add descricao_carro_acidente varchar(256) not null default 'sem descricao',
    add valor_acidente numeric(8,2) null,
    add apolice_id integer null ,
    add constraint fk_apolices_carros_acidente foreign key (apolice_id) references apolices(id)
;

describe carros_acidentes;

-- Pode ser feito apenas um alter por vez;
alter table carros_acidentes
    modify descricao_carro_acidente varchar(64);

alter table carros_acidentes
    add pessoas_dentro_carro integer default 1,
    drop valor_acidente,
    drop apolice_id,
    drop constraint fk_apolices_carros_acidente;