DROP DATABASE IF EXISTS bookdb;
CREATE DATABASE IF NOT EXISTS bookdb;

USE bookdb;

CREATE TABLE book (
  id INTEGER PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(500) NOT NULL,
  synopsis TEXT,
  date_released DATE,
  is_series BOOLEAN,
  number_in_series SMALLINT,
  series_complete BOOLEAN,
  image_url VARCHAR(2000)
);

DROP USER IF EXISTS reader@localhost;
CREATE USER IF NOT EXISTS reader@localhost IDENTIFIED BY 'reader';
GRANT SELECT,INSERT,UPDATE,DELETE ON bookdb.* TO reader@localhost;

INSERT INTO book (id, name) VALUES (1, 'He Who Fights With Monsters');
INSERT INTO book (id, name) VALUES (2, 'Eye of the World');
INSERT INTO book (id, name) VALUES (3, 'The Way of Kings');