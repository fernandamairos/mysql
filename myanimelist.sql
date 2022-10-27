CREATE DATABASE animes;
USE animes;
CREATE TABLE animes_assistidos (id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, nome VARCHAR (255) NOT NULL, num_episodios INT NOT NULL);
ALTER TABLE animes_assistidos ADD COLUMN score DOUBLE;
ALTER TABLE animes_assistidos RENAME COLUMN nome TO name;
ALTER TABLE animes_assistidos RENAME COLUMN num_episodios TO episodes;
RENAME TABLE animes_assistidos TO my_anime_list;
ALTER TABLE my_anime_list ADD COLUMN year YEAR; 
INSERT INTO my_anime_list (name, episodes, year, score) VALUES ('Asobi Asobase', 12, 2018, 8.19);
SELECT * FROM my_anime_list;
DELETE FROM my_anime_list WHERE id = 6;
USE animes;
INSERT INTO my_anime_list (id, name, episodes, year, score) VALUES (1, 'Asobi Asobase', 12, 2018, 8.19);
INSERT INTO my_anime_list (name, episodes, year, score) VALUES ('Beastars', 12, 2019, 7.87);
ALTER TABLE my_anime_list AUTO_INCREMENT = 1;
INSERT INTO my_anime_list (name, episodes, year, score) VALUES ('Zero no Tsukaima: Futatsuki no Kishi', 12, 2007, 7.42);
CREATE TABLE my_anime_list_backup AS SELECT * FROM my_anime_list;
DROP TABLE my_manga_list;
CREATE TABLE my_manga_list (manga_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, name VARCHAR (255) NOT NULL, volumes INT NOT NULL, when_1st_published DATE NOT NULL, FOREIGN KEY (manga_id) REFERENCES my_anime_list (id));
USE animes;
INSERT INTO my_manga_list (manga_id, name, volumes, when_1st_published) VALUES (1, 'Asobi Asobase', 0, 20150626);
SELECT * FROM my_manga_list;
INSERT INTO my_manga_list (name, volumes, when_1st_published) VALUES ('Beastars', 22, 20160908);
INSERT INTO my_manga_list (name, volumes, when_1st_published) VALUES ('Death Note', 12, 20031201);
SELECT * FROM my_anime_list_backup;
CREATE TABLE my_manga_list_backup AS SELECT * FROM my_manga_list;
SELECT id, name AS name_anime FROM my_anime_list;

SELECT anime.id, anime.name AS name_anime, manga.name AS name_manga 
FROM my_anime_list AS anime
LEFT JOIN my_manga_list AS manga
ON anime.id = manga.manga_id;

SELECT SUM(episodes) AS soma_episodios FROM my_anime_list;

CREATE TABLE manga_price (id INT PRIMARY KEY NOT NULL AUTO_INCREMENT, name VARCHAR (255) NOT NULL, volume INT NOT NULL, price DOUBLE NOT NULL);
INSERT INTO manga_price (name, volume, price) VALUES ('Asobi Asobase', 1, 12.90);
SELECT * FROM manga_price;
INSERT INTO manga_price (name, volume, price) VALUES ('Death Note', 1, 10.90);
SELECT * FROM my_manga_list;

SELECT name, SUM(price), AVG(price) FROM manga_price GROUP BY name;
SELECT name, SUM(price) AS total, AVG(price) AS average FROM manga_price GROUP BY name;
SELECT name, SUM(price) total, AVG(price) average FROM manga_price GROUP BY name;

CREATE VIEW view_animes AS SELECT * FROM my_anime_list;
SELECT * FROM view_animes;

SELECT * FROM manga_price;

DELIMITER |
CREATE PROCEDURE new_price ()
BEGIN
	UPDATE manga_price SET price = price * 1.1;
END
| DELIMITER ;

CALL new_price;