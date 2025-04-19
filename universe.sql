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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_amount bigint,
    description character varying(200),
    discovered_date date
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    distance_from_earth integer,
    description character varying(200),
    planet_id integer,
    discovered_date date,
    diameter_km integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    has_life boolean NOT NULL,
    gravity numeric(5,1),
    description character varying(200),
    planet_types text,
    star_id integer,
    discovered_date date
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: solar_system; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.solar_system (
    solar_system_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    star_id integer,
    description character varying(255)
);


ALTER TABLE public.solar_system OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.solar_system_solar_system_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.solar_system_solar_system_id_seq OWNER TO freecodecamp;

--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.solar_system_solar_system_id_seq OWNED BY public.solar_system.solar_system_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    is_spherical boolean NOT NULL,
    description character varying(200),
    galaxy_id integer,
    discovered_date date
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: solar_system solar_system_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system ALTER COLUMN solar_system_id SET DEFAULT nextval('public.solar_system_solar_system_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 100000000000, 'Our home galaxy, a barred spiral galaxy.', '1610-01-07');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000000000000, 'Closest spiral galaxy to the Milky Way, on a collision course with it.', '0964-01-01');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 40000000000, 'A small spiral galaxy in the Local Group.', '1764-10-25');
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 2700000000000, 'A giant elliptical galaxy with a supermassive black hole at its center.', '1781-03-18');
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 100000000000, 'Famous for its distinctive spiral shape and interaction with its companion galaxy.', '1773-10-13');
INSERT INTO public.galaxy VALUES (6, 'Sculptor Galaxy', 30000000000, 'An irregular galaxy located about 10 million light-years away from Earth.', '1921-05-14');
INSERT INTO public.galaxy VALUES (7, 'Sculptor Galaxy', 30000000000, 'An irregular galaxy located about 10 million light-years away from Earth.', '1921-05-14');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 384400, 'The only natural satellite of Earth.', 3, '0001-01-01', 3474);
INSERT INTO public.moon VALUES (2, 'Phobos', 9377, 'One of Mars'' moons, irregular in shape.', 4, '1877-08-18', 22);
INSERT INTO public.moon VALUES (3, 'Deimos', 23460, 'Mars'' second moon, smaller and farther than Phobos.', 4, '1877-08-18', 12);
INSERT INTO public.moon VALUES (4, 'Io', 421700, 'One of Jupiter''s moons, known for its volcanic activity.', 5, '1610-01-07', 3643);
INSERT INTO public.moon VALUES (5, 'Europa', 671034, 'A moon of Jupiter, known for its icy surface.', 5, '1610-01-07', 3122);
INSERT INTO public.moon VALUES (6, 'Ganymede', 1070400, 'The largest moon of Jupiter and the Solar System.', 5, '1610-01-07', 5268);
INSERT INTO public.moon VALUES (7, 'Callisto', 1882700, 'One of Jupiter''s moons, known for its heavily cratered surface.', 5, '1610-01-07', 4821);
INSERT INTO public.moon VALUES (8, 'Titan', 1221700, 'Saturn''s largest moon, known for its thick atmosphere.', 6, '1655-03-25', 5150);
INSERT INTO public.moon VALUES (9, 'Rhea', 527108, 'A moon of Saturn, known for its icy surface.', 6, '1672-03-23', 1528);
INSERT INTO public.moon VALUES (10, 'Iapetus', 3561300, 'A moon of Saturn, known for its two-toned surface.', 6, '1671-10-25', 1469);
INSERT INTO public.moon VALUES (11, 'Titan', 1221700, 'Saturn''s largest moon, known for its thick atmosphere.', 6, '1655-03-25', 5150);
INSERT INTO public.moon VALUES (12, 'Rhea', 527108, 'A moon of Saturn, known for its icy surface.', 6, '1672-03-23', 1528);
INSERT INTO public.moon VALUES (13, 'Iapetus', 3561300, 'A moon of Saturn, known for its two-toned surface.', 6, '1671-10-25', 1469);
INSERT INTO public.moon VALUES (14, 'Mimas', 185000, 'A moon of Saturn, also known as the “Death Star moon” due to its large impact crater.', 6, '1789-09-17', 396);
INSERT INTO public.moon VALUES (15, 'Enceladus', 238000, 'A moon of Saturn, known for its geysers and potential subsurface ocean.', 6, '1789-03-01', 504);
INSERT INTO public.moon VALUES (16, 'Tethys', 294000, 'A moon of Saturn, with a large, prominent crater known as Odysseus.', 6, '1684-03-25', 1062);
INSERT INTO public.moon VALUES (17, 'Dione', 377400, 'A moon of Saturn, known for its icy surface and bright, reflective albedo.', 6, '1684-03-25', 1123);
INSERT INTO public.moon VALUES (18, 'Hyperion', 1480000, 'A moon of Saturn, known for its irregular shape and low density.', 6, '1848-09-16', 360);
INSERT INTO public.moon VALUES (19, 'Umbriel', 266000, 'A moon of Uranus, known for its dark surface and many craters.', 7, '1851-10-24', 1169);
INSERT INTO public.moon VALUES (20, 'Miranda', 129000, 'A moon of Uranus, known for its extreme surface features, including cliffs and ridges.', 7, '1948-02-16', 472);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', false, 3.7, 'The closest planet to the Sun.', 'Terrestrial', 1, '1631-03-29');
INSERT INTO public.planet VALUES (2, 'Venus', false, 8.9, 'The second planet from the Sun, known for its extreme temperatures.', 'Terrestrial', 1, '1610-12-15');
INSERT INTO public.planet VALUES (3, 'Earth', true, 9.8, 'The third planet from the Sun, known for supporting life.', 'Terrestrial', 1, '0001-01-01');
INSERT INTO public.planet VALUES (4, 'Mars', false, 3.7, 'The fourth planet from the Sun, known for its red surface.', 'Terrestrial', 1, '1659-10-01');
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 24.8, 'The largest planet in the Solar System.', 'Gas Giant', 1, '1610-01-07');
INSERT INTO public.planet VALUES (6, 'Saturn', false, 10.4, 'The second-largest planet in the Solar System, famous for its rings.', 'Gas Giant', 1, '1610-01-07');
INSERT INTO public.planet VALUES (7, 'Uranus', false, 8.7, 'The seventh planet from the Sun, known for its tilted axis.', 'Ice Giant', 1, '1610-01-07');
INSERT INTO public.planet VALUES (8, 'Neptune', false, 11.2, 'The eighth planet from the Sun, known for its deep blue color.', 'Ice Giant', 1, '1612-12-28');
INSERT INTO public.planet VALUES (9, 'Kepler-22b', false, 1.2, 'An exoplanet in the habitable zone of its star, possibly capable of supporting life.', 'Super Earth', 3, '2009-12-05');
INSERT INTO public.planet VALUES (10, 'Kepler-452b', false, 1.2, 'A potentially habitable exoplanet orbiting a star similar to the Sun.', 'Super Earth', 3, '2015-07-23');
INSERT INTO public.planet VALUES (11, 'Gliese 581g', false, 1.3, 'An exoplanet in the Gliese 581 system, within the habitable zone.', 'Super Earth', 3, '2007-09-29');
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', false, 1.2, 'A potentially habitable exoplanet in the TRAPPIST-1 system.', 'Rocky', 4, '2017-02-22');


--
-- Data for Name: solar_system; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.solar_system VALUES (1, 'Solar System', 1, 1, 'The solar system consisting of the Sun and the planets orbiting it.');
INSERT INTO public.solar_system VALUES (2, 'Alpha Centauri System', 2, 2, 'A star system consisting of Alpha Centauri A, Alpha Centauri B, and Proxima Centauri.');
INSERT INTO public.solar_system VALUES (3, 'TRAPPIST-1 System', 4, 4, 'A star system with seven Earth-sized planets, potentially habitable.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', true, 'The star at the center of the Solar System.', 1, '0001-01-01');
INSERT INTO public.star VALUES (2, 'Proxima Centauri', true, 'The closest known star to the Sun.', 2, '1915-08-20');
INSERT INTO public.star VALUES (3, 'Alpha Centauri A', true, 'The brightest star in the Alpha Centauri system.', 2, '1800-04-15');
INSERT INTO public.star VALUES (4, 'Alpha Centauri B', true, 'The second star in the Alpha Centauri system.', 2, '1835-02-10');
INSERT INTO public.star VALUES (5, 'Sirius A', true, 'The brightest star in the night sky.', 3, '1867-05-14');
INSERT INTO public.star VALUES (6, 'Betelgeuse', true, 'A red supergiant star in the Orion constellation.', 4, '1800-09-10');


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 7, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 12, true);


--
-- Name: solar_system_solar_system_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.solar_system_solar_system_id_seq', 3, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 6, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_galaxy_id_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key1 UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_moon_id_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key1 UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: solar_system solar_system_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_pkey PRIMARY KEY (solar_system_id);


--
-- Name: solar_system solar_system_solar_system_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_solar_system_id_key UNIQUE (solar_system_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: star star_star_id_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key1 UNIQUE (star_id);


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
-- Name: solar_system solar_system_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: solar_system solar_system_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.solar_system
    ADD CONSTRAINT solar_system_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

