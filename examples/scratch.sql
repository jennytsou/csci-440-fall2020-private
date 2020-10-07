SELECT * FROM artists
WHERE ArtistId=10;

SELECT tracks.Name as TrackName, albums.Title as AlbumTitle, artists.Name as ArtistsName FROM tracks
JOIN albums ON albums.AlbumId = tracks.AlbumId
JOIN artists ON artists.ArtistId = albums.ArtistId
WHERE Milliseconds > 6 * 60* 1000;

SELECT artists.Name as ArtistName, albums.Title as AlbumTitle, tracks.Name as GenreName FROM tracks
JOIN albums ON albums.AlbumId = tracks.AlbumId
JOIN artists ON artists.ArtistId = albums.ArtistId;

SELECT * from tracks;

CREATE TABLE albums_bak (
                            AlbumId  INTEGER,
                            Title    NVARCHAR(160),
                            ArtistId INTEGER
);

DROP TABLE albums_bak;

DROP TABLE grammy_categories;

DROP TABLE grammy_infos;

create table grammy_categories (
     GrammyCategoryId integer SERIAL DEFAULT(1),
     Name   NVARCHAR(200)
            );
ALTER TABLE grammy_categories
    AUTO_INCREMENT=1;

INSERT INTO grammy_categories(Name) VALUES ('Greatest Ever');

SELECT * FROM grammy_categories;

SELECT * FROM grammy_infos;

SELECT * FROM genres;

SELECT COUNT(*) as COUNT FROM genres;

create table grammy_infos (
     ArtistId   INTEGER,
     AlbumId    INTEGER,
     TrackId    INTEGER,
     GrammyCategoryId   INTEGER,
     Status NVARCHAR(120),
     FOREIGN KEY (ArtistId) REFERENCES artists(ArtistId),
     FOREIGN KEY (GrammyCategoryId) REFERENCES grammy_categories(GrammyCategoryId));

create table grammy_categories (
    GrammyCategoryId INTEGER NOT NULL PRIMARY KEY,
    Name   NVARCHAR(200));