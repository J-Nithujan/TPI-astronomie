set PGPASSWORD=Pa$$w0rd
psql -U postgres -d db_astronomy -c "\copy public.constellations (name) FROM .\csv\cons.csv DELIMITER ',' CSV HEADER ENCODING 'UTF8'; 

psql -U postgres -d db_astronomy -c "\copy public.seasons (name) FROM '.\csv\Meilleur saison.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';"

psql -U postgres -d db_astronomy -c "\copy public.observation_difficulties (name) FROM '.\csv\difficulte d''observation.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';"

psql -U postgres -d db_astronomy -c "\copy public.types (name) FROM '.\csv\TYPE.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';"

psql -U postgres -d db_astronomy -c "\copy public.tmp_celestial_objects (messier_number, ngc_number, type, constellation, right_ascension, declination, apparent_magnitude, size, distance, season, observation_difficulty) FROM '.\csv\LeCatalogueMessier.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';"

psql -U postgres -d db_astronomy -c "\copy public.tmp_pictures (messier_number, picture) FROM '.\csv\pictures.csv' DELIMITER ',' CSV HEADER ENCODING 'UTF8';"

pause