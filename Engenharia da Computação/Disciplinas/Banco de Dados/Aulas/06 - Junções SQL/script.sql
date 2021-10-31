-- Exemplo código de junção da apresentação
-- Comandos DDL - Data Definition Language
-- Criação da Base de Dados
DROP DATABASE IF EXISTS dbfuncionarios;
CREATE DATABASE dbfuncionarios;
USE dbfuncionarios;

--Criação das tabelas
CREATE TABLE funcionarios(
    cod INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(64),
    especialidade varchar(64)
);

CREATE TABLE dependentes(
    cod INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(64),
    cod_func INTEGER,
    CONSTRAINT fk_funcionario_dependente FOREIGN KEY (cod_func) REFERENCES funcionarios(cod) on UPDATE CASCADE
);


-- Comandos DML - Data Manipulation Language
INSERT INTO funcionarios VALUES
    (DEFAULT, 'JOSÉ','ENGENHEIRO'),
    (DEFAULT, 'JOÃO','MESTRE DE OBRAS'),
    (DEFAULT, 'MARIA','CONTABILISTA');

INSERT INTO dependentes VALUES
    (DEFAULT, 'PEDRO', 1),
    (DEFAULT, 'ALICE', 1),
    (DEFAULT, 'LUANA', 3),
    (DEFAULT, 'PAULO', NULL);


-- Junção Produto Cartesiano
SELECT f.nome nome_func, d.nome nome_dep
    FROM funcionarios f, dependentes d;

SELECT f.nome AS nome_func, d.nome AS nome_dep
    FROM funcionarios AS f, dependentes AS d; 

SELECT f.nome nome_func, d.nome nome_dep
    FROM funcionarios f, dependentes d
    WHERE f.cod = d.cod_func;       

-- Junção Interna

SELECT f.nome nome_func, d.nome nome_dep
    FROM funcionarios f INNER JOIN dependentes d 
        ON f.cod = d.cod_func;      

-- Junção Externa
-- Left
SELECT f.nome nome_func, d.nome nome_dep
    FROM funcionarios f LEFT OUTER JOIN dependentes d 
        ON f.cod = d.cod_func;      

SELECT f.nome nome_func, d.nome nome_dep
    FROM funcionarios f LEFT JOIN dependentes d 
        ON f.cod = d.cod_func;    

-- Right

SELECT f.nome nome_func, d.nome nome_dep
    FROM funcionarios f RIGHT OUTER JOIN dependentes d 
        ON f.cod = d.cod_func;      

SELECT f.nome nome_func, d.nome nome_dep
    FROM funcionarios f RIGHT JOIN dependentes d 
        ON f.cod = d.cod_func; 

