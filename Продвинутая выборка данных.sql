SELECT COUNT(m.singers_id), s.id, s.name FROM musical_genressingers m
JOIN musical_genres s ON m.musical_genres_id = s.id
GROUP BY s.id;

SELECT COUNT(s.id) FROM albums a 
JOIN singles s ON s.albums_id = a.id
WHERE year BETWEEN 2019 AND 2020;

SELECT AVG(time) FROM singles
GROUP BY albums_id;

SELECT COUNT(s.singers_id) FROM albums a 
JOIN singersalbums s ON s.albums_id = a.id
WHERE year != 2020;

SELECT c.name FROM collections c
JOIN singlescollections s on  c.id = s.collections_id 
JOIN singles sl ON s.singles_id  = sl.id
JOIN singers sg ON sl.albums_id = sg.id
WHERE sg.name = 'Metallica'
GROUP BY c.name;

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
where sl.time = (SELECT MIN(time) FROM singles)

SELECT a.name, COUNT(sl.albums_id) FROM albums a 
JOIN singersalbums sa ON a.id = sa.albums_id 
JOIN singers sg ON sa.singers_id = sg.id 
JOIN singles sl ON sg.id = sl.albums_id 
GROUP BY a.name
ORDER BY COUNT;