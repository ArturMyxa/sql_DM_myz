CREATE TABLE IF NOT EXISTS Artists (
 artistID SERIAL PRIMARY KEY,
 artist_name VARCHAR(100) NOT NULL
);

CREATE TABLE IF NOT EXISTS Albums (
 albumID INTEGER PRIMARY KEY,
 album_name VARCHAR(100) NOT NULL,
 album_release_year DATE NOT NULL CHECK (album_release_year > '1900-01-01')
);

CREATE TABLE IF NOT EXISTS Tracks (
 trackID INTEGER PRIMARY KEY,
 track_name VARCHAR(100) NOT NULL,
 track_duration TIME NOT NULL CHECK (track_duration < '10:00:00'),
 albumID_t INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS Genres (
 genreID SERIAL PRIMARY KEY,
 genre_name VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE IF NOT EXISTS Collections (
 collectionID SERIAL PRIMARY KEY,
 collection_title VARCHAR(100) NOT NULL,
 collection_date DATE NOT NULL CHECK (collection_date > '1900-01-01')
);

CREATE TABLE IF NOT EXISTS Artists_Genres (
 artistID_ag INTEGER REFERENCES Artists(artistID) NOT NULL,
 genreID_ag INTEGER REFERENCES Genres(genreID) NOT NULL,
 CONSTRAINT pk PRIMARY KEY (artistID_ag, genreID_ag)
);

CREATE TABLE IF NOT EXISTS Artists_Album (
 artistID_aa INTEGER REFERENCES Artists(artistID) NOT NULL,
 albumID_aa INTEGER REFERENCES Albums(albumID) NOT NULL,
 CONSTRAINT pk_ PRIMARY KEY (artistID_aa, albumID_aa)
);

CREATE TABLE IF NOT EXISTS Collection_Tracks (
 collectionID_ct INTEGER REFERENCES Collections(id_collection) NOT NULL,
 trackID_ct INTEGER REFERENCES Tracks(id_track) NOT NULL,
 CONSTRAINT pk__ PRIMARY KEY (collectionID_ct, trackID_ct)
);