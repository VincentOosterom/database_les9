-- =========================
-- DROP TABLES
-- =========================

DROP TABLE IF EXISTS album_artist CASCADE;
DROP TABLE IF EXISTS album_genre CASCADE;
DROP TABLE IF EXISTS album CASCADE;
DROP TABLE IF EXISTS artist CASCADE;
DROP TABLE IF EXISTS genre CASCADE;
DROP TABLE IF EXISTS publisher CASCADE;
DROP TABLE IF EXISTS users CASCADE;

-- =========================
-- TABLES
-- =========================

CREATE TABLE users
(
    id   INT PRIMARY KEY,
    name VARCHAR(255),
    role VARCHAR(20) NOT NULL
);

CREATE TABLE publisher
(
    id   INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE artist
(
    id   BIGINT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE genre
(
    id   BIGINT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

CREATE TABLE album
(
    id           BIGINT PRIMARY KEY,
    name         VARCHAR(255)   NOT NULL,
    release_year INT            NOT NULL,
    price        NUMERIC(10, 2) NOT NULL,
    cover        VARCHAR(255),
    stock        INT            NOT NULL,
    sold_count   INT DEFAULT 0,
    publisher_id INT,
    CONSTRAINT fk_album_publisher
        FOREIGN KEY (publisher_id)
            REFERENCES publisher (id)
);

CREATE TABLE album_artist
(
    album_id  BIGINT NOT NULL,
    artist_id BIGINT NOT NULL,
    PRIMARY KEY (album_id, artist_id),
    FOREIGN KEY (album_id) REFERENCES album (id) ON DELETE CASCADE,
    FOREIGN KEY (artist_id) REFERENCES artist (id) ON DELETE CASCADE
);

CREATE TABLE album_genre
(
    album_id BIGINT NOT NULL,
    genre_id BIGINT NOT NULL,
    PRIMARY KEY (album_id, genre_id),
    FOREIGN KEY (album_id) REFERENCES album (id) ON DELETE CASCADE,
    FOREIGN KEY (genre_id) REFERENCES genre (id) ON DELETE CASCADE
);

-- =========================
-- DATA
-- =========================

INSERT INTO users
VALUES (1, 'Vincent', 'ADMIN'),
       (2, 'Kevin', 'EMPLOYEE'),
       (3, 'Pieter', 'EMPLOYEE');

INSERT INTO publisher
VALUES (1, 'Sony Music'),
       (2, 'Universal Music Group'),
       (3, 'Warner Music Group');

INSERT INTO artist
VALUES (1, 'Queen'),
       (2, 'David Bowie'),
       (3, 'Daft Punk');

INSERT INTO genre
VALUES (1, 'Rock'),
       (2, 'Pop'),
       (3, 'Electronic');

INSERT INTO album
VALUES (1, 'A Night at the Opera', 1975, 19.99, 'opera.jpg', 50, 20, 1),
       (2, 'Heroes', 1977, 17.99, 'heroes.jpg', 40, 15, 2),
       (3, 'Random Access Memories', 2013, 21.99, 'ram.jpg', 30, 10, 3);

INSERT INTO album_artist
VALUES (1, 1),
       (2, 2),
       (3, 3);

INSERT INTO album_genre
VALUES (1, 1),
       (2, 1),
       (3, 3);
