SELECT COUNT(m.singers_id), s.id, s.name FROM musical_genressingers m
JOIN musical_genres s ON m.musical_genres_id = s.id
GROUP BY s.id;

SELECT COUNT(s.id) FROM albums a 
JOIN singles s ON s.albums_id = a.id
WHERE year BETWEEN 2019 AND 2020;

SELECT AVG(sl.time), a.name  FROM singles sl
JOIN singers sg ON sl.albums_id = sg.id 
JOIN singersalbums sa ON sg.id = sa.singers_id
JOIN albums a ON sa.albums_id = a.id 
GROUP BY a.name;

SELECT COUNT(sa.singers_id) from singers s
JOIN singersalbums sa ON s.id = sa.singers_id 
JOIN albums a ON sa.albums_id = a.id 
WHERE sa.singers_id NOT IN
(SELECT sa.singers_id FROM albums a 
JOIN singersalbums sa ON sa.albums_id = a.id
WHERE year = 2020);

SELECT DISTINCT c.name FROM collections c
JOIN singlescollections s ON  c.id = s.collections_id 
JOIN singles sl ON s.singles_id  = sl.id
JOIN singers sg ON sl.albums_id = sg.id
WHERE sg.name = 'Metallica';

SELECT a.name FROM albums a
JOIN singersalbums sa ON a.id = sa.albums_id 
JOIN singers sg ON sa.singers_id = sg.id 
JOIN musical_genressingers mg ON sg.id = mg.singers_id 
GROUP BY a.name
HAVING COUNT(mg.musical_genres_id) > 1;

SELECT sl.name FROM singles sl
LEFT JOIN singlescollections sc ON sl.id = sc.singles_id 
WHERE sc.singles_id  IS NULL;

SELECT sg.name FROM singers sg
JOIN singles sl ON sl.albums_id = sg.id 
WHERE sl.time = (SELECT MIN(time) FROM singles)

SELECT COUNT(*), a.id, a.name  FROM albums a 
JOIN singersalbums sa ON a.id = sa.albums_id 
JOIN singers sg ON sa.singers_id = sg.id 
JOIN singles sl ON sg.id = sl.albums_id
GROUP BY a.id
having COUNT(*) = 
(SELECT COUNT(*) FROM albums a 
JOIN singersalbums sa ON a.id = sa.albums_id 
JOIN singers sg ON sa.singers_id = sg.id 
JOIN singles sl ON sg.id = sl.albums_id
GROUP BY a.id
ORDER BY count
LIMIT 1);