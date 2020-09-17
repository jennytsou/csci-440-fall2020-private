SELECT * FROM artists
WHERE ArtistId=10;

SELECT tracks.Name as TrackName, albums.Title as AlbumTitle, artists.Name as ArtistsName FROM tracks
JOIN albums ON albums.AlbumId = tracks.AlbumId
JOIN artists ON artists.ArtistId = albums.ArtistId
WHERE Milliseconds > 6 * 60* 1000;