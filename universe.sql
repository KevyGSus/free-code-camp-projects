--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(40) NOT NULL,
    apparent_magnitude numeric(3,2)
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    reached_by_humans boolean,
    type character varying(40),
    number_of_stars_in_billions integer,
    constellation_id integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    discovered_by character varying(40),
    average_orbital_speed numeric(4,2),
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    diameter_in_km integer,
    distance_from_sun numeric(5,1),
    number_of_moons integer,
    has_life boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    gould_designation character varying(3),
    apparent_magnitude numeric(3,2),
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Andromeda', 2.06);
INSERT INTO public.constellation VALUES (2, 'Sagittarius', 1.85);
INSERT INTO public.constellation VALUES (3, 'Ursa Major', 1.77);
INSERT INTO public.constellation VALUES (4, 'Ursa Minor', 1.98);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, 'Sb', 400, 2);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', false, 'SA(s)B', 1000, 1);
INSERT INTO public.galaxy VALUES (3, 'Bode''s Galaxy', false, 'SA(s)B', 1000, 1);
INSERT INTO public.galaxy VALUES (4, 'Cigar Galaxy', false, 'I0', 30, 3);
INSERT INTO public.galaxy VALUES (5, 'Helix Galaxy', false, '(R)SB0^+ pec', 0, 3);
INSERT INTO public.galaxy VALUES (6, 'Medusa Merger', false, 'Imeger', 100, 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, 1.02, 3);
INSERT INTO public.moon VALUES (2, 'Phobos', 'Hall', 2.14, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'Hall', 1.35, 4);
INSERT INTO public.moon VALUES (4, 'Io', 'Galileo', 17.33, 5);
INSERT INTO public.moon VALUES (5, 'Europa', 'Galileo', 13.70, 5);
INSERT INTO public.moon VALUES (6, 'Ganymede', 'Galileo', 10.90, 5);
INSERT INTO public.moon VALUES (7, 'Mimas', 'Herschel', NULL, 6);
INSERT INTO public.moon VALUES (8, 'Enceladus', 'Herschel', NULL, 6);
INSERT INTO public.moon VALUES (9, 'Tethys', 'Cassini', NULL, 6);
INSERT INTO public.moon VALUES (10, 'Dione', 'Cassini', NULL, 6);
INSERT INTO public.moon VALUES (11, 'Ariel', 'Lassell', NULL, 7);
INSERT INTO public.moon VALUES (12, 'Umbriel', 'Lassell', NULL, 7);
INSERT INTO public.moon VALUES (13, 'Titania', 'Herschel', NULL, 7);
INSERT INTO public.moon VALUES (14, 'Oberon', 'Herschel', NULL, 7);
INSERT INTO public.moon VALUES (15, 'Triton', 'Lassell', NULL, 10);
INSERT INTO public.moon VALUES (16, 'Nereid', 'Kuiper', NULL, 10);
INSERT INTO public.moon VALUES (17, 'Naiad', 'Terrile (Voyager 2)', NULL, 10);
INSERT INTO public.moon VALUES (18, 'Thalassa', 'Terrile (Voyager 2)', NULL, 10);
INSERT INTO public.moon VALUES (19, 'Charon', 'Christy', NULL, 13);
INSERT INTO public.moon VALUES (20, 'Nix', 'Weaver, Stern, Buie, et al.', NULL, 13);
INSERT INTO public.moon VALUES (21, 'Hydra', 'Weaver, Stern, Buie, et al.', NULL, 13);
INSERT INTO public.moon VALUES (22, 'Kerberos', 'Showalter (Hubble)', NULL, 13);
INSERT INTO public.moon VALUES (23, 'Styx', 'Showalter (Hubble)', NULL, 13);
INSERT INTO public.moon VALUES (24, 'Hiʻiaka', 'Brown et al.', NULL, 14);
INSERT INTO public.moon VALUES (25, 'Namaka', 'Brown et al.', NULL, 14);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Mercury is classified as a terrestrial planet, with roughly the same surface gravity as Mars. The surface of Mercury is heavily cratered, as a result of countless impact events that have accumulated over billions of years.', 4879, 57.9, 0, false, 7);
INSERT INTO public.planet VALUES (2, 'Venus', 'Venus has by far the densest atmosphere of the terrestrial planets, composed mostly of carbon dioxide with a thick, global sulfuric acid cloud cover.', 12104, 108.2, 0, false, 7);
INSERT INTO public.planet VALUES (3, 'Earth', 'Almost all of Earth''s water is contained in its global ocean, covering 70.8% of Earth''s crust. The remaining 29.2% of Earth''s crust is land, most of which is located in the form of continental landmasses within Earth''s land hemisphere.', 12756, 149.6, 1, true, 7);
INSERT INTO public.planet VALUES (4, 'Mars', 'The surface of Mars is orange-red because it is covered in iron(III) oxide dust, giving it the nickname "the Red Planet". Mars is among the brightest objects in Earth''s sky, and its high-contrast albedo features have made it a common subject for telescope viewing.', 6792, 228.0, 2, false, 7);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass more than 2.5 times that of all the other planets in the Solar System combined and slightly less than one-thousandth the mass of the Sun.', 142984, 778.5, 95, false, 7);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Saturn''s interior is thought to be composed of a rocky core, surrounded by a deep layer of metallic hydrogen, an intermediate layer of liquid hydrogen and liquid helium, and an outer layer of gas. Saturn has a pale yellow hue, due to ammonia crystals in its upper atmosphere.', 120536, 1432.0, 146, false, 7);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Uranus has the third-largest diameter and fourth-largest mass among the Solar System''s planets. Based on current models, inside its volatile mantle layer is a rocky core, and surrounding it is a thick hydrogen and helium atmosphere.', 51118, 2867.0, 28, false, 7);
INSERT INTO public.planet VALUES (10, 'Neptune', 'Neptune is not visible to the unaided eye and is the only planet in the Solar System that was not initially observed by direct empirical observation. Rather, unexpected changes in the orbit of Uranus led Alexis Bouvard to hypothesise that its orbit was subject to gravitational perturbation by an unknown planet.', 49528, 4514.0, 16, false, 7);
INSERT INTO public.planet VALUES (11, 'PA-99-N2', 'The possible exoplanet would have a mass of 6.34 Jupiter mass. If confirmed, it would be the first exoplanet found in another galaxy.', NULL, NULL, NULL, false, 8);
INSERT INTO public.planet VALUES (12, 'Ceres', 'Gravity data suggest Ceres to be partially differentiated into a muddy (ice-rock) mantle/core and a less dense but stronger crust that is at most thirty per cent ice by volume. Although Ceres likely lacks an internal ocean of liquid water, brines still flow through the outer mantle and reach the surface, allowing cryovolcanoes such as Ahuna Mons to form roughly every fifty million years.', 946, 413.0, 0, false, 7);
INSERT INTO public.planet VALUES (13, 'Pluto', 'Like other Kuiper belt objects, Pluto is made primarily of ice and rock and is much smaller than the inner planets. Pluto has roughly one-sixth the mass of the Moon, and one-third its volume. Originally considered a planet, its status was changed when a new definition of the word was adopted by astronomers. ', 2376, 5906.4, 5, false, 7);
INSERT INTO public.planet VALUES (14, 'Haumea', 'Haumea''s mass is about one-third that of Pluto and 1/1400 that of Earth. Although its shape has not been directly observed, calculations from its light curve are consistent with it being a Jacobi ellipsoid (the shape it would be if it were a dwarf planet), with its major axis twice as long as its minor.', 1740, 6484.0, 2, false, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpheratz', '21', 2.07, 2);
INSERT INTO public.star VALUES (2, 'Mirach', '43', 2.07, 2);
INSERT INTO public.star VALUES (3, '51 And', '51', 3.59, 2);
INSERT INTO public.star VALUES (4, '21 Sgr', '21', 4.81, 1);
INSERT INTO public.star VALUES (5, '60 Sgr', '60', 4.84, 1);
INSERT INTO public.star VALUES (6, 'Merak', '48', 2.37, 3);
INSERT INTO public.star VALUES (7, 'Sun', '0', 0.00, 1);
INSERT INTO public.star VALUES (8, 'PA-99-N2', NULL, NULL, 2);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

