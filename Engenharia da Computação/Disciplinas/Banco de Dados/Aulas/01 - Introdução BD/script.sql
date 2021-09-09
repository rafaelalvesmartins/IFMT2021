-- Meu primeiro script de BD
-- msql -u root -p
show databases; -- Mostrar os banco de dados
drop database dbIFMT; -- Apagar BD
create database  dbIFMT; -- Criar o BD
use dbIFMT; -- Utilizar o BD

create table Aluno(
    id int not null auto_increment primary key,
    nome varchar(32) not null,
    telefone varchar(14) not null
       );

create table Cidade(
    id int not null auto_increment primary key,
    nome varchar(32) not null,
    estado varchar(2) not null
       );

show tables; -- Mostra as tabelas do BD
insert into Aluno(id, nome, telefone)
 values(1, 'João', '19971578276'); -- Inserir registros na tabela
select * from Aluno;

insert into Aluno values (2, 'Maria', '6299194486');
insert into Aluno values (default, 'Pedro', '6299194486');

select * from Aluno; --Consulta a tabela Aluno