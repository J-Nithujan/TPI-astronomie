-- Project: TPI
-- Title: copy-csv.sql
-- Author: Nithujan Jegatheeswaran
-- Version: 12.05.22

COPY public.constellations (name)
FROM '.\csv\cons.csv'
DELIMITER ',' CSV HEADER;

COPY public.seasons (name)
FROM '.\csv\Meilleur saison.csv'
DELIMITER ',' CSV HEADER;

COPY public.observation_difficulties (name)
FROM '.\csv\difficulté d''observation.csv'
DELIMITER ',' CSV HEADER;

COPY public.constellations (name)
FROM '.\csv\difficulte d''observation.csv'
DELIMITER ',' CSV HEADER;

COPY public.types (name)
FROM '.\csv\TYPE.csv'
DELIMITER ',' CSV HEADER;

COPY public.tmp_celestial_objects (messier_number, ngc_number, type, constellation, right_ascension, declination, apparent_magnitude, size, distance, season, observation_difficulty)
FROM '.\csv\LeCatalogueMessier.csv'
DELIMITER ',' CSV HEADER;

COPY public.tmp_pictures (messier_number, picture)
FROM '.\csv\pictures.csv'
DELIMITER ',' CSV HEADER ;