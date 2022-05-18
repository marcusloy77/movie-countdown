CREATE DATABASE movies_db;

\c movies_db

CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    name TEXT,
    email TEXT,
    password_digest TEXT
);

CREATE TABLE movies(
    id SERIAL PRIMARY KEY,
    title TEXT,
    release_date TEXT,
    cover_art TEXT
);

CREATE TABLE movie_picks(
    id SERIAL PRIMARY KEY,
    user_id INTEGER,
    movie_id INTEGER
);