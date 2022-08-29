INSERT INTO singers(name) 
VALUES
('The Doors'),
('Rolling Stones'),
('Linkin Park'),
('Lenny Kravitz'),
('NIRVANA'),
('Metallica'),
('Rammstein'),
('Red Hot Chilli Peppers');

INSERT INTO Musical_genres(name) 
VALUES
('Acid rock'),
('Rock'),
('Dance rock'),
('Electronic rock'),
('Funk rock'),
('Grunge'),
('Heavy metal'),
('Industrial metal');

INSERT INTO albums (name, year) 
VALUES
('The Doors', 1967),
('A Bigger Bang', 2005),
('One More Light', 2018),
('Raise Vibration', 2018),
('Nevermind', 1991),
('Metallica (The Black Album)', 1991),
('Rammstein', 2019),
('Californication', 1999);

INSERT INTO singles  (name, time, albums_id) 
VALUES
('Light My Fire', 6.52, 1),
('Soul Kitchen', 3.32, 1),
('Back of My Hand', 3.22, 2),
('Streets of Love', 5.15, 2),
('One More Light', 4.15, 3),
('Battle Symphony', 3.30, 3),
('I ll Always Be Inside Your Soul', 3.58, 4),
('Low', 5.19, 4),
('In Bloom', 4.14, 5),
('Something in the Way', 3.50, 5),
('The Unforgiven', 6.26, 6),
('Nothing Else Matters', 6.27, 6),
('Deutschland', 5.23, 7),
('Was ich liebe', 4.29, 7),
('Californication', 5.21, 8),
('Around the World', 3.58, 8);

INSERT INTO collections (name, year) 
VALUES
('Weird Scenes Inside the Gold Mine', 1972),
('GRRR!', 2012),
('The Hunting Party: Live from Mexico', 2014),
('Lenny Kravitz: One Night in Tokyo', 2020),
('20th Anniversary Edition', 2011),
('Live At Wembley Stadium', 2020),
('Du hast', 1998),
('Greatest Hits', 2003);


INSERT INTO Musical_genresSingers 
VALUES
(1, 1),
(2, 1),
(2, 2),
(3, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(4, 3),
(5, 4),
(6, 5),
(7, 6),
(2, 7),
(8, 7),
(2, 8),
(5, 8);

INSERT INTO SingersAlbums 
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8);

INSERT INTO SinglesCollections 
VALUES
(1, 1),
(2, 1),
(3, 2),
(4, 2),
(5, 3),
(6, 3),
(7, 4),
(8, 4),
(9, 5),
(10, 5),
(11, 6),
(12, 6),
(13, 7),
(14, 7),
(15, 8),
(16, 8);

INSERT INTO singles  (name, time, albums_id) 
VALUES
('Sad but True', 5.23, 6),
('Hero of the Day', 4.21, 9);

INSERT INTO albums (name, year) 
VALUES ('Load', 1996);

INSERT INTO SingersAlbums 
VALUES
(6, 9);