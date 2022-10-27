CREATE DATABASE test;
DROP DATABASE sys;
USE test;
CREATE TABLE um (id INT, nome VARCHAR (200), idade INT);
INSERT INTO um (id) VALUES (1);
INSERT INTO um (id) VALUES (2);
INSERT INTO um (id) VALUES (3);

INSERT INTO um (id, nome, idade) VALUES (4, 'Daniel', 31);
SELECT * FROM um;
UPDATE um SET nome = 'Ana', idade = 60 WHERE id = 1;
ALTER TABLE um ADD PRIMARY KEY (id);
DROP TABLE um;
CREATE TABLE usuarios (id INT, nome VARCHAR (200), idade INT, data_nascimento DATE);
CREATE TABLE telefones (id INT, tel INT, cel INT);
ALTER TABLE usuarios ADD PRIMARY KEY (id);
ALTER TABLE telefones ADD PRIMARY KEY (id);
ALTER TABLE usuarios ADD COLUMN cpf INT;
INSERT INTO usuarios (id, nome, idade, data_nascimento, cpf) VALUES (1, 'Daniel', 31, '1991-04-08', 00000000000);
INSERT INTO telefones (id, cel) VALUES (1, 123456789);
INSERT INTO telefones (id, cel) VALUES (1, 987654321);
ALTER TABLE telefones DROP PRIMARY KEY;
SELECT * FROM usuarios;
SELECT * FROM telefones;
SELECT * FROM usuarios AS a LEFT JOIN telefones AS b ON a.id = b.id;
SELECT id, nome FROM usuarios; /* oi */
SELECT a.id, a.nome, b.tel FROM usuarios AS a LEFT JOIN telefones AS b ON a.id = b.id;
CREATE TABLE usuarios_backup AS SELECT * FROM usuarios;
CREATE TABLE telefones_backup AS SELECT * FROM telefones; 