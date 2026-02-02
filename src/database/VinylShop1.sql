--
-- PostgreSQL database dump
--

\restrict iKETCieEMABdDqXeVuhdWia1EtzNsUlVJrSdzToAcu0nuQcGgtGt2C7h0QP4PP4

-- Dumped from database version 17.4
-- Dumped by pg_dump version 18.0

-- Started on 2026-02-02 15:00:13 CET

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'LATIN9';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: pg_database_owner
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO pg_database_owner;

--
-- TOC entry 3757 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: pg_database_owner
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 221 (class 1259 OID 16539)
-- Name: album; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.album (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    release_year integer NOT NULL,
    price numeric(10,2) NOT NULL,
    cover character varying(255),
    stock integer NOT NULL,
    sold_count integer DEFAULT 0,
    publisher_id bigint
);


ALTER TABLE public.album OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16550)
-- Name: album_artist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.album_artist (
    album_id bigint NOT NULL,
    artist_id bigint NOT NULL
);


ALTER TABLE public.album_artist OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16565)
-- Name: album_genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.album_genre (
    album_id bigint NOT NULL,
    genre_id bigint NOT NULL
);


ALTER TABLE public.album_genre OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16529)
-- Name: artist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.artist (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.artist OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16534)
-- Name: genre; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genre (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.genre OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16524)
-- Name: publisher; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.publisher (
    id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.publisher OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16519)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(255),
    role character varying(20) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 3749 (class 0 OID 16539)
-- Dependencies: 221
-- Data for Name: album; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.album (id, name, release_year, price, cover, stock, sold_count, publisher_id) FROM stdin;
1	A Night at the Opera	1975	19.99	opera.jpg	50	20	1
2	Heroes	1977	17.99	heroes.jpg	40	15	2
3	Random Access Memories	2013	21.99	ram.jpg	30	10	3
\.


--
-- TOC entry 3750 (class 0 OID 16550)
-- Dependencies: 222
-- Data for Name: album_artist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.album_artist (album_id, artist_id) FROM stdin;
1	1
2	2
3	3
\.


--
-- TOC entry 3751 (class 0 OID 16565)
-- Dependencies: 223
-- Data for Name: album_genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.album_genre (album_id, genre_id) FROM stdin;
1	1
2	1
3	3
\.


--
-- TOC entry 3747 (class 0 OID 16529)
-- Dependencies: 219
-- Data for Name: artist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.artist (id, name) FROM stdin;
1	Queen
2	David Bowie
3	Daft Punk
\.


--
-- TOC entry 3748 (class 0 OID 16534)
-- Dependencies: 220
-- Data for Name: genre; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.genre (id, name) FROM stdin;
1	Rock
2	Pop
3	Electronic
\.


--
-- TOC entry 3746 (class 0 OID 16524)
-- Dependencies: 218
-- Data for Name: publisher; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.publisher (id, name) FROM stdin;
1	Sony Music
2	Universal Music Group
3	Warner Music Group
\.


--
-- TOC entry 3745 (class 0 OID 16519)
-- Dependencies: 217
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, role) FROM stdin;
1	Vincent	ADMIN
2	Kevin	EMPLOYEE
3	Pieter	EMPLOYEE
\.


--
-- TOC entry 3592 (class 2606 OID 16554)
-- Name: album_artist album_artist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album_artist
    ADD CONSTRAINT album_artist_pkey PRIMARY KEY (album_id, artist_id);


--
-- TOC entry 3594 (class 2606 OID 16569)
-- Name: album_genre album_genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album_genre
    ADD CONSTRAINT album_genre_pkey PRIMARY KEY (album_id, genre_id);


--
-- TOC entry 3590 (class 2606 OID 16544)
-- Name: album album_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album
    ADD CONSTRAINT album_pkey PRIMARY KEY (id);


--
-- TOC entry 3586 (class 2606 OID 16533)
-- Name: artist artist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.artist
    ADD CONSTRAINT artist_pkey PRIMARY KEY (id);


--
-- TOC entry 3588 (class 2606 OID 16538)
-- Name: genre genre_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genre
    ADD CONSTRAINT genre_pkey PRIMARY KEY (id);


--
-- TOC entry 3584 (class 2606 OID 16528)
-- Name: publisher publisher_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.publisher
    ADD CONSTRAINT publisher_pkey PRIMARY KEY (id);


--
-- TOC entry 3582 (class 2606 OID 16523)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3596 (class 2606 OID 16555)
-- Name: album_artist fk_album_artist_album; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album_artist
    ADD CONSTRAINT fk_album_artist_album FOREIGN KEY (album_id) REFERENCES public.album(id) ON DELETE CASCADE;


--
-- TOC entry 3597 (class 2606 OID 16560)
-- Name: album_artist fk_album_artist_artist; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album_artist
    ADD CONSTRAINT fk_album_artist_artist FOREIGN KEY (artist_id) REFERENCES public.artist(id) ON DELETE CASCADE;


--
-- TOC entry 3598 (class 2606 OID 16570)
-- Name: album_genre fk_album_genre_album; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album_genre
    ADD CONSTRAINT fk_album_genre_album FOREIGN KEY (album_id) REFERENCES public.album(id) ON DELETE CASCADE;


--
-- TOC entry 3599 (class 2606 OID 16575)
-- Name: album_genre fk_album_genre_genre; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album_genre
    ADD CONSTRAINT fk_album_genre_genre FOREIGN KEY (genre_id) REFERENCES public.genre(id) ON DELETE CASCADE;


--
-- TOC entry 3595 (class 2606 OID 16545)
-- Name: album fk_album_publisher; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.album
    ADD CONSTRAINT fk_album_publisher FOREIGN KEY (publisher_id) REFERENCES public.publisher(id);


-- Completed on 2026-02-02 15:00:13 CET

--
-- PostgreSQL database dump complete
--

\unrestrict iKETCieEMABdDqXeVuhdWia1EtzNsUlVJrSdzToAcu0nuQcGgtGt2C7h0QP4PP4

