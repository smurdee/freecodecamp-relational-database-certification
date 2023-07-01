--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer NOT NULL,
    tries integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 1, 12);
INSERT INTO public.games VALUES (2, 2, 187);
INSERT INTO public.games VALUES (3, 2, 236);
INSERT INTO public.games VALUES (4, 3, 866);
INSERT INTO public.games VALUES (5, 3, 141);
INSERT INTO public.games VALUES (6, 2, 547);
INSERT INTO public.games VALUES (7, 2, 163);
INSERT INTO public.games VALUES (8, 2, 225);
INSERT INTO public.games VALUES (9, 4, 895);
INSERT INTO public.games VALUES (10, 4, 212);
INSERT INTO public.games VALUES (11, 5, 467);
INSERT INTO public.games VALUES (12, 5, 596);
INSERT INTO public.games VALUES (13, 4, 221);
INSERT INTO public.games VALUES (14, 4, 279);
INSERT INTO public.games VALUES (15, 4, 527);
INSERT INTO public.games VALUES (16, 1, 15);
INSERT INTO public.games VALUES (17, 1, 15);
INSERT INTO public.games VALUES (18, 6, 7);
INSERT INTO public.games VALUES (19, 7, 110);
INSERT INTO public.games VALUES (20, 7, 992);
INSERT INTO public.games VALUES (21, 8, 429);
INSERT INTO public.games VALUES (22, 8, 186);
INSERT INTO public.games VALUES (23, 7, 100);
INSERT INTO public.games VALUES (24, 7, 389);
INSERT INTO public.games VALUES (25, 7, 318);
INSERT INTO public.games VALUES (26, 9, 24);
INSERT INTO public.games VALUES (27, 10, 13);
INSERT INTO public.games VALUES (28, 11, 120);
INSERT INTO public.games VALUES (29, 11, 230);
INSERT INTO public.games VALUES (30, 12, 749);
INSERT INTO public.games VALUES (31, 12, 965);
INSERT INTO public.games VALUES (32, 11, 909);
INSERT INTO public.games VALUES (33, 11, 48);
INSERT INTO public.games VALUES (34, 11, 563);
INSERT INTO public.games VALUES (35, 13, 60);
INSERT INTO public.games VALUES (36, 13, 186);
INSERT INTO public.games VALUES (37, 14, 395);
INSERT INTO public.games VALUES (38, 14, 448);
INSERT INTO public.games VALUES (39, 13, 745);
INSERT INTO public.games VALUES (40, 13, 79);
INSERT INTO public.games VALUES (41, 13, 680);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'test-1');
INSERT INTO public.users VALUES (2, 'user_1688215193013');
INSERT INTO public.users VALUES (3, 'user_1688215193012');
INSERT INTO public.users VALUES (4, 'user_1688215245789');
INSERT INTO public.users VALUES (5, 'user_1688215245788');
INSERT INTO public.users VALUES (6, 'test-2');
INSERT INTO public.users VALUES (7, 'user_1688215584662');
INSERT INTO public.users VALUES (8, 'user_1688215584661');
INSERT INTO public.users VALUES (9, 'test-3');
INSERT INTO public.users VALUES (10, 'myself');
INSERT INTO public.users VALUES (11, 'user_1688215916547');
INSERT INTO public.users VALUES (12, 'user_1688215916546');
INSERT INTO public.users VALUES (13, 'user_1688215950488');
INSERT INTO public.users VALUES (14, 'user_1688215950487');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 41, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 14, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

