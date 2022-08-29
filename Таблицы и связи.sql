CREATE TABLE IF NOT EXISTS Musical_genres (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL
);
CREATE TABLE IF NOT EXISTS Singers (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT null
);
CREATE TABLE IF NOT EXISTS Musical_genresSingers (
	Musical_genres_id INTEGER REFERENCES Musical_genres(id),
	Singers_id INTEGER REFERENCES Singers(id),
	CONSTRAINT pk PRIMARY KEY (Musical_genres_id, Singers_id)
);
CREATE TABLE IF NOT EXISTS Albums (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT null,
	year INTEGER NOT NULL
);
CREATE TABLE IF NOT EXISTS SingersAlbums (
	Singers_id INTEGER REFERENCES Singers(id),
	Albums_id INTEGER REFERENCES Albums(id),
	CONSTRAINT pk1 PRIMARY KEY (Singers_id, Albums_id)
);
CREATE TABLE IF NOT EXISTS Singles (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT null,
	time INTEGER NOT NULL
	albums_id INTEGER NOT NULL REFERENCES Singers(id)
);
CREATE TABLE IF NOT EXISTS Collections (
	id SERIAL PRIMARY KEY,
	name VARCHAR(60) NOT NULL
);
CREATE TABLE IF NOT EXISTS SinglesCollections (
	Singles_id INTEGER REFERENCES Singles(id),
	Collections_id INTEGER REFERENCES Collections(id),
	CONSTRAINT pk2 PRIMARY KEY (Singles_id, Collections_id)
);