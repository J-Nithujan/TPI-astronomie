INSERT INTO public.celestial_objects(messier_number, ngc_number, right_ascension, declination, apparent_magnitude, size, distance, constellation_id, observation_difficulty_id, season_id, type_id)
SELECT tmp.messier_number,
	tmp.ngc_number,
	tmp.right_ascension,
	tmp.declination,
	tmp.apparent_magnitude,
	tmp.size,
	tmp.distance,
	constellations.id AS constellation_id,
	observation_difficulties.id AS observation_difficulty_id, 
	seasons.id AS season_id, 
	types.id AS type_id
	FROM public.tmp
	LEFT JOIN public.constellations
		ON tmp.constellation = constellations.name
	LEFT JOIN public.observation_difficulties
		ON tmp.observation_difficulty = observation_difficulties.name
	LEFT JOIN public.seasons
		ON tmp.season = seasons.name
	LEFT JOIN public.types
		ON tmp.type = types.name;