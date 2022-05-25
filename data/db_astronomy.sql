--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2
-- Dumped by pg_dump version 14.2

-- Started on 2022-05-25 10:06:56

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

--
-- TOC entry 2 (class 3079 OID 19757)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 19767)
-- Name: administrators; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.administrators (
    id integer NOT NULL,
    email character varying(100) NOT NULL,
    password character varying(64) NOT NULL
);


ALTER TABLE public.administrators OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 19770)
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
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 211
-- Name: administrators_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.administrators_id_seq OWNED BY public.administrators.id;


--
-- TOC entry 212 (class 1259 OID 19771)
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
-- TOC entry 213 (class 1259 OID 19774)
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
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 213
-- Name: celestial_objects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.celestial_objects_id_seq OWNED BY public.celestial_objects.id;


--
-- TOC entry 214 (class 1259 OID 19775)
-- Name: constellations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.constellations (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.constellations OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 19778)
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
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 215
-- Name: constellations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.constellations_id_seq OWNED BY public.constellations.id;


--
-- TOC entry 216 (class 1259 OID 19779)
-- Name: observation_difficulties; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.observation_difficulties (
    id integer NOT NULL,
    name character varying(15) NOT NULL
);


ALTER TABLE public.observation_difficulties OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 19782)
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
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 217
-- Name: observation_difficulties_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.observation_difficulties_id_seq OWNED BY public.observation_difficulties.id;


--
-- TOC entry 218 (class 1259 OID 19783)
-- Name: outing_has_celestial_object; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.outing_has_celestial_object (
    id integer NOT NULL,
    outing_id integer NOT NULL,
    celestial_object_id integer NOT NULL
);


ALTER TABLE public.outing_has_celestial_object OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 19786)
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
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 219
-- Name: outing_has_celestial_object_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.outing_has_celestial_object_id_seq OWNED BY public.outing_has_celestial_object.id;


--
-- TOC entry 220 (class 1259 OID 19787)
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
-- TOC entry 221 (class 1259 OID 19792)
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
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 221
-- Name: outings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.outings_id_seq OWNED BY public.outings.id;


--
-- TOC entry 222 (class 1259 OID 19793)
-- Name: seasons; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.seasons (
    id integer NOT NULL,
    name character varying(10) NOT NULL
);


ALTER TABLE public.seasons OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 19796)
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
-- TOC entry 3435 (class 0 OID 0)
-- Dependencies: 223
-- Name: seasons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.seasons_id_seq OWNED BY public.seasons.id;


--
-- TOC entry 224 (class 1259 OID 19797)
-- Name: types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.types (
    id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.types OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 19800)
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
-- TOC entry 3436 (class 0 OID 0)
-- Dependencies: 225
-- Name: types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.types_id_seq OWNED BY public.types.id;


--
-- TOC entry 226 (class 1259 OID 19801)
-- Name: user_has_outing; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_has_outing (
    id integer NOT NULL,
    user_id integer NOT NULL,
    outing_id integer NOT NULL
);


ALTER TABLE public.user_has_outing OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 19804)
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
-- TOC entry 3437 (class 0 OID 0)
-- Dependencies: 227
-- Name: user_has_outing_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_has_outing_id_seq OWNED BY public.user_has_outing.id;


--
-- TOC entry 228 (class 1259 OID 19805)
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
-- TOC entry 229 (class 1259 OID 19808)
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
-- TOC entry 3438 (class 0 OID 0)
-- Dependencies: 229
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 3210 (class 2604 OID 19809)
-- Name: administrators id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrators ALTER COLUMN id SET DEFAULT nextval('public.administrators_id_seq'::regclass);


--
-- TOC entry 3211 (class 2604 OID 19810)
-- Name: celestial_objects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.celestial_objects ALTER COLUMN id SET DEFAULT nextval('public.celestial_objects_id_seq'::regclass);


--
-- TOC entry 3212 (class 2604 OID 19811)
-- Name: constellations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constellations ALTER COLUMN id SET DEFAULT nextval('public.constellations_id_seq'::regclass);


--
-- TOC entry 3213 (class 2604 OID 19812)
-- Name: observation_difficulties id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observation_difficulties ALTER COLUMN id SET DEFAULT nextval('public.observation_difficulties_id_seq'::regclass);


--
-- TOC entry 3214 (class 2604 OID 19813)
-- Name: outing_has_celestial_object id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outing_has_celestial_object ALTER COLUMN id SET DEFAULT nextval('public.outing_has_celestial_object_id_seq'::regclass);


--
-- TOC entry 3215 (class 2604 OID 19814)
-- Name: outings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outings ALTER COLUMN id SET DEFAULT nextval('public.outings_id_seq'::regclass);


--
-- TOC entry 3216 (class 2604 OID 19815)
-- Name: seasons id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seasons ALTER COLUMN id SET DEFAULT nextval('public.seasons_id_seq'::regclass);


--
-- TOC entry 3217 (class 2604 OID 19816)
-- Name: types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types ALTER COLUMN id SET DEFAULT nextval('public.types_id_seq'::regclass);


--
-- TOC entry 3218 (class 2604 OID 19817)
-- Name: user_has_outing id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_has_outing ALTER COLUMN id SET DEFAULT nextval('public.user_has_outing_id_seq'::regclass);


--
-- TOC entry 3219 (class 2604 OID 19818)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3403 (class 0 OID 19767)
-- Dependencies: 210
-- Data for Name: administrators; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.administrators (id, email, password) FROM stdin;
1	admin@mail.com	97c94ebe5d767a353b77f3c0ce2d429741f2e8c99473c3c150e2faa3d14c9da6
\.


--
-- TOC entry 3405 (class 0 OID 19771)
-- Dependencies: 212
-- Data for Name: celestial_objects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.celestial_objects (id, messier_number, ngc_number, right_ascension, declination, apparent_magnitude, size, distance, picture, constellation_id, observation_difficulty_id, season_id, type_id) FROM stdin;
111	M1	NGC 1952	5h 34.5m	22°1	8.40	6.0x4.0	6,300	assets/Messier-1-Crab-Nebula-1.webp	1	1	1	1
112	M2	NGC 7089	21h 33.5m	-0°49	6.50	12.9	37,500	assets/Messier-2.webp	2	2	2	2
113	M3	NGC 5272	13h 42.2m	28°23	6.20	16.2	33,900	assets/Messier-3.webp	3	2	3	2
114	M4	NGC 6121	16h 23.6m	-26°32	5.60	26.3	7,200	assets/Messier-4.webp	4	3	4	2
115	M5	NGC 5904	15h 18.6m	2°5	5.60	17.4	24,500	assets/Messier-5.webp	5	4	4	2
116	M6	NGC 6405	17h 40.1m	-32°13	5.30	25	2,000	assets/Messier-6-Butterfly-Cluster.webp	4	2	4	3
117	M7	NGC 6475	17h 53.9m	-34°49	4.10	80	800	assets/Messier-7-Ptolemy-Cluster.webp	4	2	4	3
118	M8	NGC 6523	18h 3.8m	-24°23	6.00	90x40	5,200	assets/Messier-8-Lagoon-Nebula.webp	6	1	4	4
119	M9	NGC 6333	17h 19.2m	-18°31	7.70	9.3	26,700	assets/Messier-9.webp	7	1	4	2
120	M10	NGC 6254	16h 57.1m	-4°6	6.60	15.1	14,400	assets/Messier-10.webp	7	1	4	2
121	M11	NGC 6705	18h 51.1m	-6°16	6.30	14	6,000	assets/Messier-11-Wild-Duck-Cluster.webp	8	4	4	3
122	M12	NGC 6218	16h 47.2m	-1°57	6.70	14.5	16,000	assets/Messier-12.webp	7	1	4	2
123	M13	NGC 6205	16h 41.7m	36°28	5.80	16.6	22,800	assets/Messier-13-Hercules-Globular-Cluster.webp	9	4	4	2
124	M14	NGC 6402	17h 37.6m	-3°15	7.60	11.7	27,400	assets/Messier-14.webp	7	1	4	2
125	M15	NGC 7078	21h 30m	12°10	6.20	12.3	33,600	assets/Messier-15-Great-Pegasus-Cluster.webp	10	2	2	2
126	M16	NGC 6611	18h 18.8m	-13°47	6.40	7	7,000	assets/Messier-16-Eagle-Nebula.webp	5	2	4	3
127	M17	NGC 6618	18h 20.8m	-16°11	7.00	11	5,000	assets/Messier-17-Omega-Nebula.webp	6	2	4	4
128	M18	NGC 6613	18h 19.9m	-17°8	7.50	9	4,900	assets/Messier-18.webp	6	1	4	3
129	M19	NGC 6273	17h 2.6m	-26°16	6.80	13.5	27,100	assets/Messier-19.webp	7	1	4	2
130	M20	NGC 6514	18h 2.3m	-23°2	9.00	28	5,200	assets/Messier-20-Trifid-Nebula.webp	6	5	4	4
131	M21	NGC 6531	18h 4.6m	-22°30	6.50	13	4,250	assets/Messier-21.webp	6	1	4	3
132	M22	NGC 6656	18h 36.4m	-23°54	5.10	24	10,100	assets/Messier-22-Sagittarius-Cluster.webp	6	4	4	2
133	M23	NGC 6494	17h 56.8m	-19°1	6.90	27	2,150	assets/Messier-23.webp	6	2	4	3
134	M24	NGC 6603	18h 18.4m	-18°25	4.60	90	10,000	assets/Messier-24-Small-Sagittarius-Star-Cloud.webp	6	1	4	5
135	M25	IC 4725	18h 31.7m	-19°14	6.50	40	2,000	assets/Messier-25.webp	6	2	4	3
136	M26	NGC 6694	18h 45.2m	-9°24	8.00	15	5,000	assets/Messier-26.webp	8	1	4	3
137	M27	NGC 6853	19h 59.6m	22°43	7.40	8.0x5.7	1,250	assets/Messier-27-Dumbbell-Nebula.webp	11	2	4	6
138	M28	NGC 6626	18h 24.5m	-24°52	6.80	11.2	17,900	assets/Messier-28.webp	6	2	4	2
139	M29	NGC 6913	20h 23.9m	38°32	7.10	7	4,000	assets/Messier-29-Cooling-Tower.webp	12	2	4	3
140	M30	NGC 7099	21h 40.4m	-23°11	7.20	11	24,800	assets/Messier-30.webp	13	2	2	2
141	M31	NGC 224	0h 42.7m	41°16	3.40	178x63	2,900,000	assets/Messier-31-Andromeda-Galaxy.webp	14	2	2	7
142	M32	NGC 221 	0h 42.7m	40°52	8.10	8x6	2,900,000	assets/Messier-32.webp	14	2	2	8
143	M33	NGC 598	1h 33.9m	30°39	5.70	73x45	3,000,000	assets/Messier-33-Triangulum-Galaxy.webp	15	2	2	7
144	M34	NGC 1039	2h 42m	42°47	5.50	35	1,400	assets/Messier-34.webp	16	2	2	3
145	M35	NGC 2168	6h 8.9m	24°20	5.30	28	2,800	assets/Messier-35-and-NGC-2158.webp	17	4	1	3
146	M36	NGC 1960	5h 36.1m	34°8	6.30	12	4,100	assets/Messier-36-Pinwheel-Cluster.webp	18	2	1	3
147	M37	NGC 2099	5h 52.4m	32°33	6.20	24	4,400	assets/Messier-37.webp	18	2	1	3
148	M38	NGC 1912	5h 28.7m	35°50	7.40	21	4,200	assets/Messier-38-Starfish-Cluster.webp	18	2	1	3
149	M39	NGC 7092	21h 32.2m	48°26	5.20	32	825	assets/Messier-39.webp	12	2	2	3
150	M40	Winecke 4	12h 22.2m	58°5	9.30	49	510	assets/Messier-40-Winnecke-4.webp	19	2	3	9
151	M41	NGC 2287	6h 47m	-20°44	4.60	38	2,300	assets/Messier-41.webp	20	2	1	3
152	M42	NGC 1976	5h 35.4m	-5°27	4.00	85x60	1,600	assets/Messier-42-Orion-Nebula.webp	21	4	1	4
153	M43	NGC 1982	5h 35.6m	-5°16	9.00	20x15	1,600	assets/Messier-43-De-Mairans-Nebula.webp	21	2	1	4
154	M44	NGC 2632	8h 40.1m	19°59	3.70	95	577	assets/Messier-44-Beehive-Cluster.webp	22	2	1	3
155	M45	\N	3h 47m	24°7.2	1.60	110	380	assets/Messier-45-Pleiades.webp	1	4	1	3
156	M46	NGC 2437	7h 41.8m	-14°49	6.00	27	5,400	assets/Messier-46.webp	23	2	1	3
157	M47	NGC 2422	7h 36.6m	-14°30	5.20	30	1,600	assets/Messier-47.webp	23	2	1	3
158	M48	NGC 2548	8h 13.8m	-5°48	5.50	54	1,500	assets/Messier-48.webp	24	2	1	3
159	M49	NGC 4472	12h 29.8m	8°0	8.40	9x7.5	60,000,000	assets/Messier-49.webp	25	1	3	10
160	M50	NGC 2323	7h 3.2m	-8°20	6.30	16	3,000	assets/Messier-50.webp	26	2	1	3
161	M51	NGC 5194	13h 29.9m	47°12	8.40	11x7	37,000,000	assets/Messier-51-Whirlpool-Galaxy.webp	3	1	3	7
162	M52	NGC 7654	23h 24.2m	61°35	7.30	13	5,000	assets/Messier-52.webp	27	2	2	3
163	M53	NGC 5024	13h 12.9m	18°10	7.60	12.6	56,400	assets/Messier-53.webp	28	2	3	2
164	M54	NGC 6715	18h 55.1m	-30°29	7.60	9.1	82,800	assets/Messier-54.webp	6	1	4	2
165	M55	NGC 6809	19h 40m	-30°58	6.30	19	16,600	assets/Messier-55.webp	6	3	4	2
166	M56	NGC 6779	19h 16.6m	30°11	8.30	7.1	31,600	assets/Messier-56.webp	29	1	4	2
167	M57	NGC 6720	18h 53.6m	33°2	8.80	1.4x1	4,100	assets/Messier-57-Ring-Nebula.webp	29	2	4	6
168	M58	NGC 4579	12h 37.7m	11°49	9.70	5.5x4.5	60,000,000	assets/Messier-58.webp	25	1	3	7
169	M59	NGC 4621	12h 42m	11°39	9.60	5x3.5	60,000,000	assets/Messier-59.webp	25	3	3	10
170	M60	NGC 4649	12h 43.7m	11°33	8.80	7x6	60,000,000	assets/Messier-60.webp	25	1	3	10
171	M61	NGC 4303	12h 21.9m	4°28	9.70	6x5.5	60,000,000	assets/Messier-61.webp	25	3	3	7
172	M62	NGC 6266	17h 1.2m	-30°7	6.50	14.1	21,500	assets/Messier-62.webp	7	1	4	2
173	M63	NGC 5055	13h 15.8m	42°2	8.60	10x6	37,000,000	assets/Messier-63-Sunflower-Galaxy.webp	3	1	3	7
174	M64	NGC 4826	12h 56.7m	21°41	8.50	9.3x5.4	19,000,000	assets/Messier-64-Black-Eye-Galaxy.webp	28	1	3	7
175	M65	NGC 3623	11h 18.9m	13°5	9.30	8x1.5	35,000,000	assets/Messier-65.webp	30	1	3	7
176	M66	NGC 3627	11h 20.2m	12°59	8.90	8x2.5	35,000,000	assets/Messier-66.webp	30	2	3	7
177	M67	NGC 2682	8h 50.4m	11°49	6.10	30	2,700	assets/Messier-67.webp	22	2	1	3
178	M68	NGC 4590	12h 39.5m	-26°45	7.80	12	33,300	assets/Messier-68.webp	24	5	3	2
179	M69	NGC 6637	18h 31.4m	-32°21	7.60	7.1	26,700	assets/Messier-69.webp	6	1	4	2
180	M70	NGC 6681	18h 43.2m	-32°18	7.90	7.8	28,000	assets/Messier-70.webp	6	1	4	2
181	M71	NGC 6838	19h 53.8m	18°47	8.30	7.2	11,700	assets/Messier-71.webp	31	1	4	2
182	M72	NGC 6981	20h 53.5m	-12°32	9.30	5.9	52,800	assets/Messier-72.webp	2	1	4	2
183	M73	NGC 6994	20h 59m	-12°38	9.00	2.8	2,000	assets/Messier-73.webp	2	3	4	11
184	M74	NGC 628	1h 36.7m	15°47	9.40	10.2x9.5	35,000,000	assets/Messier-74-Phantom-Galaxy.webp	32	5	2	7
185	M75	NGC 6864	20h 6.1m	-21°55	8.50	6	57,700	assets/Messier-75.webp	6	1	4	2
186	M76	NGC 650	1h 42.3m	51°34	10.10	2.7x1.8	3,400	assets/Messier-76-Little-Dumbbell-Nebula.webp	16	1	2	6
187	M77	NGC 1068	2h 42.7m	0°1	8.90	7x6	60,000,000	assets/Messier-77-Cetus-A.webp	33	1	2	7
188	M78	NGC 2068	5h 46.7m	0°3	8.30	8x6	1,600	assets/Messier-78.webp	21	1	1	4
189	M79	NGC 1904	5h 24.5m	-24°33	7.70	8.7	41,100	assets/Messier-79.webp	34	1	1	2
190	M80	NGC 6093	16h 17m	-22°59	7.30	8.9	27,400	assets/Messier-80.webp	4	2	4	2
191	M81	NGC 3031	9h 55.6m	69°4	6.90	21x10	12,000,000	assets/Messier-81-Bodes-Galaxy.webp	19	2	3	7
192	M82	NGC 3034	9h 55.8m	69°41	8.40	9.x4	12,000,000	assets/Messier-82-Cigar-Galaxy.webp	19	2	3	12
193	M83	NGC 5236	13h 37m	-29°52	7.60	11x10	15,000,000	assets/Messier-83-Southern-Pinwheel-Galaxy.webp	24	3	3	7
194	M84	NGC 4374	12h 25.1m	12°53	9.10	5	60,000,000	assets/Messier-84.webp	25	1	3	13
195	M85	NGC 4382	12h 25.4m	18°11	9.10	7.1x5.2	60,000,000	assets/Messier-85.webp	28	1	3	13
196	M86	NGC 4406	12h 26.2m	12°57	8.90	7.5x5.5	60,000,000	assets/Messier-86.webp	25	1	3	13
197	M87	NGC 4486	12h 30.8m	12°24	8.60	7	60,000,000	assets/Messier-87-Virgo-A.webp	25	1	3	10
198	M88	NGC 4501	12h 32m	14°25	9.60	7x4	60,000,000	assets/Messier-88.webp	28	1	3	7
199	M89	NGC 4552	12h 35.7m	12°33	9.80	4	60,000,000	assets/Messier-89.webp	25	1	3	10
200	M90	NGC 4569	12h 36.8m	13°10	9.50	9.5x4.5	60,000,000	assets/Messier-90.webp	25	3	3	7
201	M91	NGC 4548	12h 35.4m	14°30	10.20	5.4x4.4	60,000,000	assets/Messier-91.webp	28	5	3	7
202	M92	NGC 6341	17h 17.1m	43°8	6.40	11.2	26,400	assets/Messier-92.webp	9	2	4	2
203	M93	NGC 2447	7h 44.6m	-23°52	6.00	22	3,600	assets/Messier-93.webp	23	2	1	3
204	M94	NGC 4736	12h 50.9m	41°7	8.20	7x3	14,500,000	assets/Messier-94-Cats-Eye-Galaxy.webp	3	1	3	7
205	M95	NGC 3351	10h 44m	11°42	9.70	4.4x3.3	38,000,000	assets/Messier-95.webp	30	3	3	7
206	M96	NGC 3368	10h 46.8m	11°49	9.20	6x4	38,000,000	assets/Messier-96.webp	30	1	3	7
207	M97	NGC 3587	11h 14.8m	55°1	9.90	3.4x3.3	2,600	assets/Messier-97-Owl-Nebula.webp	19	5	3	6
208	M98	NGC 4192	12h 13.8m	14°54	10.10	9.5x3.2	60,000,000	assets/Messier-98.webp	28	5	3	7
209	M99	NGC 4254	12h 18.8m	14°25	9.90	5.4x4.8	60,000,000	assets/Messier-99-Coma-Pinwheel-Galaxy.webp	28	3	3	7
210	M100	NGC 4321	12h 22.9m	15°49	9.30	7x6	60,000,000	assets/Messier-100.webp	28	5	3	7
211	M101	NGC 5457	14h 3.2m	54°21	7.90	22	27,000,000	assets/Messier-101-Pinwheel-Galaxy.webp	19	5	3	7
212	M102	NGC 5866	15h 6.5m	55°46	9.90	5.2x2.3	40,000,000	assets/Messier-102-Spindle-Galaxy.webp	35	3	4	13
213	M103	NGC 581	1h 33.2m	60°42	7.40	6	8,000	assets/Messier-103.webp	27	2	2	3
214	M104	NGC 4594	12h 40m	-11°37	8.00	9x4	50,000,000	assets/Messier-104-Sombrero-Galaxy.webp	25	2	3	7
215	M105	NGC 3379	10h 47.8m	12°35	9.30	2	38,000,000	assets/Messier-105.webp	30	1	3	10
216	M106	NGC 4258	12h 19m	47°18	8.40	19x8	25,000,000	assets/Messier-106.webp	3	3	3	7
217	M107	NGC 6171	16h 32.5m	-13°3	7.90	10	19,600	assets/Messier-107.webp	7	3	4	2
218	M108	NGC 3556	11h 11.5m	55°40	10.00	8x1	45,000,000	assets/Messier-108.webp	19	3	3	7
219	M109	NGC 3992	11h 57.6m	53°23	9.80	7x4	55,000,000	assets/Messier-109.webp	19	3	3	7
220	M110	NGC 205	0h 40.4m	41°41	8.50	17x10	2,900,000	assets/Messier-110.webp	14	3	2	10
\.


--
-- TOC entry 3407 (class 0 OID 19775)
-- Dependencies: 214
-- Data for Name: constellations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.constellations (id, name) FROM stdin;
1	Taureau
2	Le Verseau
3	Les Chiens de chasse
4	Le Scorpion
5	Le Serpent
6	Sagittaire
7	Ophiucus
8	Le Bouclier
9	Hercule
10	Pégase
11	Petit Renard
12	Le Cygne
13	Capricorne
14	Andromède
15	Triangle
16	Persée
17	Gémeaux
18	Le Cocher
19	La Grande Ourse
20	Le Grand Chien
21	Orion
22	Cancer
23	Poupe
24	L'Hydre
25	La Vierge
26	Monocerus
27	Cassiopée
28	Chevelure de Bérénice
29	La Lyre
30	Le Lion
31	Sagitta
32	Poissons
33	Cetus
34	Le Lièvre
35	Le Dragon
\.


--
-- TOC entry 3409 (class 0 OID 19779)
-- Dependencies: 216
-- Data for Name: observation_difficulties; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.observation_difficulties (id, name) FROM stdin;
1	Modéré
2	Facile
3	Difficile
4	Trés Facile
5	Trés Difficile
\.


--
-- TOC entry 3411 (class 0 OID 19783)
-- Dependencies: 218
-- Data for Name: outing_has_celestial_object; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.outing_has_celestial_object (id, outing_id, celestial_object_id) FROM stdin;
1	1	119
2	1	128
3	1	144
4	1	160
\.


--
-- TOC entry 3413 (class 0 OID 19787)
-- Dependencies: 220
-- Data for Name: outings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.outings (id, theme, meeting_time, duration, place, equipment, max_people, remaining_slots, comment) FROM stdin;
1	Randonée nocturne	2022-12-25 22:00:00	03:30:00	Entrée ouest de la fôret du Méroire	- une lunette\n- des chaussures de marche\n	25	21	Pensez à prendre un parapluie, la météo annonce de la pluie
2	Ciel du Printemps	2023-02-12 22:00:00	04:00:00	Entrée de la fôret au dessus de la ville d'Argon	\N	12	12	Séance d'initiation 
3	Eclipse lunaire	2022-05-30 21:30:00	02:00:00	Sur la colline en face de l'arrêt de bus Place du Nord du bus 45	Prenez une lunette d'observation car nous n'en fournirons qu'un nombre limité	50	45	Eclipse lunaire partielle qui se déoulera vers 22:24
4	Pleine lune	2022-06-15 20:00:00	01:30:00	Gare d'Yverdon	- prenez de l'eau car des températures fortes sont annoncées \n- chaussures de marche\n- 	20	4	\N
\.


--
-- TOC entry 3415 (class 0 OID 19793)
-- Dependencies: 222
-- Data for Name: seasons; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.seasons (id, name) FROM stdin;
1	Hiver
2	Automne
3	Printemps
4	été
\.


--
-- TOC entry 3417 (class 0 OID 19797)
-- Dependencies: 224
-- Data for Name: types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.types (id, name) FROM stdin;
1	Reste de supernova
2	Amas globulaire
3	Amas ouverts
4	Nébuleuse diffuse
5	Nuage d'étoiles
6	Nébuleuse planétaire
7	Galaxie spirale
8	Elliptical Galaxy
9	Double Star
10	Galaxie elliptique
11	Group/Asterism
12	Galaxie irrégulière
13	Galaxie lenticulaire (S0)
\.


--
-- TOC entry 3419 (class 0 OID 19801)
-- Dependencies: 226
-- Data for Name: user_has_outing; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_has_outing (id, user_id, outing_id) FROM stdin;
1	1	1
2	2	1
3	3	1
4	4	1
\.


--
-- TOC entry 3421 (class 0 OID 19805)
-- Dependencies: 228
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, firstname, lastname, age, phone_number) FROM stdin;
1	jean.dupont@mail.com	Jean	Dupont	45	021 345 41 34
2	jean.dupont@mail.com	Pierre	Dupont	12	021 567 89 90
3	jean.dupont@mail.com	Sylvie	Dupont	7	021 567 89 90
4	mark.zeleger@mail.com	Mark 	Zélèger Mürtoff Zûrettov 	87	021 213 89 54
\.


--
-- TOC entry 3439 (class 0 OID 0)
-- Dependencies: 211
-- Name: administrators_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.administrators_id_seq', 1, true);


--
-- TOC entry 3440 (class 0 OID 0)
-- Dependencies: 213
-- Name: celestial_objects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.celestial_objects_id_seq', 220, true);


--
-- TOC entry 3441 (class 0 OID 0)
-- Dependencies: 215
-- Name: constellations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.constellations_id_seq', 35, true);


--
-- TOC entry 3442 (class 0 OID 0)
-- Dependencies: 217
-- Name: observation_difficulties_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.observation_difficulties_id_seq', 5, true);


--
-- TOC entry 3443 (class 0 OID 0)
-- Dependencies: 219
-- Name: outing_has_celestial_object_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.outing_has_celestial_object_id_seq', 4, true);


--
-- TOC entry 3444 (class 0 OID 0)
-- Dependencies: 221
-- Name: outings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.outings_id_seq', 4, true);


--
-- TOC entry 3445 (class 0 OID 0)
-- Dependencies: 223
-- Name: seasons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.seasons_id_seq', 4, true);


--
-- TOC entry 3446 (class 0 OID 0)
-- Dependencies: 225
-- Name: types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.types_id_seq', 13, true);


--
-- TOC entry 3447 (class 0 OID 0)
-- Dependencies: 227
-- Name: user_has_outing_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_has_outing_id_seq', 4, true);


--
-- TOC entry 3448 (class 0 OID 0)
-- Dependencies: 229
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 4, true);


--
-- TOC entry 3221 (class 2606 OID 19820)
-- Name: administrators administrators_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrators
    ADD CONSTRAINT administrators_pkey PRIMARY KEY (id);


--
-- TOC entry 3225 (class 2606 OID 19822)
-- Name: celestial_objects celestial_objects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.celestial_objects
    ADD CONSTRAINT celestial_objects_pkey PRIMARY KEY (id);


--
-- TOC entry 3229 (class 2606 OID 19824)
-- Name: constellations constellations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constellations
    ADD CONSTRAINT constellations_pkey PRIMARY KEY (id);


--
-- TOC entry 3233 (class 2606 OID 19826)
-- Name: observation_difficulties observation_difficulties_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observation_difficulties
    ADD CONSTRAINT observation_difficulties_pkey PRIMARY KEY (id);


--
-- TOC entry 3237 (class 2606 OID 19828)
-- Name: outing_has_celestial_object outing_has_celestial_object_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outing_has_celestial_object
    ADD CONSTRAINT outing_has_celestial_object_pkey PRIMARY KEY (id);


--
-- TOC entry 3239 (class 2606 OID 19830)
-- Name: outings outings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outings
    ADD CONSTRAINT outings_pkey PRIMARY KEY (id);


--
-- TOC entry 3243 (class 2606 OID 19832)
-- Name: seasons seasons_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seasons
    ADD CONSTRAINT seasons_pkey PRIMARY KEY (id);


--
-- TOC entry 3247 (class 2606 OID 19834)
-- Name: types types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);


--
-- TOC entry 3223 (class 2606 OID 19836)
-- Name: administrators unique_administrator; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.administrators
    ADD CONSTRAINT unique_administrator UNIQUE (email);


--
-- TOC entry 3227 (class 2606 OID 19838)
-- Name: celestial_objects unique_celestial_object; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.celestial_objects
    ADD CONSTRAINT unique_celestial_object UNIQUE (messier_number);


--
-- TOC entry 3231 (class 2606 OID 19840)
-- Name: constellations unique_constellation; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.constellations
    ADD CONSTRAINT unique_constellation UNIQUE (name);


--
-- TOC entry 3235 (class 2606 OID 19842)
-- Name: observation_difficulties unique_observation_difficulty; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observation_difficulties
    ADD CONSTRAINT unique_observation_difficulty UNIQUE (name);


--
-- TOC entry 3241 (class 2606 OID 19844)
-- Name: outings unique_outing; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outings
    ADD CONSTRAINT unique_outing UNIQUE (theme, meeting_time);


--
-- TOC entry 3245 (class 2606 OID 19846)
-- Name: seasons unique_season; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.seasons
    ADD CONSTRAINT unique_season UNIQUE (name);


--
-- TOC entry 3249 (class 2606 OID 19848)
-- Name: types unique_type; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.types
    ADD CONSTRAINT unique_type UNIQUE (name);


--
-- TOC entry 3253 (class 2606 OID 19850)
-- Name: users unique_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT unique_user UNIQUE (email, firstname, lastname, age);


--
-- TOC entry 3251 (class 2606 OID 19852)
-- Name: user_has_outing user_has_outing_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_has_outing
    ADD CONSTRAINT user_has_outing_pkey PRIMARY KEY (id);


--
-- TOC entry 3255 (class 2606 OID 19854)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3256 (class 2606 OID 19855)
-- Name: celestial_objects celestial_objects_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.celestial_objects
    ADD CONSTRAINT celestial_objects_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellations(id) NOT VALID;


--
-- TOC entry 3257 (class 2606 OID 19860)
-- Name: celestial_objects celestial_objects_observation_difficulty_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.celestial_objects
    ADD CONSTRAINT celestial_objects_observation_difficulty_id_fkey FOREIGN KEY (observation_difficulty_id) REFERENCES public.observation_difficulties(id) NOT VALID;


--
-- TOC entry 3258 (class 2606 OID 19865)
-- Name: celestial_objects celestial_objects_season_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.celestial_objects
    ADD CONSTRAINT celestial_objects_season_id_fkey FOREIGN KEY (season_id) REFERENCES public.seasons(id) NOT VALID;


--
-- TOC entry 3259 (class 2606 OID 19870)
-- Name: celestial_objects celestial_objects_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.celestial_objects
    ADD CONSTRAINT celestial_objects_type_id_fkey FOREIGN KEY (type_id) REFERENCES public.types(id) NOT VALID;


--
-- TOC entry 3260 (class 2606 OID 19875)
-- Name: outing_has_celestial_object outing_has_celestial_object_celestial_object_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outing_has_celestial_object
    ADD CONSTRAINT outing_has_celestial_object_celestial_object_id_fkey FOREIGN KEY (celestial_object_id) REFERENCES public.celestial_objects(id) NOT VALID;


--
-- TOC entry 3261 (class 2606 OID 19880)
-- Name: outing_has_celestial_object outing_has_celestial_object_outing_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.outing_has_celestial_object
    ADD CONSTRAINT outing_has_celestial_object_outing_id_fkey FOREIGN KEY (outing_id) REFERENCES public.outings(id) NOT VALID;


--
-- TOC entry 3262 (class 2606 OID 19885)
-- Name: user_has_outing user_has_outing_outing_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_has_outing
    ADD CONSTRAINT user_has_outing_outing_id_fkey FOREIGN KEY (outing_id) REFERENCES public.outings(id) NOT VALID;


--
-- TOC entry 3263 (class 2606 OID 19890)
-- Name: user_has_outing user_has_outing_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_has_outing
    ADD CONSTRAINT user_has_outing_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) NOT VALID;


-- Completed on 2022-05-25 10:06:56

--
-- PostgreSQL database dump complete
--

