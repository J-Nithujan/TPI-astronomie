COPY public.constellations (name)
FROM 'D:\FPA\TPI-astronomie\data\cons.csv'
DELIMITER ',' CSV HEADER;

COPY public.seasons (name)
FROM 'D:\FPA\TPI-astronomie\data\Meilleur saison.csv'
DELIMITER ',' CSV HEADER;

COPY public.constellations (name)
FROM 'D:\FPA\TPI-astronomie\data\difficulte d''observation.csv'
DELIMITER ',' CSV HEADER;

COPY public.types (name)
FROM 'D:\FPA\TPI-astronomie\data\TYPE.csv'
DELIMITER ',' CSV HEADER;