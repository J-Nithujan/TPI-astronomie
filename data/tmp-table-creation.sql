-- Table: public.celestial_objects

DROP TABLE IF EXISTS public.tmp;

CREATE SEQUENCE tmp_id_seq AS integer;

CREATE TABLE IF NOT EXISTS public.tmp
(
    id integer NOT NULL DEFAULT nextval('tmp_id_seq'::regclass),
    messier_number character varying(4) COLLATE pg_catalog."default" NOT NULL,
    ngc_number character varying(10) COLLATE pg_catalog."default",
    right_ascension time(0) without time zone,
    apparent_magnitude numeric(4,2),
    size character varying(15) COLLATE pg_catalog."default",
    distance character varying(10) COLLATE pg_catalog."default",
    picture character varying(100) COLLATE pg_catalog."default",
    constellation character varying(30) NOT NULL,
    observation_difficulty character varying(15) NOT NULL,
    season character varying(10) NOT NULL,
    type character varying(30) NOT NULL,
    CONSTRAINT tmp_pkey PRIMARY KEY (id),
    CONSTRAINT unique_tmp UNIQUE (messier_number)
)

TABLESPACE pg_default;

ALTER SEQUENCE IF EXISTS tmp_id_seq OWNED BY public.tmp.id;

ALTER TABLE IF EXISTS public.tmp
    OWNER to postgres;