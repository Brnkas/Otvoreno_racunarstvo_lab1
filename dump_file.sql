--
-- PostgreSQL database dump
--

-- Dumped from database version 17.0
-- Dumped by pg_dump version 17.0

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: likovi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.likovi (
    id integer NOT NULL,
    ime character varying(50),
    prezime character varying(50),
    videoigra_id integer
);


ALTER TABLE public.likovi OWNER TO postgres;

--
-- Name: likovi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.likovi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.likovi_id_seq OWNER TO postgres;

--
-- Name: likovi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.likovi_id_seq OWNED BY public.likovi.id;


--
-- Name: videoigre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.videoigre (
    id integer NOT NULL,
    naziv character varying(100) NOT NULL,
    zanr character varying(100),
    platforme character varying(100),
    razvijac character varying(100),
    izdavac character varying(100),
    godina_izlaska integer,
    prosjecna_ocjena numeric(3,1),
    broj_igraca character varying(50),
    cijena numeric(5,2)
);


ALTER TABLE public.videoigre OWNER TO postgres;

--
-- Name: videoigre_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.videoigre_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.videoigre_id_seq OWNER TO postgres;

--
-- Name: videoigre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.videoigre_id_seq OWNED BY public.videoigre.id;


--
-- Name: likovi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likovi ALTER COLUMN id SET DEFAULT nextval('public.likovi_id_seq'::regclass);


--
-- Name: videoigre id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.videoigre ALTER COLUMN id SET DEFAULT nextval('public.videoigre_id_seq'::regclass);


--
-- Data for Name: likovi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.likovi (id, ime, prezime, videoigra_id) FROM stdin;
1	Geralt	of Rivia	1
2	Yennefer		1
3	Ciri		1
4	V		2
5	Johnny	Silverhand	2
6	Arthur	Morgan	3
7	Dutch	van der Linde	3
8	Tarnished		4
9	Ashen One		5
10	Steve		6
11	Alex		6
12	Link		7
13	Kratos		8
14	Zagreus		9
15	Tecumseh		10
16	Cleopatra		10
\.


--
-- Data for Name: videoigre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.videoigre (id, naziv, zanr, platforme, razvijac, izdavac, godina_izlaska, prosjecna_ocjena, broj_igraca, cijena) FROM stdin;
1	The Witcher 3	RPG | Akcija	PC | PlayStation | Xbox | Nintendo Switch	CD Projekt Red	CD Projekt	2015	4.9	Singleplayer	39.99
2	Cyberpunk 2077	RPG | Akcija	PC | PlayStation | Xbox	CD Projekt Red	CD Projekt	2020	4.0	Singleplayer	49.99
3	Red Dead Redemption 2	Akcija | Avantura	PC | PlayStation | Xbox	Rockstar Games	Rockstar Games	2018	4.8	Singleplayer | Multiplayer	59.99
4	Elden Ring	RPG | Akcija	PC | PlayStation | Xbox	FromSoftware	Bandai Namco Entertainment	2022	4.7	Singleplayer | Multiplayer	59.99
5	Dark Souls 3	RPG | Akcija	PC | PlayStation | Xbox	FromSoftware	Bandai Namco Entertainment	2016	4.6	Singleplayer	39.99
6	Minecraft	Sandbox | Kreativna	PC | PlayStation | Xbox | Nintendo Switch | Mobile	Mojang Studios	Mojang Studios	2011	4.5	Singleplayer | Multiplayer	26.95
7	The Legend of Zelda: Breath of the Wild	Akcija | Avantura	Nintendo Switch	Nintendo	Nintendo	2017	4.9	Singleplayer	59.99
8	God of War	Akcija | Avantura	PC | PlayStation	Santa Monica Studio	Sony Interactive Entertainment	2018	4.9	Singleplayer	49.99
9	Hades	Roguelike | Akcija	PC | Nintendo Switch	Supergiant Games	Supergiant Games	2020	4.8	Singleplayer	24.99
10	Civilization VII	Strategija | Simulacija	PC	Firaxis Games	2K Games	2024	4.5	Singleplayer | Multiplayer	59.99
\.


--
-- Name: likovi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.likovi_id_seq', 16, true);


--
-- Name: videoigre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.videoigre_id_seq', 10, true);


--
-- Name: likovi likovi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likovi
    ADD CONSTRAINT likovi_pkey PRIMARY KEY (id);


--
-- Name: videoigre videoigre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.videoigre
    ADD CONSTRAINT videoigre_pkey PRIMARY KEY (id);


--
-- Name: likovi likovi_videoigra_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.likovi
    ADD CONSTRAINT likovi_videoigra_id_fkey FOREIGN KEY (videoigra_id) REFERENCES public.videoigre(id);


--
-- PostgreSQL database dump complete
--

