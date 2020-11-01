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

SELECT * FROM tracks order by Milliseconds LIMIT 1 OFFSET 0;

SELECT * FROM albums
JOIN tracks ON tracks.AlbumId = albums.AlbumId
JOIN invoice_items ON invoice_items.TrackId = tracks.TrackId
GROUP BY tracks.TrackId having count(*)>1;

SELECT DISTINCT albums.AlbumId FROM albums
JOIN tracks ON tracks.AlbumId = albums.AlbumId
JOIN invoice_items ON invoice_items.TrackId = tracks.TrackId
GROUP BY tracks.TrackId having count(*)>1;

SELECT CustomerId, Email FROM customers
WHERE customers.SupportRepId IN
    (SELECT EmployeeId FROM employees
    JOIN invoice_items ON invoice_items.CustomerId = customers.CustomerId
    WHERE employees.LastName = 'Peacock' and employees.FirstName='Jane');

SELECT CustomerId, Email FROM customers
WHERE customers.SupportRepId IN
(SELECT EmployeeId FROM employees
JOIN invoices ON invoices.CustomerId = customers.CustomerId
JOIN invoice_items ON invoice_items.invoiceId = invoices.invoiceId
WHERE employees.LastName = 'Peacock' and employees.FirstName='Jane'
GROUP BY invoice_items.InvoiceId having count(*)>1);

SELECT * FROM playlist_track WHERE PlaylistId = 3;

SELECT * FROM tracks
JOIN playlist_track ON playlist_track.TrackId = tracks.TrackId
JOIN playlists ON playlists.PlaylistId = playlist_track.PlaylistId
WHERE playlists.PlaylistId = 3 order by tracks.Name;

SELECT * FROM playlists
JOIN playlist_track ON playlist_track.TrackId = playlists.PlaylistId where playlist_track.TrackId=1;
