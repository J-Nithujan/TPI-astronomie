COPY public.constellations (name)
FROM 'C:\TPI\data\cons.csv'
DELIMITER ',' CSV HEADER;

COPY public.seasons (name)
FROM 'C:\TPI\data\Meilleur saison.csv'
DELIMITER ',' CSV HEADER;

COPY public.constellations (name)
FROM 'C:\TPI\data\difficulte d''observation.csv'
DELIMITER ',' CSV HEADER;

COPY public.types (name)
FROM 'C:\TPI\data\TYPE.csv'
DELIMITER ',' CSV HEADER;

COPY public.tmp (messier_number, ngc_number, type, constellation, right_ascension, apparent_magnitude, size, distance, season, observation_difficulty)
FROM 'C:\TPI\data\LeCatalogueMessier.csv'
DELIMITER ',' CSV HEADER;