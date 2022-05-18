-- Project: TPI
-- Title: insert-celestial_objects.sql
-- Author: Nithujan Jegatheeswaran
-- Version: 12.05.22

INSERT INTO public.celestial_objects(messier_number, ngc_number, right_ascension, declination, apparent_magnitude, size, distance, picture, constellation_id, observation_difficulty_id, season_id, type_id)
SELECT tmp_celestial_objects.messier_number,
	tmp_celestial_objects.ngc_number,
	tmp_celestial_objects.right_ascension,
	tmp_celestial_objects.declination,
	tmp_celestial_objects.apparent_magnitude,
	tmp_celestial_objects.size,
	tmp_celestial_objects.distance,
	tmp_pictures.picture as picture,
	constellations.id AS constellation_id,
	observation_difficulties.id AS observation_difficulty_id, 
	seasons.id AS season_id, 
	types.id AS type_id
	FROM public.tmp_celestial_objects
	LEFT JOIN public.constellations
		ON tmp_celestial_objects.constellation = constellations.name
	LEFT JOIN public.observation_difficulties
		ON tmp_celestial_objects.observation_difficulty = observation_difficulties.name
	LEFT JOIN public.seasons
		ON tmp_celestial_objects.season = seasons.name
	LEFT JOIN public.types
		ON tmp_celestial_objects.type = types.name
	LEFT JOIN public.tmp_pictures
		ON tmp_pictures.messier_number = tmp_celestial_objects.messier_number
	ORDER BY tmp_celestial_objects.id;