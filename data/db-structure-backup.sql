--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2022-05-12 11:46:31

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE db_astronomy;
--
-- TOC entry 3449 (class 1262 OID 17729)
-- Name: db_astronomy; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE db_astronomy WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'French_Switzerland.1252';


ALTER DATABASE db_astronomy OWNER TO postgres;

\connect db_astronomy

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 209 (class 1259 OID 17730)
-- Name: administrators; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.administrators (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(64) NOT NULL
);


ALTER TABLE public.administrators OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 17733)
-- Name: administrators_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.administrators_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.administrators_id_seq OWNER TO postgres;

--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 210
-- Name: administrators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.administrators_id_seq OWNED BY public.administrators.id;


--
-- TOC entry 211 (class 1259 OID 17734)
-- Name: celestial_objects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.celestial_objects (
    id integer NOT NULL,
    messier_number character varying(4) NOT NULL,
    ngc_number character varying(10),
    right_ascension character varying(15),
    declination character varying(7),
    apparent_magnitude numeric(4,2),
    size character varying(15),
    distance character varying(10),
    picture character varying(100),
    constellation_id integer NOT NULL,
    observation_difficulty_id integer NOT NULL,
    season_id integer NOT NULL,
    type_id integer NOT NULL
);


ALTER TABLE public.celestial_objects OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 17737)
-- Name: celestial_objects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.celestial_objects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_objects_id_seq OWNER TO postgres;

--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 212
-- Name: celestial_objects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.celestial_objects_id_seq OWNED BY public.celestial_objects.id;


--
-- TOC entry 213 (class 1259 OID 17738)
-- Name: constellations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.constellations (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.constellations OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 17741)
-- Name: constellations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.constellations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellations_id_seq OWNER TO postgres;

--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 214
-- Name: constellations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.constellations_id_seq OWNED BY public.constellations.id;


--
-- TOC entry 215 (class 1259 OID 17742)
-- Name: observation_difficulties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.observation_difficulties (
    id integer NOT NULL,
    name character varying(15) NOT NULL
);


ALTER TABLE public.observation_difficulties OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 17745)
-- Name: observation_difficulties_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.observation_difficulties_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observation_difficulties_id_seq OWNER TO postgres;

--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 216
-- Name: observation_difficulties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.observation_difficulties_id_seq OWNED BY public.observation_difficulties.id;


--
-- TOC entry 217 (class 1259 OID 17746)
-- Name: outing_has_celestial_object; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.outing_has_celestial_object (
    id integer NOT NULL,
    outing_id integer NOT NULL,
    celestial_object_id integer NOT NULL
);


ALTER TABLE public.outing_has_celestial_object OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 17749)
-- Name: outing_has_celestial_object_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.outing_has_celestial_object_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.outing_has_celestial_object_id_seq OWNER TO postgres;

--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 218
-- Name: outing_has_celestial_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.outing_has_celestial_object_id_seq OWNED BY public.outing_has_celestial_object.id;


--
-- TOC entry 219 (class 1259 OID 17750)
-- Name: outings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.outings (
    id integer NOT NULL,
    theme character varying(50) NOT NULL,
    meeting_time timestamp(0) without time zone NOT NULL,
    duration time(0) without time zone NOT NULL,
    place character varying(100) NOT NULL,
    equipment text,
    max_people integer NOT NULL,
    remaining_slots integer NOT NULL,
    comment text
);


ALTER TABLE public.outings OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 17755)
-- Name: outings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.outings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.outings_id_seq OWNER TO postgres;

--
-- TOC entry 3455 (class 0 OID 0)
-- Dependencies: 220
-- Name: outings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.outings_id_seq OWNED BY public.outings.id;


--
-- TOC entry 221 (class 1259 OID 17756)
-- Name: seasons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seasons (
    id integer NOT NULL,
    name character varying(10) NOT NULL
);


ALTER TABLE public.seasons OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 17759)
-- Name: seasons_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.seasons_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seasons_id_seq OWNER TO postgres;

--
-- TOC entry 3456 (class 0 OID 0)
-- Dependencies: 222
-- Name: seasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.seasons_id_seq OWNED BY public.seasons.id;


--
-- TOC entry 223 (class 1259 OID 17760)
-- Name: tmp_celestial_objects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tmp_celestial_objects (
    id integer NOT NULL,
    messier_number character varying(4) NOT NULL,
    ngc_number character varying(10),
    right_ascension character varying(15),
    declination character varying(7),
    apparent_magnitude numeric(4,2),
    size character varying(15),
    distance character varying(10),
    picture character varying(100),
    constellation character varying(30),
    observation_difficulty character varying(15),
    season character varying(10),
    type character varying(30)
);


ALTER TABLE public.tmp_celestial_objects OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 17763)
-- Name: tmp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tmp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tmp_id_seq OWNER TO postgres;

--
-- TOC entry 3457 (class 0 OID 0)
-- Dependencies: 224
-- Name: tmp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tmp_id_seq OWNED BY public.tmp_celestial_objects.id;


--
-- TOC entry 232 (class 1259 OID 17894)
-- Name: tmp_pictures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tmp_pictures (
    id integer NOT NULL,
    messier_number character varying(5),
    picture character varying(100)
);


ALTER TABLE public.tmp_pictures OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 17893)
-- Name: tmp_pictures_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tmp_pictures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tmp_pictures_id_seq OWNER TO postgres;

--
-- TOC entry 3458 (class 0 OID 0)
-- Dependencies: 231
-- Name: tmp_pictures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tmp_pictures_id_seq OWNED BY public.tmp_pictures.id;


--
-- TOC entry 225 (class 1259 OID 17764)
-- Name: types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.types (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.types OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 17767)
-- Name: types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.types_id_seq OWNER TO postgres;

--
-- TOC entry 3459 (class 0 OID 0)
-- Dependencies: 226
-- Name: types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.types_id_seq OWNED BY public.types.id;


--
-- TOC entry 227 (class 1259 OID 17768)
-- Name: user_has_outing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_has_outing (
    id integer NOT NULL,
    user_id integer NOT NULL,
    outing_id integer NOT NULL
);


ALTER TABLE public.user_has_outing OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 17771)
-- Name: user_has_outing_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_has_outing_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_has_outing_id_seq OWNER TO postgres;

--
-- TOC entry 3460 (class 0 OID 0)
-- Dependencies: 228
-- Name: user_has_outing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_has_outing_id_seq OWNED BY public.user_has_outing.id;


--
-- TOC entry 229 (class 1259 OID 17772)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    firstname character varying(50) NOT NULL,
    lastname character varying(50) NOT NULL,
    age integer NOT NULL,
    phone_number character varying(20) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 17775)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3461 (class 0 OID 0)
-- Dependencies: 230
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3219 (class 2604 OID 17872)
-- Name: administrators id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrators ALTER COLUMN id SET DEFAULT nextval('public.administrators_id_seq'::regclass);


--
-- TOC entry 3220 (class 2604 OID 17873)
-- Name: celestial_objects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.celestial_objects ALTER COLUMN id SET DEFAULT nextval('public.celestial_objects_id_seq'::regclass);


--
-- TOC entry 3221 (class 2604 OID 17874)
-- Name: constellations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constellations ALTER COLUMN id SET DEFAULT nextval('public.constellations_id_seq'::regclass);


--
-- TOC entry 3222 (class 2604 OID 17875)
-- Name: observation_difficulties id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observation_difficulties ALTER COLUMN id SET DEFAULT nextval('public.observation_difficulties_id_seq'::regclass);


--
-- TOC entry 3223 (class 2604 OID 17876)
-- Name: outing_has_celestial_object id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outing_has_celestial_object ALTER COLUMN id SET DEFAULT nextval('public.outing_has_celestial_object_id_seq'::regclass);


--
-- TOC entry 3224 (class 2604 OID 17877)
-- Name: outings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outings ALTER COLUMN id SET DEFAULT nextval('public.outings_id_seq'::regclass);


--
-- TOC entry 3225 (class 2604 OID 17878)
-- Name: seasons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seasons ALTER COLUMN id SET DEFAULT nextval('public.seasons_id_seq'::regclass);


--
-- TOC entry 3226 (class 2604 OID 17879)
-- Name: tmp_celestial_objects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tmp_celestial_objects ALTER COLUMN id SET DEFAULT nextval('public.tmp_id_seq'::regclass);


--
-- TOC entry 3230 (class 2604 OID 17897)
-- Name: tmp_pictures id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tmp_pictures ALTER COLUMN id SET DEFAULT nextval('public.tmp_pictures_id_seq'::regclass);


--
-- TOC entry 3227 (class 2604 OID 17880)
-- Name: types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types ALTER COLUMN id SET DEFAULT nextval('public.types_id_seq'::regclass);


--
-- TOC entry 3228 (class 2604 OID 17881)
-- Name: user_has_outing id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_has_outing ALTER COLUMN id SET DEFAULT nextval('public.user_has_outing_id_seq'::regclass);


--
-- TOC entry 3229 (class 2604 OID 17882)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3420 (class 0 OID 17730)
-- Dependencies: 209
-- Data for Name: administrators; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.administrators (id, email, password) FROM stdin;
\.


--
-- TOC entry 3422 (class 0 OID 17734)
-- Dependencies: 211
-- Data for Name: celestial_objects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.celestial_objects (id, messier_number, ngc_number, right_ascension, declination, apparent_magnitude, size, distance, picture, constellation_id, observation_difficulty_id, season_id, type_id) FROM stdin;
1	M1	NGC 1952	5h 34.5m	22°1	8.40	6.0x4.0	6,300	\N	111	6	13	14
2	M2	NGC 7089	21h 33.5m	-0°49	6.50	12.9	37,500	\N	112	7	14	15
3	M3	NGC 5272	13h 42.2m	28°23	6.20	16.2	33,900	\N	113	7	15	15
4	M4	NGC 6121	16h 23.6m	-26°32	5.60	26.3	7,200	\N	114	8	16	15
5	M5	NGC 5904	15h 18.6m	2°5	5.60	17.4	24,500	\N	115	9	16	15
6	M6	NGC 6405	17h 40.1m	-32°13	5.30	25	2,000	\N	114	7	16	16
7	M7	NGC 6475	17h 53.9m	-34°49	4.10	80	800	\N	114	7	16	16
8	M8	NGC 6523	18h 3.8m	-24°23	6.00	90x40	5,200	\N	116	6	16	17
9	M9	NGC 6333	17h 19.2m	-18°31	7.70	9.3	26,700	\N	117	6	16	15
10	M10	NGC 6254	16h 57.1m	-4°6	6.60	15.1	14,400	\N	117	6	16	15
11	M11	NGC 6705	18h 51.1m	-6°16	6.30	14	6,000	\N	118	9	16	16
12	M12	NGC 6218	16h 47.2m	-1°57	6.70	14.5	16,000	\N	117	6	16	15
13	M13	NGC 6205	16h 41.7m	36°28	5.80	16.6	22,800	\N	119	9	16	15
14	M14	NGC 6402	17h 37.6m	-3°15	7.60	11.7	27,400	\N	117	6	16	15
15	M15	NGC 7078	21h 30m	12°10	6.20	12.3	33,600	\N	120	7	14	15
16	M16	NGC 6611	18h 18.8m	-13°47	6.40	7	7,000	\N	115	7	16	16
17	M17	NGC 6618	18h 20.8m	-16°11	7.00	11	5,000	\N	116	7	16	17
18	M18	NGC 6613	18h 19.9m	-17°8	7.50	9	4,900	\N	116	6	16	16
19	M19	NGC 6273	17h 2.6m	-26°16	6.80	13.5	27,100	\N	117	6	16	15
20	M20	NGC 6514	18h 2.3m	-23°2	9.00	28	5,200	\N	116	10	16	17
21	M21	NGC 6531	18h 4.6m	-22°30	6.50	13	4,250	\N	116	6	16	16
22	M22	NGC 6656	18h 36.4m	-23°54	5.10	24	10,100	\N	116	9	16	15
23	M23	NGC 6494	17h 56.8m	-19°1	6.90	27	2,150	\N	116	7	16	16
24	M24	NGC 6603	18h 18.4m	-18°25	4.60	90	10,000	\N	116	6	16	18
25	M25	IC 4725	18h 31.7m	-19°14	6.50	40	2,000	\N	116	7	16	16
26	M26	NGC 6694	18h 45.2m	-9°24	8.00	15	5,000	\N	118	6	16	16
27	M27	NGC 6853	19h 59.6m	22°43	7.40	8.0x5.7	1,250	\N	121	7	16	19
28	M28	NGC 6626	18h 24.5m	-24°52	6.80	11.2	17,900	\N	116	7	16	15
29	M29	NGC 6913	20h 23.9m	38°32	7.10	7	4,000	\N	122	7	16	16
30	M30	NGC 7099	21h 40.4m	-23°11	7.20	11	24,800	\N	123	7	14	15
31	M31	NGC 224	0h 42.7m	41°16	3.40	178x63	2,900,000	\N	124	7	14	20
32	M32	NGC 221 	0h 42.7m	40°52	8.10	8x6	2,900,000	\N	124	7	14	21
33	M33	NGC 598	1h 33.9m	30°39	5.70	73x45	3,000,000	\N	125	7	14	20
34	M34	NGC 1039	2h 42m	42°47	5.50	35	1,400	\N	126	7	14	16
35	M35	NGC 2168	6h 8.9m	24°20	5.30	28	2,800	\N	127	9	13	16
36	M36	NGC 1960	5h 36.1m	34°8	6.30	12	4,100	\N	128	7	13	16
37	M37	NGC 2099	5h 52.4m	32°33	6.20	24	4,400	\N	128	7	13	16
38	M38	NGC 1912	5h 28.7m	35°50	7.40	21	4,200	\N	128	7	13	16
39	M39	NGC 7092	21h 32.2m	48°26	5.20	32	825	\N	122	7	14	16
40	M40	Winecke 4	12h 22.2m	58°5	9.30	49	510	\N	129	7	15	22
41	M41	NGC 2287	6h 47m	-20°44	4.60	38	2,300	\N	130	7	13	16
42	M42	NGC 1976	5h 35.4m	-5°27	4.00	85x60	1,600	\N	131	9	13	17
43	M43	NGC 1982	5h 35.6m	-5°16	9.00	20x15	1,600	\N	131	7	13	17
44	M44	NGC 2632	8h 40.1m	19°59	3.70	95	577	\N	132	7	13	16
45	M45	\N	3h 47m	24°7.2	1.60	110	380	\N	111	9	13	16
46	M46	NGC 2437	7h 41.8m	-14°49	6.00	27	5,400	\N	133	7	13	16
47	M47	NGC 2422	7h 36.6m	-14°30	5.20	30	1,600	\N	133	7	13	16
48	M48	NGC 2548	8h 13.8m	-5°48	5.50	54	1,500	\N	134	7	13	16
49	M49	NGC 4472	12h 29.8m	8°0	8.40	9x7.5	60,000,000	\N	135	6	15	23
50	M50	NGC 2323	7h 3.2m	-8°20	6.30	16	3,000	\N	136	7	13	16
51	M51	NGC 5194	13h 29.9m	47°12	8.40	11x7	37,000,000	\N	113	6	15	20
52	M52	NGC 7654	23h 24.2m	61°35	7.30	13	5,000	\N	137	7	14	16
53	M53	NGC 5024	13h 12.9m	18°10	7.60	12.6	56,400	\N	138	7	15	15
54	M54	NGC 6715	18h 55.1m	-30°29	7.60	9.1	82,800	\N	116	6	16	15
55	M55	NGC 6809	19h 40m	-30°58	6.30	19	16,600	\N	116	8	16	15
56	M56	NGC 6779	19h 16.6m	30°11	8.30	7.1	31,600	\N	139	6	16	15
57	M57	NGC 6720	18h 53.6m	33°2	8.80	1.4x1	4,100	\N	139	7	16	19
58	M58	NGC 4579	12h 37.7m	11°49	9.70	5.5x4.5	60,000,000	\N	135	6	15	20
59	M59	NGC 4621	12h 42m	11°39	9.60	5x3.5	60,000,000	\N	135	8	15	23
60	M60	NGC 4649	12h 43.7m	11°33	8.80	7x6	60,000,000	\N	135	6	15	23
61	M61	NGC 4303	12h 21.9m	4°28	9.70	6x5.5	60,000,000	\N	135	8	15	20
62	M62	NGC 6266	17h 1.2m	-30°7	6.50	14.1	21,500	\N	117	6	16	15
63	M63	NGC 5055	13h 15.8m	42°2	8.60	10x6	37,000,000	\N	113	6	15	20
64	M64	NGC 4826	12h 56.7m	21°41	8.50	9.3x5.4	19,000,000	\N	138	6	15	20
65	M65	NGC 3623	11h 18.9m	13°5	9.30	8x1.5	35,000,000	\N	140	6	15	20
66	M66	NGC 3627	11h 20.2m	12°59	8.90	8x2.5	35,000,000	\N	140	7	15	20
67	M67	NGC 2682	8h 50.4m	11°49	6.10	30	2,700	\N	132	7	13	16
68	M68	NGC 4590	12h 39.5m	-26°45	7.80	12	33,300	\N	134	10	15	15
69	M69	NGC 6637	18h 31.4m	-32°21	7.60	7.1	26,700	\N	116	6	16	15
70	M70	NGC 6681	18h 43.2m	-32°18	7.90	7.8	28,000	\N	116	6	16	15
71	M71	NGC 6838	19h 53.8m	18°47	8.30	7.2	11,700	\N	141	6	16	15
72	M72	NGC 6981	20h 53.5m	-12°32	9.30	5.9	52,800	\N	112	6	16	15
73	M73	NGC 6994	20h 59m	-12°38	9.00	2.8	2,000	\N	112	8	16	24
74	M74	NGC 628	1h 36.7m	15°47	9.40	10.2x9.5	35,000,000	\N	142	10	14	20
75	M75	NGC 6864	20h 6.1m	-21°55	8.50	6	57,700	\N	116	6	16	15
76	M76	NGC 650	1h 42.3m	51°34	10.10	2.7x1.8	3,400	\N	126	6	14	19
77	M77	NGC 1068	2h 42.7m	0°1	8.90	7x6	60,000,000	\N	143	6	14	20
78	M78	NGC 2068	5h 46.7m	0°3	8.30	8x6	1,600	\N	131	6	13	17
79	M79	NGC 1904	5h 24.5m	-24°33	7.70	8.7	41,100	\N	144	6	13	15
80	M80	NGC 6093	16h 17m	-22°59	7.30	8.9	27,400	\N	114	7	16	15
81	M81	NGC 3031	9h 55.6m	69°4	6.90	21x10	12,000,000	\N	129	7	15	20
82	M82	NGC 3034	9h 55.8m	69°41	8.40	9.x4	12,000,000	\N	129	7	15	25
83	M83	NGC 5236	13h 37m	-29°52	7.60	11x10	15,000,000	\N	134	8	15	20
84	M84	NGC 4374	12h 25.1m	12°53	9.10	5	60,000,000	\N	135	6	15	26
85	M85	NGC 4382	12h 25.4m	18°11	9.10	7.1x5.2	60,000,000	\N	138	6	15	26
86	M86	NGC 4406	12h 26.2m	12°57	8.90	7.5x5.5	60,000,000	\N	135	6	15	26
87	M87	NGC 4486	12h 30.8m	12°24	8.60	7	60,000,000	\N	135	6	15	23
88	M88	NGC 4501	12h 32m	14°25	9.60	7x4	60,000,000	\N	138	6	15	20
89	M89	NGC 4552	12h 35.7m	12°33	9.80	4	60,000,000	\N	135	6	15	23
90	M90	NGC 4569	12h 36.8m	13°10	9.50	9.5x4.5	60,000,000	\N	135	8	15	20
91	M91	NGC 4548	12h 35.4m	14°30	10.20	5.4x4.4	60,000,000	\N	138	10	15	20
92	M92	NGC 6341	17h 17.1m	43°8	6.40	11.2	26,400	\N	119	7	16	15
93	M93	NGC 2447	7h 44.6m	-23°52	6.00	22	3,600	\N	133	7	13	16
94	M94	NGC 4736	12h 50.9m	41°7	8.20	7x3	14,500,000	\N	113	6	15	20
95	M95	NGC 3351	10h 44m	11°42	9.70	4.4x3.3	38,000,000	\N	140	8	15	20
96	M96	NGC 3368	10h 46.8m	11°49	9.20	6x4	38,000,000	\N	140	6	15	20
97	M97	NGC 3587	11h 14.8m	55°1	9.90	3.4x3.3	2,600	\N	129	10	15	19
98	M98	NGC 4192	12h 13.8m	14°54	10.10	9.5x3.2	60,000,000	\N	138	10	15	20
99	M99	NGC 4254	12h 18.8m	14°25	9.90	5.4x4.8	60,000,000	\N	138	8	15	20
100	M100	NGC 4321	12h 22.9m	15°49	9.30	7x6	60,000,000	\N	138	10	15	20
101	M101	NGC 5457	14h 3.2m	54°21	7.90	22	27,000,000	\N	129	10	15	20
102	M102	NGC 5866	15h 6.5m	55°46	9.90	5.2x2.3	40,000,000	\N	145	8	16	26
103	M103	NGC 581	1h 33.2m	60°42	7.40	6	8,000	\N	137	7	14	16
104	M104	NGC 4594	12h 40m	-11°37	8.00	9x4	50,000,000	\N	135	7	15	20
105	M105	NGC 3379	10h 47.8m	12°35	9.30	2	38,000,000	\N	140	6	15	23
106	M106	NGC 4258	12h 19m	47°18	8.40	19x8	25,000,000	\N	113	8	15	20
107	M107	NGC 6171	16h 32.5m	-13°3	7.90	10	19,600	\N	117	8	16	15
108	M108	NGC 3556	11h 11.5m	55°40	10.00	8x1	45,000,000	\N	129	8	15	20
109	M109	NGC 3992	11h 57.6m	53°23	9.80	7x4	55,000,000	\N	129	8	15	20
110	M110	NGC 205	0h 40.4m	41°41	8.50	17x10	2,900,000	\N	124	8	14	23
\.


--
-- TOC entry 3424 (class 0 OID 17738)
-- Dependencies: 213
-- Data for Name: constellations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.constellations (id, name) FROM stdin;
111	Taureau
112	Le Verseau
113	Les Chiens de chasse
114	Le Scorpion
115	Le Serpent
116	Sagittaire
117	Ophiucus
118	Le Bouclier
119	Hercule
120	Pégase
121	Petit Renard
122	Le Cygne
123	Capricorne
124	Andromède
125	Triangle
126	Persée
127	Gémeaux
128	Le Cocher
129	La Grande Ourse
130	Le Grand Chien
131	Orion
132	Cancer
133	Poupe
134	L'Hydre
135	La Vierge
136	Monocerus
137	Cassiopée
138	Chevelure de Bérénice
139	La Lyre
140	Le Lion
141	Sagitta
142	Poissons
143	Cetus
144	Le Lièvre
145	Le Dragon
146	Modéré
147	Facile
148	Difficile
149	Trés Facile
150	Trés Difficile
\.


--
-- TOC entry 3426 (class 0 OID 17742)
-- Dependencies: 215
-- Data for Name: observation_difficulties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.observation_difficulties (id, name) FROM stdin;
6	Modéré
7	Facile
8	Difficile
9	Trés Facile
10	Trés Difficile
\.


--
-- TOC entry 3428 (class 0 OID 17746)
-- Dependencies: 217
-- Data for Name: outing_has_celestial_object; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.outing_has_celestial_object (id, outing_id, celestial_object_id) FROM stdin;
\.


--
-- TOC entry 3430 (class 0 OID 17750)
-- Dependencies: 219
-- Data for Name: outings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.outings (id, theme, meeting_time, duration, place, equipment, max_people, remaining_slots, comment) FROM stdin;
\.


--
-- TOC entry 3432 (class 0 OID 17756)
-- Dependencies: 221
-- Data for Name: seasons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seasons (id, name) FROM stdin;
13	Hiver
14	Automne
15	Printemps
16	été
\.


--
-- TOC entry 3434 (class 0 OID 17760)
-- Dependencies: 223
-- Data for Name: tmp_celestial_objects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tmp_celestial_objects (id, messier_number, ngc_number, right_ascension, declination, apparent_magnitude, size, distance, picture, constellation, observation_difficulty, season, type) FROM stdin;
1	M1	NGC 1952	5h 34.5m	22°1	8.40	6.0x4.0	6,300	\N	Taureau	Modéré	Hiver	Reste de supernova
2	M2	NGC 7089	21h 33.5m	-0°49	6.50	12.9	37,500	\N	Le Verseau	Facile	Automne	Amas globulaire
3	M3	NGC 5272	13h 42.2m	28°23	6.20	16.2	33,900	\N	Les Chiens de chasse	Facile	Printemps	Amas globulaire
4	M4	NGC 6121	16h 23.6m	-26°32	5.60	26.3	7,200	\N	Le Scorpion	Difficile	été	Amas globulaire
5	M5	NGC 5904	15h 18.6m	2°5	5.60	17.4	24,500	\N	Le Serpent	Trés Facile	été	Amas globulaire
6	M6	NGC 6405	17h 40.1m	-32°13	5.30	25	2,000	\N	Le Scorpion	Facile	été	Amas ouverts
7	M7	NGC 6475	17h 53.9m	-34°49	4.10	80	800	\N	Le Scorpion	Facile	été	Amas ouverts
8	M8	NGC 6523	18h 3.8m	-24°23	6.00	90x40	5,200	\N	Sagittaire	Modéré	été	Nébuleuse diffuse
9	M9	NGC 6333	17h 19.2m	-18°31	7.70	9.3	26,700	\N	Ophiucus	Modéré	été	Amas globulaire
10	M10	NGC 6254	16h 57.1m	-4°6	6.60	15.1	14,400	\N	Ophiucus	Modéré	été	Amas globulaire
11	M11	NGC 6705	18h 51.1m	-6°16	6.30	14	6,000	\N	Le Bouclier	Trés Facile	été	Amas ouverts
12	M12	NGC 6218	16h 47.2m	-1°57	6.70	14.5	16,000	\N	Ophiucus	Modéré	été	Amas globulaire
13	M13	NGC 6205	16h 41.7m	36°28	5.80	16.6	22,800	\N	Hercule	Trés Facile	été	Amas globulaire
14	M14	NGC 6402	17h 37.6m	-3°15	7.60	11.7	27,400	\N	Ophiucus	Modéré	été	Amas globulaire
15	M15	NGC 7078	21h 30m	12°10	6.20	12.3	33,600	\N	Pégase	Facile	Automne	Amas globulaire
16	M16	NGC 6611	18h 18.8m	-13°47	6.40	7	7,000	\N	Le Serpent	Facile	été	Amas ouverts
17	M17	NGC 6618	18h 20.8m	-16°11	7.00	11	5,000	\N	Sagittaire	Facile	été	Nébuleuse diffuse
18	M18	NGC 6613	18h 19.9m	-17°8	7.50	9	4,900	\N	Sagittaire	Modéré	été	Amas ouverts
19	M19	NGC 6273	17h 2.6m	-26°16	6.80	13.5	27,100	\N	Ophiucus	Modéré	été	Amas globulaire
20	M20	NGC 6514	18h 2.3m	-23°2	9.00	28	5,200	\N	Sagittaire	Trés Difficile	été	Nébuleuse diffuse
21	M21	NGC 6531	18h 4.6m	-22°30	6.50	13	4,250	\N	Sagittaire	Modéré	été	Amas ouverts
22	M22	NGC 6656	18h 36.4m	-23°54	5.10	24	10,100	\N	Sagittaire	Trés Facile	été	Amas globulaire
23	M23	NGC 6494	17h 56.8m	-19°1	6.90	27	2,150	\N	Sagittaire	Facile	été	Amas ouverts
24	M24	NGC 6603	18h 18.4m	-18°25	4.60	90	10,000	\N	Sagittaire	Modéré	été	Nuage d'étoiles
25	M25	IC 4725	18h 31.7m	-19°14	6.50	40	2,000	\N	Sagittaire	Facile	été	Amas ouverts
26	M26	NGC 6694	18h 45.2m	-9°24	8.00	15	5,000	\N	Le Bouclier	Modéré	été	Amas ouverts
27	M27	NGC 6853	19h 59.6m	22°43	7.40	8.0x5.7	1,250	\N	Petit Renard	Facile	été	Nébuleuse planétaire
28	M28	NGC 6626	18h 24.5m	-24°52	6.80	11.2	17,900	\N	Sagittaire	Facile	été	Amas globulaire
29	M29	NGC 6913	20h 23.9m	38°32	7.10	7	4,000	\N	Le Cygne	Facile	été	Amas ouverts
30	M30	NGC 7099	21h 40.4m	-23°11	7.20	11	24,800	\N	Capricorne	Facile	Automne	Amas globulaire
31	M31	NGC 224	0h 42.7m	41°16	3.40	178x63	2,900,000	\N	Andromède	Facile	Automne	Galaxie spirale
32	M32	NGC 221 	0h 42.7m	40°52	8.10	8x6	2,900,000	\N	Andromède	Facile	Automne	Elliptical Galaxy
33	M33	NGC 598	1h 33.9m	30°39	5.70	73x45	3,000,000	\N	Triangle	Facile	Automne	Galaxie spirale
34	M34	NGC 1039	2h 42m	42°47	5.50	35	1,400	\N	Persée	Facile	Automne	Amas ouverts
35	M35	NGC 2168	6h 8.9m	24°20	5.30	28	2,800	\N	Gémeaux	Trés Facile	Hiver	Amas ouverts
36	M36	NGC 1960	5h 36.1m	34°8	6.30	12	4,100	\N	Le Cocher	Facile	Hiver	Amas ouverts
37	M37	NGC 2099	5h 52.4m	32°33	6.20	24	4,400	\N	Le Cocher	Facile	Hiver	Amas ouverts
38	M38	NGC 1912	5h 28.7m	35°50	7.40	21	4,200	\N	Le Cocher	Facile	Hiver	Amas ouverts
39	M39	NGC 7092	21h 32.2m	48°26	5.20	32	825	\N	Le Cygne	Facile	Automne	Amas ouverts
40	M40	Winecke 4	12h 22.2m	58°5	9.30	49	510	\N	La Grande Ourse	Facile	Printemps	Double Star
41	M41	NGC 2287	6h 47m	-20°44	4.60	38	2,300	\N	Le Grand Chien	Facile	Hiver	Amas ouverts
42	M42	NGC 1976	5h 35.4m	-5°27	4.00	85x60	1,600	\N	Orion	Trés Facile	Hiver	Nébuleuse diffuse
43	M43	NGC 1982	5h 35.6m	-5°16	9.00	20x15	1,600	\N	Orion	Facile	Hiver	Nébuleuse diffuse
44	M44	NGC 2632	8h 40.1m	19°59	3.70	95	577	\N	Cancer	Facile	Hiver	Amas ouverts
45	M45	\N	3h 47m	24°7.2	1.60	110	380	\N	Taureau	Trés Facile	Hiver	Amas ouverts
46	M46	NGC 2437	7h 41.8m	-14°49	6.00	27	5,400	\N	Poupe	Facile	Hiver	Amas ouverts
47	M47	NGC 2422	7h 36.6m	-14°30	5.20	30	1,600	\N	Poupe	Facile	Hiver	Amas ouverts
48	M48	NGC 2548	8h 13.8m	-5°48	5.50	54	1,500	\N	L'Hydre	Facile	Hiver	Amas ouverts
49	M49	NGC 4472	12h 29.8m	8°0	8.40	9x7.5	60,000,000	\N	La Vierge	Modéré	Printemps	Galaxie elliptique
50	M50	NGC 2323	7h 3.2m	-8°20	6.30	16	3,000	\N	Monocerus	Facile	Hiver	Amas ouverts
51	M51	NGC 5194	13h 29.9m	47°12	8.40	11x7	37,000,000	\N	Les Chiens de chasse	Modéré	Printemps	Galaxie spirale
52	M52	NGC 7654	23h 24.2m	61°35	7.30	13	5,000	\N	Cassiopée	Facile	Automne	Amas ouverts
53	M53	NGC 5024	13h 12.9m	18°10	7.60	12.6	56,400	\N	Chevelure de Bérénice	Facile	Printemps	Amas globulaire
54	M54	NGC 6715	18h 55.1m	-30°29	7.60	9.1	82,800	\N	Sagittaire	Modéré	été	Amas globulaire
55	M55	NGC 6809	19h 40m	-30°58	6.30	19	16,600	\N	Sagittaire	Difficile	été	Amas globulaire
56	M56	NGC 6779	19h 16.6m	30°11	8.30	7.1	31,600	\N	La Lyre	Modéré	été	Amas globulaire
57	M57	NGC 6720	18h 53.6m	33°2	8.80	1.4x1	4,100	\N	La Lyre	Facile	été	Nébuleuse planétaire
58	M58	NGC 4579	12h 37.7m	11°49	9.70	5.5x4.5	60,000,000	\N	La Vierge	Modéré	Printemps	Galaxie spirale
59	M59	NGC 4621	12h 42m	11°39	9.60	5x3.5	60,000,000	\N	La Vierge	Difficile	Printemps	Galaxie elliptique
60	M60	NGC 4649	12h 43.7m	11°33	8.80	7x6	60,000,000	\N	La Vierge	Modéré	Printemps	Galaxie elliptique
61	M61	NGC 4303	12h 21.9m	4°28	9.70	6x5.5	60,000,000	\N	La Vierge	Difficile	Printemps	Galaxie spirale
62	M62	NGC 6266	17h 1.2m	-30°7	6.50	14.1	21,500	\N	Ophiucus	Modéré	été	Amas globulaire
63	M63	NGC 5055	13h 15.8m	42°2	8.60	10x6	37,000,000	\N	Les Chiens de chasse	Modéré	Printemps	Galaxie spirale
64	M64	NGC 4826	12h 56.7m	21°41	8.50	9.3x5.4	19,000,000	\N	Chevelure de Bérénice	Modéré	Printemps	Galaxie spirale
65	M65	NGC 3623	11h 18.9m	13°5	9.30	8x1.5	35,000,000	\N	Le Lion	Modéré	Printemps	Galaxie spirale
66	M66	NGC 3627	11h 20.2m	12°59	8.90	8x2.5	35,000,000	\N	Le Lion	Facile	Printemps	Galaxie spirale
67	M67	NGC 2682	8h 50.4m	11°49	6.10	30	2,700	\N	Cancer	Facile	Hiver	Amas ouverts
68	M68	NGC 4590	12h 39.5m	-26°45	7.80	12	33,300	\N	L'Hydre	Trés Difficile	Printemps	Amas globulaire
69	M69	NGC 6637	18h 31.4m	-32°21	7.60	7.1	26,700	\N	Sagittaire	Modéré	été	Amas globulaire
70	M70	NGC 6681	18h 43.2m	-32°18	7.90	7.8	28,000	\N	Sagittaire	Modéré	été	Amas globulaire
71	M71	NGC 6838	19h 53.8m	18°47	8.30	7.2	11,700	\N	Sagitta	Modéré	été	Amas globulaire
72	M72	NGC 6981	20h 53.5m	-12°32	9.30	5.9	52,800	\N	Le Verseau	Modéré	été	Amas globulaire
73	M73	NGC 6994	20h 59m	-12°38	9.00	2.8	2,000	\N	Le Verseau	Difficile	été	Group/Asterism
74	M74	NGC 628	1h 36.7m	15°47	9.40	10.2x9.5	35,000,000	\N	Poissons	Trés Difficile	Automne	Galaxie spirale
75	M75	NGC 6864	20h 6.1m	-21°55	8.50	6	57,700	\N	Sagittaire	Modéré	été	Amas globulaire
76	M76	NGC 650	1h 42.3m	51°34	10.10	2.7x1.8	3,400	\N	Persée	Modéré	Automne	Nébuleuse planétaire
77	M77	NGC 1068	2h 42.7m	0°1	8.90	7x6	60,000,000	\N	Cetus	Modéré	Automne	Galaxie spirale
78	M78	NGC 2068	5h 46.7m	0°3	8.30	8x6	1,600	\N	Orion	Modéré	Hiver	Nébuleuse diffuse
79	M79	NGC 1904	5h 24.5m	-24°33	7.70	8.7	41,100	\N	Le Lièvre	Modéré	Hiver	Amas globulaire
80	M80	NGC 6093	16h 17m	-22°59	7.30	8.9	27,400	\N	Le Scorpion	Facile	été	Amas globulaire
81	M81	NGC 3031	9h 55.6m	69°4	6.90	21x10	12,000,000	\N	La Grande Ourse	Facile	Printemps	Galaxie spirale
82	M82	NGC 3034	9h 55.8m	69°41	8.40	9.x4	12,000,000	\N	La Grande Ourse	Facile	Printemps	Galaxie irrégulière
83	M83	NGC 5236	13h 37m	-29°52	7.60	11x10	15,000,000	\N	L'Hydre	Difficile	Printemps	Galaxie spirale
84	M84	NGC 4374	12h 25.1m	12°53	9.10	5	60,000,000	\N	La Vierge	Modéré	Printemps	Galaxie lenticulaire (S0)
85	M85	NGC 4382	12h 25.4m	18°11	9.10	7.1x5.2	60,000,000	\N	Chevelure de Bérénice	Modéré	Printemps	Galaxie lenticulaire (S0)
86	M86	NGC 4406	12h 26.2m	12°57	8.90	7.5x5.5	60,000,000	\N	La Vierge	Modéré	Printemps	Galaxie lenticulaire (S0)
87	M87	NGC 4486	12h 30.8m	12°24	8.60	7	60,000,000	\N	La Vierge	Modéré	Printemps	Galaxie elliptique
88	M88	NGC 4501	12h 32m	14°25	9.60	7x4	60,000,000	\N	Chevelure de Bérénice	Modéré	Printemps	Galaxie spirale
89	M89	NGC 4552	12h 35.7m	12°33	9.80	4	60,000,000	\N	La Vierge	Modéré	Printemps	Galaxie elliptique
90	M90	NGC 4569	12h 36.8m	13°10	9.50	9.5x4.5	60,000,000	\N	La Vierge	Difficile	Printemps	Galaxie spirale
91	M91	NGC 4548	12h 35.4m	14°30	10.20	5.4x4.4	60,000,000	\N	Chevelure de Bérénice	Trés Difficile	Printemps	Galaxie spirale
92	M92	NGC 6341	17h 17.1m	43°8	6.40	11.2	26,400	\N	Hercule	Facile	été	Amas globulaire
93	M93	NGC 2447	7h 44.6m	-23°52	6.00	22	3,600	\N	Poupe	Facile	Hiver	Amas ouverts
94	M94	NGC 4736	12h 50.9m	41°7	8.20	7x3	14,500,000	\N	Les Chiens de chasse	Modéré	Printemps	Galaxie spirale
95	M95	NGC 3351	10h 44m	11°42	9.70	4.4x3.3	38,000,000	\N	Le Lion	Difficile	Printemps	Galaxie spirale
96	M96	NGC 3368	10h 46.8m	11°49	9.20	6x4	38,000,000	\N	Le Lion	Modéré	Printemps	Galaxie spirale
97	M97	NGC 3587	11h 14.8m	55°1	9.90	3.4x3.3	2,600	\N	La Grande Ourse	Trés Difficile	Printemps	Nébuleuse planétaire
98	M98	NGC 4192	12h 13.8m	14°54	10.10	9.5x3.2	60,000,000	\N	Chevelure de Bérénice	Trés Difficile	Printemps	Galaxie spirale
99	M99	NGC 4254	12h 18.8m	14°25	9.90	5.4x4.8	60,000,000	\N	Chevelure de Bérénice	Difficile	Printemps	Galaxie spirale
100	M100	NGC 4321	12h 22.9m	15°49	9.30	7x6	60,000,000	\N	Chevelure de Bérénice	Trés Difficile	Printemps	Galaxie spirale
101	M101	NGC 5457	14h 3.2m	54°21	7.90	22	27,000,000	\N	La Grande Ourse	Trés Difficile	Printemps	Galaxie spirale
102	M102	NGC 5866	15h 6.5m	55°46	9.90	5.2x2.3	40,000,000	\N	Le Dragon	Difficile	été	Galaxie lenticulaire (S0)
103	M103	NGC 581	1h 33.2m	60°42	7.40	6	8,000	\N	Cassiopée	Facile	Automne	Amas ouverts
104	M104	NGC 4594	12h 40m	-11°37	8.00	9x4	50,000,000	\N	La Vierge	Facile	Printemps	Galaxie spirale
105	M105	NGC 3379	10h 47.8m	12°35	9.30	2	38,000,000	\N	Le Lion	Modéré	Printemps	Galaxie elliptique
106	M106	NGC 4258	12h 19m	47°18	8.40	19x8	25,000,000	\N	Les Chiens de chasse	Difficile	Printemps	Galaxie spirale
107	M107	NGC 6171	16h 32.5m	-13°3	7.90	10	19,600	\N	Ophiucus	Difficile	été	Amas globulaire
108	M108	NGC 3556	11h 11.5m	55°40	10.00	8x1	45,000,000	\N	La Grande Ourse	Difficile	Printemps	Galaxie spirale
109	M109	NGC 3992	11h 57.6m	53°23	9.80	7x4	55,000,000	\N	La Grande Ourse	Difficile	Printemps	Galaxie spirale
110	M110	NGC 205	0h 40.4m	41°41	8.50	17x10	2,900,000	\N	Andromède	Difficile	Automne	Galaxie elliptique
\.


--
-- TOC entry 3443 (class 0 OID 17894)
-- Dependencies: 232
-- Data for Name: tmp_pictures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tmp_pictures (id, messier_number, picture) FROM stdin;
207	M1	assets/Messier-1-Crab-Nebula-1.webp
208	M2	assets/Messier-2.webp
209	M3	assets/Messier-3.webp
210	M4	assets/Messier-4.webp
211	M5	assets/Messier-5.webp
212	M6	assets/Messier-6-Butterfly-Cluster.webp
213	M7	assets/Messier-7-Ptolemy-Cluster.webp
214	M8	assets/Messier-8-Lagoon-Nebula.webp
215	M9	assets/Messier-9.webp
216	M10	assets/Messier-10.webp
217	M11	assets/Messier-11-Wild-Duck-Cluster.webp
218	M12	assets/Messier-12.webp
219	M13	assets/Messier-13-Hercules-Globular-Cluster.webp
220	M14	assets/Messier-14.webp
221	M15	assets/Messier-15-Great-Pegasus-Cluster.webp
222	M16	assets/Messier-16-Eagle-Nebula.webp
223	M17	assets/Messier-17-Omega-Nebula.webp
224	M18	assets/Messier-18.webp
225	M19	assets/Messier-19.webp
226	M20	assets/Messier-20-Trifid-Nebula.webp
227	M21	assets/Messier-21.webp
228	M22	assets/Messier-22-Sagittarius-Cluster.webp
229	M23	assets/Messier-23.webp
230	M24	assets/Messier-24-Small-Sagittarius-Star-Cloud.webp
231	M25	assets/Messier-25.webp
232	M26	assets/Messier-26.webp
233	M27	assets/Messier-27-Dumbbell-Nebula.webp
234	M28	assets/Messier-28.webp
235	M29	assets/Messier-29-Cooling-Tower.webp
236	M30	assets/Messier-30.webp
237	M31	assets/Messier-31-Andromeda-Galaxy.webp
238	M32	assets/Messier-32.webp
239	M33	assets/Messier-33-Triangulum-Galaxy.webp
240	M34	assets/Messier-34.webp
241	M35	assets/Messier-35-and-NGC-2158.webp
242	M36	assets/Messier-36-Pinwheel-Cluster.webp
243	M37	assets/Messier-37.webp
244	M38	assets/Messier-38-Starfish-Cluster.webp
245	M39	assets/Messier-39.webp
246	M40	assets/Messier-40-Winnecke-4.webp
247	M41	assets/Messier-41.webp
248	M42	assets/Messier-42-Orion-Nebula.webp
249	M43	assets/Messier-43-De-Mairans-Nebula.webp
250	M44	assets/Messier-44-Beehive-Cluster.webp
251	M45	assets/Messier-45-Pleiades.webp
252	M46	assets/Messier-46.webp
253	M47	assets/Messier-47.webp
254	M48	assets/Messier-48.webp
255	M49	assets/Messier-49.webp
256	M50	assets/Messier-50.webp
257	M51	assets/Messier-51-Whirlpool-Galaxy.webp
258	M52	assets/Messier-52.webp
259	M53	assets/Messier-53.webp
260	M54	assets/Messier-54.webp
261	M55	assets/Messier-55.webp
262	M56	assets/Messier-56.webp
263	M57	assets/Messier-57-Ring-Nebula.webp
264	M58	assets/Messier-58.webp
265	M59	assets/Messier-59.webp
266	M60	assets/Messier-60.webp
267	M61	assets/Messier-61.webp
268	M62	assets/Messier-62.webp
269	M63	assets/Messier-63-Sunflower-Galaxy.webp
270	M64	assets/Messier-64-Black-Eye-Galaxy.webp
271	M65	assets/Messier-65.webp
272	M66	assets/Messier-66.webp
273	M67	assets/Messier-67.webp
274	M68	assets/Messier-68.webp
275	M69	assets/Messier-69.webp
276	M70	assets/Messier-70.webp
277	M71	assets/Messier-71.webp
278	M72	assets/Messier-72.webp
279	M73	assets/Messier-73.webp
280	M74	assets/Messier-74-Phantom-Galaxy.webp
281	M75	assets/Messier-75.webp
282	M76	assets/Messier-76-Little-Dumbbell-Nebula.webp
283	M77	assets/Messier-77-Cetus-A.webp
284	M78	assets/Messier-78.webp
285	M79	assets/Messier-79.webp
286	M80	assets/Messier-80.webp
287	M81	assets/Messier-81-Bodes-Galaxy.webp
288	M82	assets/Messier-82-Cigar-Galaxy.webp
289	M83	assets/Messier-83-Southern-Pinwheel-Galaxy.webp
290	M84	assets/Messier-84.webp
291	M85	assets/Messier-85.webp
292	M86	assets/Messier-86.webp
293	M87	assets/Messier-87-Virgo-A.webp
294	M88	assets/Messier-88.webp
295	M89	assets/Messier-89.webp
296	M90	assets/Messier-90.webp
297	M91	assets/Messier-91.webp
298	M92	assets/Messier-92.webp
299	M93	assets/Messier-93.webp
300	M94	assets/Messier-94-Cats-Eye-Galaxy.webp
301	M95	assets/Messier-95.webp
302	M96	assets/Messier-96.webp
303	M97	assets/Messier-97-Owl-Nebula.webp
304	M98	assets/Messier-98.webp
305	M99	assets/Messier-99-Coma-Pinwheel-Galaxy.webp
306	M100	assets/Messier-100.webp
307	M101	assets/Messier-101-Pinwheel-Galaxy.webp
308	M102	assets/Messier-102-Spindle-Galaxy.webp
309	M103	assets/Messier-103.webp
310	M104	assets/Messier-104-Sombrero-Galaxy.webp
311	M105	assets/Messier-105.webp
312	M106	assets/Messier-106.webp
313	M107	assets/Messier-107.webp
314	M108	assets/Messier-108.webp
315	M109	assets/Messier-109.webp
316	M110	assets/Messier-110.webp
\.


--
-- TOC entry 3436 (class 0 OID 17764)
-- Dependencies: 225
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.types (id, name) FROM stdin;
14	Reste de supernova
15	Amas globulaire
16	Amas ouverts
17	Nébuleuse diffuse
18	Nuage d'étoiles
19	Nébuleuse planétaire
20	Galaxie spirale
21	Elliptical Galaxy
22	Double Star
23	Galaxie elliptique
24	Group/Asterism
25	Galaxie irrégulière
26	Galaxie lenticulaire (S0)
\.


--
-- TOC entry 3438 (class 0 OID 17768)
-- Dependencies: 227
-- Data for Name: user_has_outing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_has_outing (id, user_id, outing_id) FROM stdin;
\.


--
-- TOC entry 3440 (class 0 OID 17772)
-- Dependencies: 229
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, firstname, lastname, age, phone_number) FROM stdin;
\.


--
-- TOC entry 3462 (class 0 OID 0)
-- Dependencies: 210
-- Name: administrators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.administrators_id_seq', 1, false);


--
-- TOC entry 3463 (class 0 OID 0)
-- Dependencies: 212
-- Name: celestial_objects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.celestial_objects_id_seq', 111, true);


--
-- TOC entry 3464 (class 0 OID 0)
-- Dependencies: 214
-- Name: constellations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.constellations_id_seq', 220, true);


--
-- TOC entry 3465 (class 0 OID 0)
-- Dependencies: 216
-- Name: observation_difficulties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.observation_difficulties_id_seq', 10, true);


--
-- TOC entry 3466 (class 0 OID 0)
-- Dependencies: 218
-- Name: outing_has_celestial_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.outing_has_celestial_object_id_seq', 1, false);


--
-- TOC entry 3467 (class 0 OID 0)
-- Dependencies: 220
-- Name: outings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.outings_id_seq', 1, false);


--
-- TOC entry 3468 (class 0 OID 0)
-- Dependencies: 222
-- Name: seasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seasons_id_seq', 16, true);


--
-- TOC entry 3469 (class 0 OID 0)
-- Dependencies: 224
-- Name: tmp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tmp_id_seq', 110, true);


--
-- TOC entry 3470 (class 0 OID 0)
-- Dependencies: 231
-- Name: tmp_pictures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tmp_pictures_id_seq', 316, true);


--
-- TOC entry 3471 (class 0 OID 0)
-- Dependencies: 226
-- Name: types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.types_id_seq', 26, true);


--
-- TOC entry 3472 (class 0 OID 0)
-- Dependencies: 228
-- Name: user_has_outing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_has_outing_id_seq', 1, false);


--
-- TOC entry 3473 (class 0 OID 0)
-- Dependencies: 230
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- TOC entry 3232 (class 2606 OID 17788)
-- Name: administrators administrators_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrators
    ADD CONSTRAINT administrators_pkey PRIMARY KEY (id);


--
-- TOC entry 3236 (class 2606 OID 17790)
-- Name: celestial_objects celestial_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.celestial_objects
    ADD CONSTRAINT celestial_objects_pkey PRIMARY KEY (id);


--
-- TOC entry 3240 (class 2606 OID 17792)
-- Name: constellations constellations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constellations
    ADD CONSTRAINT constellations_pkey PRIMARY KEY (id);


--
-- TOC entry 3244 (class 2606 OID 17794)
-- Name: observation_difficulties observation_difficulties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observation_difficulties
    ADD CONSTRAINT observation_difficulties_pkey PRIMARY KEY (id);


--
-- TOC entry 3248 (class 2606 OID 17796)
-- Name: outing_has_celestial_object outing_has_celestial_object_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outing_has_celestial_object
    ADD CONSTRAINT outing_has_celestial_object_pkey PRIMARY KEY (id);


--
-- TOC entry 3250 (class 2606 OID 17798)
-- Name: outings outings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outings
    ADD CONSTRAINT outings_pkey PRIMARY KEY (id);


--
-- TOC entry 3254 (class 2606 OID 17800)
-- Name: seasons seasons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seasons
    ADD CONSTRAINT seasons_pkey PRIMARY KEY (id);


--
-- TOC entry 3272 (class 2606 OID 17899)
-- Name: tmp_pictures tmp_pictures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tmp_pictures
    ADD CONSTRAINT tmp_pictures_pkey PRIMARY KEY (id);


--
-- TOC entry 3258 (class 2606 OID 17802)
-- Name: tmp_celestial_objects tmp_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tmp_celestial_objects
    ADD CONSTRAINT tmp_pkey PRIMARY KEY (id);


--
-- TOC entry 3262 (class 2606 OID 17804)
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);


--
-- TOC entry 3234 (class 2606 OID 17806)
-- Name: administrators unique_administrator; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrators
    ADD CONSTRAINT unique_administrator UNIQUE (email);


--
-- TOC entry 3238 (class 2606 OID 17808)
-- Name: celestial_objects unique_celestial_object; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.celestial_objects
    ADD CONSTRAINT unique_celestial_object UNIQUE (messier_number);


--
-- TOC entry 3242 (class 2606 OID 17810)
-- Name: constellations unique_constellation; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constellations
    ADD CONSTRAINT unique_constellation UNIQUE (name);


--
-- TOC entry 3246 (class 2606 OID 17812)
-- Name: observation_difficulties unique_observation_difficulty; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observation_difficulties
    ADD CONSTRAINT unique_observation_difficulty UNIQUE (name);


--
-- TOC entry 3252 (class 2606 OID 17814)
-- Name: outings unique_outing; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outings
    ADD CONSTRAINT unique_outing UNIQUE (theme, meeting_time);


--
-- TOC entry 3256 (class 2606 OID 17816)
-- Name: seasons unique_season; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seasons
    ADD CONSTRAINT unique_season UNIQUE (name);


--
-- TOC entry 3260 (class 2606 OID 17818)
-- Name: tmp_celestial_objects unique_tmp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tmp_celestial_objects
    ADD CONSTRAINT unique_tmp UNIQUE (messier_number);


--
-- TOC entry 3264 (class 2606 OID 17820)
-- Name: types unique_type; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT unique_type UNIQUE (name);


--
-- TOC entry 3268 (class 2606 OID 17822)
-- Name: users unique_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_user UNIQUE (email);


--
-- TOC entry 3266 (class 2606 OID 17824)
-- Name: user_has_outing user_has_outing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_has_outing
    ADD CONSTRAINT user_has_outing_pkey PRIMARY KEY (id);


--
-- TOC entry 3270 (class 2606 OID 17826)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3273 (class 2606 OID 17827)
-- Name: celestial_objects celestial_objects_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.celestial_objects
    ADD CONSTRAINT celestial_objects_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellations(id) NOT VALID;


--
-- TOC entry 3274 (class 2606 OID 17832)
-- Name: celestial_objects celestial_objects_observation_difficulty_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.celestial_objects
    ADD CONSTRAINT celestial_objects_observation_difficulty_id_fkey FOREIGN KEY (observation_difficulty_id) REFERENCES public.observation_difficulties(id) NOT VALID;


--
-- TOC entry 3275 (class 2606 OID 17837)
-- Name: celestial_objects celestial_objects_season_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.celestial_objects
    ADD CONSTRAINT celestial_objects_season_id_fkey FOREIGN KEY (season_id) REFERENCES public.seasons(id) NOT VALID;


--
-- TOC entry 3276 (class 2606 OID 17842)
-- Name: celestial_objects celestial_objects_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.celestial_objects
    ADD CONSTRAINT celestial_objects_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.types(id) NOT VALID;


--
-- TOC entry 3277 (class 2606 OID 17847)
-- Name: outing_has_celestial_object outing_has_celestial_object_celestial_object_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outing_has_celestial_object
    ADD CONSTRAINT outing_has_celestial_object_celestial_object_id_fkey FOREIGN KEY (celestial_object_id) REFERENCES public.celestial_objects(id) NOT VALID;


--
-- TOC entry 3278 (class 2606 OID 17852)
-- Name: outing_has_celestial_object outing_has_celestial_object_outing_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outing_has_celestial_object
    ADD CONSTRAINT outing_has_celestial_object_outing_id_fkey FOREIGN KEY (outing_id) REFERENCES public.outings(id) NOT VALID;


--
-- TOC entry 3279 (class 2606 OID 17857)
-- Name: user_has_outing user_has_outing_outing_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_has_outing
    ADD CONSTRAINT user_has_outing_outing_id_fkey FOREIGN KEY (outing_id) REFERENCES public.outings(id) NOT VALID;


--
-- TOC entry 3280 (class 2606 OID 17862)
-- Name: user_has_outing user_has_outing_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_has_outing
    ADD CONSTRAINT user_has_outing_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


-- Completed on 2022-05-12 11:46:31

--
-- PostgreSQL database dump complete
--

