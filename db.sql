CREATE DATABASE IMDBdatabase;

USE IMDBdatabase;

-- Create Movie table
CREATE TABLE Movie (
    movie_id INT PRIMARY KEY,
    movie_title VARCHAR(255),
    release_date DATE,
    duration INT,
    director VARCHAR(255),
);

-- Creating a Media table
CREATE TABLE Media (
    media_id INT PRIMARY KEY,
    movie_id INT,
    media_type VARCHAR(50),
    media_url VARCHAR(255),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)

);

-- Below Code creates a Genre table
CREATE TABLE Genre (
    genre_id INT PRIMARY KEY,
    genre_name VARCHAR(50)
);

-- Create Movie_Genre table
CREATE TABLE Movie_Genre (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY (movie_id, genre_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (genre_id) REFERENCES Genre(genre_id)
);

-- Create Review table
CREATE TABLE Review (
    review_id INT PRIMARY KEY,
    movie_id INT,
    user_id INT,
    review_text VARCHAR(255),
    rating INT,
    review_date DATE,
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id),
    FOREIGN KEY (user_id) REFERENCES User(user_id)
   
);

-- Create User table
CREATE TABLE User (
    user_id INT PRIMARY KEY,
    username VARCHAR(255),
    email VARCHAR(255)
  
);

-- Create Artist table
CREATE TABLE Artist (
    artist_id INT PRIMARY KEY,
    artist_name VARCHAR(255)
   
);

-- Create Skill table
CREATE TABLE Skill (
    skill_id INT PRIMARY KEY,
    skill_name VARCHAR(50)
);

-- Create Artist_Skill table
CREATE TABLE Artist_Skill (
    artist_id INT,
    skill_id INT,
    PRIMARY KEY (artist_id, skill_id),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
    FOREIGN KEY (skill_id) REFERENCES Skill(skill_id)
);

-- Create Role table
CREATE TABLE Role (
    role_id INT PRIMARY KEY,
    role_name VARCHAR(50)
);

-- Create Artist_Role table
CREATE TABLE Artist_Role (
    artist_id INT,
    role_id INT,
    movie_id INT,
    PRIMARY KEY (artist_id, role_id, movie_id),
    FOREIGN KEY (artist_id) REFERENCES Artist(artist_id),
    FOREIGN KEY (role_id) REFERENCES Role(role_id),
    FOREIGN KEY (movie_id) REFERENCES Movie(movie_id)
);
