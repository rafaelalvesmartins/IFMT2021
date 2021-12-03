-- Criar DB
DROP DATABASE IF EXISTS bd_compra;
CREATE DATABASE bd_compra;
USE bd_compra;

-- Criação das tabelas
CREATE TABLE PRODUTO(
    id INT  AUTO_INCREMENT NOT NULL PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    quantidade_em_estoque INT
);

CREATE TABLE compra(
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY ,
    data DATE NOT NULL,
    produto_id INT NOT NULL,
    quantidade INT NOT NULL,
    FOREIGN KEY (produto_id) REFERENCES produto(id)
);

-- Inserções nas tabelas

INSERT INTO produto VALUES(DEFAULT, 'Mouse', 10);
INSERT INTO produto VALUES(DEFAULT, 'Teclado', 20);


-- TRIGGER
 -- Insert
DELIMITER $
CREATE TRIGGER atualizar_estoque_insert 
    AFTER INSERT ON compra
        FOR EACH ROW
        BEGIN
            UPDATE produto 
                SET quantidade_em_estoque = quantidade_em_estoque + NEW.quantidade 
                where id = NEW.produto_id;
        END$
DELIMITER ;


INSERT INTO compra VALUES(DEFAULT, '2021-11-24',1, 5);

-- Update
DELIMITER &
CREATE TRIGGER atualizar_estoque_update 
    AFTER UPDATE on compra
        FOR EACH ROW
        BEGIN
            -- UPDATE
            UPDATE produto 
                SET quantidade_em_estoque = quantidade_em_estoque - OLD.quantidade + NEW.quantidade
                WHERE id = NEW.produto_id;
        END&
DELIMITER ;
    
    
UPDATE compra SET quantidade = 4 WHERE id = 1;

-- Trigger delete
DELIMITER //
CREATE TRIGGER atualizar_estoque_delete
    AFTER DELETE ON compra
        FOR EACH ROW
        BEGIN
            UPDATE produto 
                SET quantidade_em_estoque = quantidade_em_estoque - OLD.quantidade
                WHERE id = OLD.produto_id;
        END//
DELIMITER ;

DELETE FROM compra where id = 1;


