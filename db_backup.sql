--
-- PostgreSQL database dump
--

-- Dumped from database version 12.6
-- Dumped by pg_dump version 12.6

-- Started on 2021-04-24 13:56:11

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
-- TOC entry 202 (class 1259 OID 16434)
-- Name: account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.account (
    account_id text NOT NULL,
    user_name text
);


ALTER TABLE public.account OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16501)
-- Name: frequent_point; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.frequent_point (
    id uuid NOT NULL,
    frequent_route_id uuid NOT NULL,
    lat integer,
    lng integer,
    "time" integer
);


ALTER TABLE public.frequent_point OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16506)
-- Name: frequent_route; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.frequent_route (
    id uuid NOT NULL,
    account_id text NOT NULL
);


ALTER TABLE public.frequent_route OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16480)
-- Name: grid_point; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grid_point (
    id uuid NOT NULL,
    grid_trip_id uuid NOT NULL,
    lat integer,
    lng integer,
    "time" integer
);


ALTER TABLE public.grid_point OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16466)
-- Name: grid_trip; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grid_trip (
    grid_trip_id uuid NOT NULL,
    account_id text NOT NULL,
    trip_id uuid NOT NULL,
    date date,
    weekday integer
);


ALTER TABLE public.grid_trip OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16669)
-- Name: route; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.route (
    id integer NOT NULL,
    account_id text NOT NULL,
    frequent_route_id uuid NOT NULL,
    address_start text,
    address_end text,
    lat_start numeric,
    lng_start numeric,
    lat_end numeric,
    lng_end numeric,
    time_start text,
    time_end text,
    is_shared integer,
    type_shared text,
    length_route numeric,
    weekday integer
);


ALTER TABLE public.route OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16667)
-- Name: route_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.route_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.route_id_seq OWNER TO postgres;

--
-- TOC entry 2886 (class 0 OID 0)
-- Dependencies: 210
-- Name: route_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.route_id_seq OWNED BY public.route.id;


--
-- TOC entry 209 (class 1259 OID 16620)
-- Name: route_point; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.route_point (
    id uuid NOT NULL,
    route_id integer NOT NULL,
    lat numeric,
    lng numeric
);


ALTER TABLE public.route_point OWNER TO postgres;

--
-- TOC entry 203 (class 1259 OID 16442)
-- Name: trip; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trip (
    trip_id uuid NOT NULL,
    account_owner text NOT NULL,
    date date,
    weekday integer
);


ALTER TABLE public.trip OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16458)
-- Name: waypoint; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.waypoint (
    id uuid NOT NULL,
    on_trip uuid NOT NULL,
    latitude numeric,
    longitude numeric,
    "time" timestamp without time zone
);


ALTER TABLE public.waypoint OWNER TO postgres;

--
-- TOC entry 2726 (class 2604 OID 16672)
-- Name: route id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route ALTER COLUMN id SET DEFAULT nextval('public.route_id_seq'::regclass);


--
-- TOC entry 2871 (class 0 OID 16434)
-- Dependencies: 202
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.account (account_id, user_name) VALUES ('6JnJfhdq4CNfNxYdgPToDJn6xkL2', 'Minh');
INSERT INTO public.account (account_id, user_name) VALUES ('jwsIcZEzaPUPYtQN8559y0QFYco2', 'Duc');


--
-- TOC entry 2876 (class 0 OID 16501)
-- Dependencies: 207
-- Data for Name: frequent_point; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('46876828-aaec-4587-902f-47715841c348', '3f802a4f-bcde-4f06-8850-76a355e87d98', 36, 3, 73);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('ccf3d9e3-0725-4a33-bcba-6274526c7051', '3f802a4f-bcde-4f06-8850-76a355e87d98', 36, 4, 74);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('9ea2633d-659b-4d64-bb2b-f121b313ee6b', '3f802a4f-bcde-4f06-8850-76a355e87d98', 35, 4, 75);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('8706666e-090c-4bfc-856a-01c704759bef', '3f802a4f-bcde-4f06-8850-76a355e87d98', 35, 5, 76);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('aa2f1e5d-e002-4796-b58c-2d34de776004', '3f802a4f-bcde-4f06-8850-76a355e87d98', 35, 6, 77);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('d576a443-0db2-49f5-ade3-11b870cb9c2e', '3f802a4f-bcde-4f06-8850-76a355e87d98', 35, 7, 78);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('81c834e8-f6f2-4e3d-92a2-48d8509db3f4', '3f802a4f-bcde-4f06-8850-76a355e87d98', 35, 8, 79);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('da5c3709-9b4e-4a39-9cc3-5e0a3a6ccb54', '3f802a4f-bcde-4f06-8850-76a355e87d98', 35, 9, 80);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('03560501-9129-4978-a3d4-37abeacacf9e', '3f802a4f-bcde-4f06-8850-76a355e87d98', 35, 10, 81);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('c26db265-f9e1-40d2-9721-71616104c757', '3f802a4f-bcde-4f06-8850-76a355e87d98', 35, 11, 82);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('269a74dc-2c27-48ce-8201-9fe714c9d99c', '3f802a4f-bcde-4f06-8850-76a355e87d98', 35, 12, 83);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('2abe1f40-3f52-4eb2-8b06-8d34f7bef577', '3f802a4f-bcde-4f06-8850-76a355e87d98', 34, 12, 84);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('2c3fa0f8-a44d-4068-9ab1-3e0811bac694', '3f802a4f-bcde-4f06-8850-76a355e87d98', 34, 13, 85);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('eb1ff2dc-6a4b-4d2c-ae73-fe019e4384cf', '3f802a4f-bcde-4f06-8850-76a355e87d98', 34, 14, 86);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('208742d7-18f1-4e95-9263-ecca9de09e9c', '3f802a4f-bcde-4f06-8850-76a355e87d98', 33, 14, 87);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('92d9d913-621f-4b61-b820-6dfce90c422f', '3f802a4f-bcde-4f06-8850-76a355e87d98', 33, 15, 88);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('80fe707e-da88-4753-b093-1cb95fc2dfc8', '3f802a4f-bcde-4f06-8850-76a355e87d98', 32, 15, 89);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('e6ece463-bc14-4ed7-8ddc-cae3e9d4700f', 'dee75198-043c-4850-96a4-2aec09bf3ca0', 33, 2, 69);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('982e5d17-782b-47e7-9fd6-aca162dbb872', 'dee75198-043c-4850-96a4-2aec09bf3ca0', 34, 2, 70);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('33458c53-e7ca-4839-aa16-48608e806da8', 'dee75198-043c-4850-96a4-2aec09bf3ca0', 34, 3, 71);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('7743b19a-e9c2-499c-a9f6-0822260938f0', 'dee75198-043c-4850-96a4-2aec09bf3ca0', 35, 3, 72);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('e864267a-bf38-4f89-b29f-e4e8f0ecf7d1', 'dee75198-043c-4850-96a4-2aec09bf3ca0', 36, 3, 73);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('b5361f47-a547-4fd5-ac72-fe0190ea3f73', 'dee75198-043c-4850-96a4-2aec09bf3ca0', 36, 4, 74);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('df2a0296-e6d5-4c3f-b593-228dd5e519bb', 'dee75198-043c-4850-96a4-2aec09bf3ca0', 35, 4, 75);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('31a33452-f6e4-4375-a7be-781411e63458', 'dee75198-043c-4850-96a4-2aec09bf3ca0', 35, 5, 76);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('8cf6f347-0ba8-4221-badb-f66bd6159776', 'dee75198-043c-4850-96a4-2aec09bf3ca0', 35, 6, 77);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('daa47021-4b4d-44ee-b3d6-931c64a5f014', 'dee75198-043c-4850-96a4-2aec09bf3ca0', 35, 7, 78);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('2a6173d2-d984-4807-b915-7005530e7b78', 'dee75198-043c-4850-96a4-2aec09bf3ca0', 35, 8, 79);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('b94035d9-61a8-4600-a2c9-ea612d3a1daa', 'dee75198-043c-4850-96a4-2aec09bf3ca0', 35, 9, 80);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('6a6d57a3-f61a-4ad1-8fb0-e63d2997c574', 'dee75198-043c-4850-96a4-2aec09bf3ca0', 35, 10, 81);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('93f1978e-cd1e-4cbc-a8da-9682d9dd00f0', 'dee75198-043c-4850-96a4-2aec09bf3ca0', 35, 11, 82);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('ae0664ed-ad44-49b7-9786-9e4921bf5946', 'dee75198-043c-4850-96a4-2aec09bf3ca0', 35, 12, 83);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('b3ea056e-3398-4119-a503-8cb9f8f46ee9', 'dee75198-043c-4850-96a4-2aec09bf3ca0', 34, 12, 84);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('dec9b00b-806a-4458-bc4e-87748367adef', 'dee75198-043c-4850-96a4-2aec09bf3ca0', 34, 13, 85);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('aaab59fd-6317-4287-958f-795c21bd4601', 'dee75198-043c-4850-96a4-2aec09bf3ca0', 34, 14, 86);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('57d1c637-a0cf-4fe3-b32e-1c7423196b05', 'dee75198-043c-4850-96a4-2aec09bf3ca0', 33, 14, 87);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('0fec5d23-9f5d-4712-a4b7-d606299a25c2', 'dee75198-043c-4850-96a4-2aec09bf3ca0', 33, 15, 88);
INSERT INTO public.frequent_point (id, frequent_route_id, lat, lng, "time") VALUES ('c0fcccb5-9194-4f25-aaed-e430d8af8a4f', 'dee75198-043c-4850-96a4-2aec09bf3ca0', 32, 15, 89);


--
-- TOC entry 2877 (class 0 OID 16506)
-- Dependencies: 208
-- Data for Name: frequent_route; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.frequent_route (id, account_id) VALUES ('3f802a4f-bcde-4f06-8850-76a355e87d98', '6JnJfhdq4CNfNxYdgPToDJn6xkL2');
INSERT INTO public.frequent_route (id, account_id) VALUES ('dee75198-043c-4850-96a4-2aec09bf3ca0', 'jwsIcZEzaPUPYtQN8559y0QFYco2');


--
-- TOC entry 2875 (class 0 OID 16480)
-- Dependencies: 206
-- Data for Name: grid_point; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('4e464657-8f54-4735-b6c1-71e65354df3e', 'cb0325e8-cc35-4107-841a-f7fb0b778a05', 36, 3, 73);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('0a3876af-fc4c-49d3-9ed8-f6e3b3255605', 'cb0325e8-cc35-4107-841a-f7fb0b778a05', 36, 4, 74);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('feb8a1cf-0a10-4fae-9d75-2cae62f2c152', 'cb0325e8-cc35-4107-841a-f7fb0b778a05', 35, 4, 75);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('40dc6829-c486-4e9f-a719-39451195a1ca', 'cb0325e8-cc35-4107-841a-f7fb0b778a05', 35, 5, 76);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('9cda3e28-9126-4615-baee-dfdf1187f077', 'cb0325e8-cc35-4107-841a-f7fb0b778a05', 35, 6, 77);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('0c65b093-a92d-45d8-b1bf-8f74bf432ee1', 'cb0325e8-cc35-4107-841a-f7fb0b778a05', 35, 7, 78);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('116676fb-f5b1-45c4-88a0-17dfb89fdb72', 'cb0325e8-cc35-4107-841a-f7fb0b778a05', 35, 8, 79);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('78ce828d-1550-429e-8946-1cb5669fa9b8', 'cb0325e8-cc35-4107-841a-f7fb0b778a05', 35, 9, 80);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('df39bfd1-55bb-4d40-a4c7-4029d3835c08', 'cb0325e8-cc35-4107-841a-f7fb0b778a05', 35, 10, 81);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('e4f0730a-f34f-4f89-8103-ce0502838238', 'cb0325e8-cc35-4107-841a-f7fb0b778a05', 35, 11, 82);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('6713e51f-50d4-4a50-8a72-972381953cb0', 'cb0325e8-cc35-4107-841a-f7fb0b778a05', 35, 12, 83);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('8ad9021c-cd50-4f88-836c-278469535f4a', 'cb0325e8-cc35-4107-841a-f7fb0b778a05', 34, 12, 84);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('be078ab0-40f8-4cc0-99a5-d8d7792ac4f1', 'cb0325e8-cc35-4107-841a-f7fb0b778a05', 34, 13, 85);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('f621aad5-73bc-4ff7-8088-ab86ea4bf2b9', 'cb0325e8-cc35-4107-841a-f7fb0b778a05', 34, 14, 86);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('e81ae236-5498-498d-b89e-eefd3711872c', 'cb0325e8-cc35-4107-841a-f7fb0b778a05', 33, 14, 87);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('5d403918-75ac-4d2c-86ab-5ae6e3b0214f', 'cb0325e8-cc35-4107-841a-f7fb0b778a05', 33, 15, 88);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('5ddcd09d-5315-424a-bcb6-5d9582978870', '2742ba64-2230-4422-afb9-3d13f0ad7d64', 36, 3, 73);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('a7027def-0012-4418-956f-20b22a58ae8e', '2742ba64-2230-4422-afb9-3d13f0ad7d64', 36, 4, 74);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('121da17c-0d77-4017-804f-31dac73b1a29', '2742ba64-2230-4422-afb9-3d13f0ad7d64', 35, 4, 75);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('c1adef7c-e5ba-4e93-978c-c089226b9362', '2742ba64-2230-4422-afb9-3d13f0ad7d64', 35, 5, 76);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('293a1f17-7134-42c6-8232-6ab720da95bb', '2742ba64-2230-4422-afb9-3d13f0ad7d64', 35, 6, 77);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('81927454-6fe7-4cc4-8ec4-c9c927b83907', '2742ba64-2230-4422-afb9-3d13f0ad7d64', 35, 7, 78);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('6ce4ef1b-2191-40dc-b1d8-c4adda9ab309', '2742ba64-2230-4422-afb9-3d13f0ad7d64', 35, 8, 79);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('20a11f95-6ada-4860-85c2-c13933cff46c', '2742ba64-2230-4422-afb9-3d13f0ad7d64', 35, 9, 80);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('9fd044b9-99ae-47c5-903d-411b1e729197', '2742ba64-2230-4422-afb9-3d13f0ad7d64', 35, 10, 81);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('8ab23fe9-8dff-42e4-9981-3179465f3d10', '2742ba64-2230-4422-afb9-3d13f0ad7d64', 35, 11, 82);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('ae1ba035-6a5c-4f41-b08a-a0eb249cbf64', '2742ba64-2230-4422-afb9-3d13f0ad7d64', 35, 12, 83);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('2d9e88dd-e1b6-401c-88f7-a8241b1af4ec', '2742ba64-2230-4422-afb9-3d13f0ad7d64', 34, 12, 84);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('d9e87a88-660f-4c5e-9c53-c2fb5655f559', '2742ba64-2230-4422-afb9-3d13f0ad7d64', 34, 13, 85);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('991ec82b-037b-42b2-9202-32a8a124e09d', '2742ba64-2230-4422-afb9-3d13f0ad7d64', 34, 14, 86);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('405a7d6c-684e-4795-9232-c352a7264f7e', '2742ba64-2230-4422-afb9-3d13f0ad7d64', 33, 14, 87);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('7a84ade3-8f9e-4941-8656-b65800db7c41', '2742ba64-2230-4422-afb9-3d13f0ad7d64', 33, 15, 88);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('5bbcca11-f598-4a77-ad91-5b26c164768a', '2742ba64-2230-4422-afb9-3d13f0ad7d64', 32, 15, 89);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('9ded4dfb-0ea7-4276-bc2e-fc14ed54d659', '2742ba64-2230-4422-afb9-3d13f0ad7d64', 33, 15, 90);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('e487d3dd-8585-40d4-b82a-0523fecf070e', '2742ba64-2230-4422-afb9-3d13f0ad7d64', 33, 16, 91);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('77d52fb5-9d1f-4c6e-9bb9-44db76836f77', 'cadfd3b7-06cd-4f97-a77b-19f1cb574785', 36, 3, 73);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('81a720a0-1231-44a3-90e1-92bbfbf4e367', 'cadfd3b7-06cd-4f97-a77b-19f1cb574785', 36, 4, 74);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('f83cf77b-6e25-4c54-8947-d10c04a5073d', 'cadfd3b7-06cd-4f97-a77b-19f1cb574785', 35, 4, 75);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('ba3b50bc-9df9-4bc5-9589-5aaf1537510d', 'cadfd3b7-06cd-4f97-a77b-19f1cb574785', 35, 5, 76);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('3d12c0a8-21d6-49d0-964c-6a12f35be231', 'cadfd3b7-06cd-4f97-a77b-19f1cb574785', 35, 6, 77);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('20e44b71-128c-4f4c-8494-6bd370a97600', 'cadfd3b7-06cd-4f97-a77b-19f1cb574785', 35, 7, 78);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('c9a3f622-b207-4f53-8de8-145e9b705a27', 'cadfd3b7-06cd-4f97-a77b-19f1cb574785', 35, 8, 79);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('cae957a5-3548-4cc0-afed-b8d9ab473ca7', 'cadfd3b7-06cd-4f97-a77b-19f1cb574785', 35, 9, 80);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('71260880-579a-4437-9776-6a450d75fb7d', 'cadfd3b7-06cd-4f97-a77b-19f1cb574785', 35, 10, 81);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('df7b066a-e6d4-48a7-89ed-9b247d2ef504', 'cadfd3b7-06cd-4f97-a77b-19f1cb574785', 35, 11, 82);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('9e0a1985-4836-4f55-9642-a51a8ac7d768', 'cadfd3b7-06cd-4f97-a77b-19f1cb574785', 35, 12, 83);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('1c5878e3-81ba-4735-b3b8-f5e62692e94e', 'cadfd3b7-06cd-4f97-a77b-19f1cb574785', 34, 12, 84);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('5ff0ae23-e60d-485e-a558-5551b2707bce', 'cadfd3b7-06cd-4f97-a77b-19f1cb574785', 34, 13, 85);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('73ccb426-d370-47ad-839b-e7e19c2e6ae1', 'cadfd3b7-06cd-4f97-a77b-19f1cb574785', 34, 14, 86);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('b85f6bb6-19b1-4df3-9e39-4afc529c309d', 'cadfd3b7-06cd-4f97-a77b-19f1cb574785', 33, 14, 87);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('7ca84aef-b619-4e0f-9fd7-235678391c49', 'cadfd3b7-06cd-4f97-a77b-19f1cb574785', 33, 15, 88);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('06ed5049-cdfd-44dd-9525-d094079312e2', 'cadfd3b7-06cd-4f97-a77b-19f1cb574785', 32, 15, 89);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('f00aa659-a23c-4a94-94f6-b8ef0ed406d9', 'cadfd3b7-06cd-4f97-a77b-19f1cb574785', 32, 16, 90);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('14a429f9-b7a8-4ad4-a5e4-cea45f80f1d5', 'cadfd3b7-06cd-4f97-a77b-19f1cb574785', 32, 17, 91);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('2d4bcbba-f0fe-4ecb-b11f-ecf0c7a262cd', '9b57a0bd-7768-46fb-9cd3-26f810f5ee26', 36, 3, 73);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('bc6f584d-7eb5-4871-b4c4-7062d7c4aae8', '9b57a0bd-7768-46fb-9cd3-26f810f5ee26', 36, 4, 74);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('cc25304e-a3ca-40f9-bee9-8cb3307556d9', '9b57a0bd-7768-46fb-9cd3-26f810f5ee26', 35, 4, 75);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('812b262c-ec4a-4166-b254-b482c566771b', '9b57a0bd-7768-46fb-9cd3-26f810f5ee26', 35, 5, 76);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('51322917-2b42-4528-b635-ff0e95dac3bc', '9b57a0bd-7768-46fb-9cd3-26f810f5ee26', 35, 6, 77);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('3cc8a345-a2ad-44fb-8131-7e3b46ce394b', '9b57a0bd-7768-46fb-9cd3-26f810f5ee26', 35, 7, 78);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('5d2906ce-2226-419e-bc2b-6f549c0adcc0', '9b57a0bd-7768-46fb-9cd3-26f810f5ee26', 35, 8, 79);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('b3c5dc56-050a-4ab7-9659-e0562ad962a0', '9b57a0bd-7768-46fb-9cd3-26f810f5ee26', 35, 9, 80);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('2ada148b-0487-48af-914a-55ea5065ca72', '9b57a0bd-7768-46fb-9cd3-26f810f5ee26', 35, 10, 81);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('8f205263-9de2-4d1e-9b89-16891f6ee9ca', '9b57a0bd-7768-46fb-9cd3-26f810f5ee26', 35, 11, 82);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('a5742995-cc4e-4dcc-ab80-4a8ec47dba31', '9b57a0bd-7768-46fb-9cd3-26f810f5ee26', 35, 12, 83);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('6e1f5e87-2d21-4ba8-b1c8-a8b6ed1b780f', '9b57a0bd-7768-46fb-9cd3-26f810f5ee26', 34, 12, 84);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('86d99558-d0d7-4f1a-ad71-c70d7905e227', '9b57a0bd-7768-46fb-9cd3-26f810f5ee26', 34, 13, 85);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('8c00a324-c6a2-4533-b531-739d40dbaf3b', '9b57a0bd-7768-46fb-9cd3-26f810f5ee26', 34, 14, 86);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('dd2a096d-766a-4e1f-9039-041518820df9', '9b57a0bd-7768-46fb-9cd3-26f810f5ee26', 33, 14, 87);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('20a515b8-26eb-4ba9-8639-ac3fe1eac8c6', '9b57a0bd-7768-46fb-9cd3-26f810f5ee26', 33, 15, 88);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('d0899685-a8d3-444c-9ac5-ef9a9571a857', '9b57a0bd-7768-46fb-9cd3-26f810f5ee26', 32, 15, 89);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('4bab339a-85af-4d58-b938-2302a0645786', '190fb864-ed25-486b-998a-f4e86c11b51f', 36, 3, 73);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('b4e0f15b-8800-4218-b1e7-f3a86c15db92', '190fb864-ed25-486b-998a-f4e86c11b51f', 36, 4, 74);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('9ce193f9-cd22-4909-b3e7-f92ace48f3b4', '190fb864-ed25-486b-998a-f4e86c11b51f', 35, 4, 75);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('abe5dd2f-b19c-4361-91e1-f8b3d3cbc288', '190fb864-ed25-486b-998a-f4e86c11b51f', 35, 5, 76);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('e19daa9a-df40-4fa7-b8cc-9d5ebdfc230c', '190fb864-ed25-486b-998a-f4e86c11b51f', 35, 6, 77);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('7da43f89-48e1-40f9-9013-c485f26fb4cb', '190fb864-ed25-486b-998a-f4e86c11b51f', 35, 7, 78);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('80189cfc-8620-4c00-a3d1-7e133306afed', '190fb864-ed25-486b-998a-f4e86c11b51f', 35, 8, 79);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('e17f3c14-37c5-41b6-a714-0d3c9309a61a', '190fb864-ed25-486b-998a-f4e86c11b51f', 35, 9, 80);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('fa7dbb48-62a1-476a-856f-dca7422169d5', '190fb864-ed25-486b-998a-f4e86c11b51f', 35, 10, 81);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('8a01f077-d073-4908-ae25-fb78e87e95b3', '190fb864-ed25-486b-998a-f4e86c11b51f', 35, 11, 82);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('f81dc77d-6a9c-4205-904d-af4c8518b679', '190fb864-ed25-486b-998a-f4e86c11b51f', 35, 12, 83);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('bf031645-8a4d-4dd0-b8f1-8bc9171d6a6c', '190fb864-ed25-486b-998a-f4e86c11b51f', 34, 12, 84);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('a5da808f-83ec-48c7-b686-05704d9834db', '190fb864-ed25-486b-998a-f4e86c11b51f', 34, 11, 85);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('ffd9f68f-30c8-47a3-9c7b-dc9b489a87e1', 'dd1b01ba-ab37-4be1-87e4-cdeaf6d7e536', 36, 3, 73);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('cb783259-9826-401b-aca4-55b26fd953a6', 'dd1b01ba-ab37-4be1-87e4-cdeaf6d7e536', 36, 4, 74);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('822088ef-acd0-486c-8c0c-5a4f3f1c05f1', 'dd1b01ba-ab37-4be1-87e4-cdeaf6d7e536', 35, 4, 75);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('bfb84a22-df10-467c-963d-d14a130664c2', 'dd1b01ba-ab37-4be1-87e4-cdeaf6d7e536', 35, 5, 76);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('fbcf925d-92f3-4556-9acd-66a1362cf8d6', 'dd1b01ba-ab37-4be1-87e4-cdeaf6d7e536', 35, 6, 77);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('c0615555-58a0-4871-90a0-8a91059b7c6d', 'dd1b01ba-ab37-4be1-87e4-cdeaf6d7e536', 35, 7, 78);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('f07fb938-60a5-4f6a-82b6-9e82cb96bb35', 'dd1b01ba-ab37-4be1-87e4-cdeaf6d7e536', 35, 8, 79);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('785b1a06-0c71-4db7-be11-54a763d0a2ab', 'dd1b01ba-ab37-4be1-87e4-cdeaf6d7e536', 35, 9, 80);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('6e5ffef2-63e4-4e7e-9f65-e73f2bc792df', 'dd1b01ba-ab37-4be1-87e4-cdeaf6d7e536', 35, 10, 81);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('f8a00b06-b3ef-4413-8ac5-c81211482d28', 'dd1b01ba-ab37-4be1-87e4-cdeaf6d7e536', 34, 10, 82);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('6cfa086d-cee0-49db-a6be-c7e6207e6a37', 'dd1b01ba-ab37-4be1-87e4-cdeaf6d7e536', 33, 10, 83);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('fa19ac90-9a3f-4998-bcee-38e6f12b8fa4', 'dd1b01ba-ab37-4be1-87e4-cdeaf6d7e536', 32, 11, 84);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('cf01a215-a3a2-4f09-8f90-8b6806d7bd29', '29ec48c9-e845-4099-9cb1-cab2102f6291', 36, 3, 73);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('e90a5afd-5866-4269-8659-56b2f3bb77cf', '29ec48c9-e845-4099-9cb1-cab2102f6291', 36, 4, 74);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('8b275bfd-a340-4d42-a588-4c7cba01a071', '29ec48c9-e845-4099-9cb1-cab2102f6291', 35, 4, 75);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('1cb7e850-7a53-4e16-97c1-0229260d8266', '29ec48c9-e845-4099-9cb1-cab2102f6291', 35, 5, 76);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('fe0addf3-f89a-4400-9451-dd77f2aa6eee', '29ec48c9-e845-4099-9cb1-cab2102f6291', 35, 6, 77);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('c441be96-5745-4846-8b7e-d05fdad72828', '29ec48c9-e845-4099-9cb1-cab2102f6291', 35, 7, 78);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('f277b76a-2e0b-4ae1-9ffb-184078a075e8', '29ec48c9-e845-4099-9cb1-cab2102f6291', 35, 8, 79);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('279818ce-c257-485c-be82-2db7f920b949', '29ec48c9-e845-4099-9cb1-cab2102f6291', 35, 9, 80);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('cfce7ea3-2681-4e96-99ab-94b65c2e30e4', '29ec48c9-e845-4099-9cb1-cab2102f6291', 35, 10, 81);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('cf118718-9b36-47d6-b694-26c06c90d90b', '29ec48c9-e845-4099-9cb1-cab2102f6291', 35, 11, 82);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('368e4f91-d69e-4018-b2b1-c5ae4ef79617', '29ec48c9-e845-4099-9cb1-cab2102f6291', 35, 12, 83);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('846ddd34-7e11-437a-96a4-89356c6f62b5', '29ec48c9-e845-4099-9cb1-cab2102f6291', 34, 12, 84);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('765b8d14-af0e-45e3-8ac8-15b4a80f68b1', '29ec48c9-e845-4099-9cb1-cab2102f6291', 34, 13, 85);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('57ff46a7-fe9a-4d33-9ac6-6a33f3638c75', '29ec48c9-e845-4099-9cb1-cab2102f6291', 34, 14, 86);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('ae6deca6-c9d8-4f64-a369-c36f22380a3a', '29ec48c9-e845-4099-9cb1-cab2102f6291', 33, 14, 87);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('d019ed88-1d36-47cb-a6df-afa2de0281f2', '29ec48c9-e845-4099-9cb1-cab2102f6291', 33, 15, 88);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('975fd626-b9b9-4a98-81a6-ed214551a1cd', '29ec48c9-e845-4099-9cb1-cab2102f6291', 32, 15, 89);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('4da83252-d212-4223-9ce7-8c81163a82b6', '29ec48c9-e845-4099-9cb1-cab2102f6291', 32, 16, 90);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('f884cdd5-f54e-484e-855f-1b2137f4a92a', '29ec48c9-e845-4099-9cb1-cab2102f6291', 32, 17, 91);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('cd1c04d6-ef5f-4a4a-8abe-87f7e31904d2', '29ec48c9-e845-4099-9cb1-cab2102f6291', 32, 18, 92);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('d2d3cc76-e8b9-47b6-8475-0fcaffab7a83', '5e29295d-8d52-4135-aad9-625ee301944f', 36, 3, 73);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('05da6b84-276a-4f93-b991-af08472082df', '5e29295d-8d52-4135-aad9-625ee301944f', 36, 4, 74);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('c0f1304a-7f20-49c6-aeb4-65709ce56447', '5e29295d-8d52-4135-aad9-625ee301944f', 35, 4, 75);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('10b51c33-ecaf-4d60-a9ba-da82ec35abb6', '5e29295d-8d52-4135-aad9-625ee301944f', 35, 5, 76);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('be09e58f-8661-49f9-87e5-64b1df716462', '5e29295d-8d52-4135-aad9-625ee301944f', 35, 6, 77);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('2681d5cc-c68b-44b1-bcdf-8442310cb453', '5e29295d-8d52-4135-aad9-625ee301944f', 35, 7, 78);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('dfc1bfb6-ebd8-4538-b008-da7d08af6f0f', '5e29295d-8d52-4135-aad9-625ee301944f', 35, 8, 79);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('1b9fa59f-68bf-485a-bcea-286cecce1136', '5e29295d-8d52-4135-aad9-625ee301944f', 35, 9, 80);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('0a79d81a-d07b-45de-896c-9b2387e9b0c8', '5e29295d-8d52-4135-aad9-625ee301944f', 35, 10, 81);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('46adff36-7eb7-4db0-8f23-c5bfc2f97ed5', '5e29295d-8d52-4135-aad9-625ee301944f', 35, 11, 82);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('73ebbebd-4fe6-4741-be49-65289ffd2c9c', '5e29295d-8d52-4135-aad9-625ee301944f', 35, 12, 83);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('dae07099-2e5b-4008-8511-68f00109c282', '5e29295d-8d52-4135-aad9-625ee301944f', 34, 12, 84);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('acc86cd0-fba4-4473-b3ed-75bc9da1ddc9', '5e29295d-8d52-4135-aad9-625ee301944f', 34, 13, 85);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('ee3c295f-83e8-4e4a-994b-3bcdaea4bdd6', '5e29295d-8d52-4135-aad9-625ee301944f', 34, 14, 86);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('1022d9c5-13cb-4ad3-841c-8341574fc7fa', '5e29295d-8d52-4135-aad9-625ee301944f', 33, 14, 87);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('6d2d017a-f79c-42b9-933f-9e64f73e47bf', '5e29295d-8d52-4135-aad9-625ee301944f', 33, 15, 88);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('5b97204f-68af-41ed-a074-cbe359a01a3c', '5e29295d-8d52-4135-aad9-625ee301944f', 32, 15, 89);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('218fddf4-b5cd-4326-a1b6-dcc9ae29aecd', '5e29295d-8d52-4135-aad9-625ee301944f', 32, 16, 90);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('4bd347ad-a197-4c3d-b913-059b09968d12', '5e29295d-8d52-4135-aad9-625ee301944f', 32, 17, 91);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('0571f592-e22a-4a8c-a78a-1decb43a98fa', '5e29295d-8d52-4135-aad9-625ee301944f', 32, 18, 92);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('3a8be2cc-6266-49f5-afbe-6ee7e616af53', 'c011fd3e-3b05-4e23-8b41-dc4e8260b0ee', 36, 3, 73);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('9d77e35f-3927-48d4-88b6-b4d26eedbcfd', 'c011fd3e-3b05-4e23-8b41-dc4e8260b0ee', 36, 4, 74);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('4a60aa5c-444d-4262-a125-48e3c0bc7afa', 'c011fd3e-3b05-4e23-8b41-dc4e8260b0ee', 35, 4, 75);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('271f71e2-e697-4dad-b638-e8e736366db0', 'c011fd3e-3b05-4e23-8b41-dc4e8260b0ee', 35, 5, 76);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('86c30a15-efb2-4068-b45a-c428383f651f', 'c011fd3e-3b05-4e23-8b41-dc4e8260b0ee', 35, 6, 77);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('ea61ec04-3929-40ac-a4a1-1127b4781879', 'c011fd3e-3b05-4e23-8b41-dc4e8260b0ee', 35, 7, 78);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('86865153-e7ba-450f-9332-fdd055d85fb8', 'c011fd3e-3b05-4e23-8b41-dc4e8260b0ee', 35, 8, 79);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('42af065d-4530-47dc-9339-b0f1986894db', 'c011fd3e-3b05-4e23-8b41-dc4e8260b0ee', 35, 9, 80);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('c04e4c65-b5e6-450e-ab52-e3ee17df86a0', 'c011fd3e-3b05-4e23-8b41-dc4e8260b0ee', 35, 10, 81);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('16834dc1-b5db-4f0e-8a8e-3cabb97f1ba0', 'c011fd3e-3b05-4e23-8b41-dc4e8260b0ee', 35, 11, 82);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('2da9aae0-c3be-4119-a76e-7ef3ad43e9ac', 'c011fd3e-3b05-4e23-8b41-dc4e8260b0ee', 35, 12, 83);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('0cc9fb1d-641f-4857-a861-ef61eff2ed6f', 'c011fd3e-3b05-4e23-8b41-dc4e8260b0ee', 34, 12, 84);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('af0cf004-ba33-446f-bd41-d4fd53e6549e', 'c011fd3e-3b05-4e23-8b41-dc4e8260b0ee', 34, 13, 85);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('d3614b5a-ce06-45d0-8129-da0524ce8b07', 'c011fd3e-3b05-4e23-8b41-dc4e8260b0ee', 34, 14, 86);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('a2a33f3e-b678-4743-a202-9c4b0af6b821', 'c011fd3e-3b05-4e23-8b41-dc4e8260b0ee', 33, 14, 87);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('dc74b830-8164-4872-a0fd-7d84c2e2411a', 'c011fd3e-3b05-4e23-8b41-dc4e8260b0ee', 33, 15, 88);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('27af2229-7fe8-47e5-894d-e83df7aaa09b', 'c011fd3e-3b05-4e23-8b41-dc4e8260b0ee', 32, 15, 89);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('042a3b43-a9db-4ee8-8f78-ee6914cda471', 'c011fd3e-3b05-4e23-8b41-dc4e8260b0ee', 32, 16, 90);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('11046c67-9094-450c-afc0-af6a577df9d4', '41cd5d55-41f6-4379-870e-1102c5fcd414', 36, 3, 73);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('3a363b0e-276e-4871-a2bb-4c333c8b1b1f', '41cd5d55-41f6-4379-870e-1102c5fcd414', 36, 4, 74);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('378ec6b3-8b35-4938-bee5-b861d3c36552', '41cd5d55-41f6-4379-870e-1102c5fcd414', 35, 4, 75);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('d8560f0e-d01c-448b-b571-1eb52960ac6e', '41cd5d55-41f6-4379-870e-1102c5fcd414', 35, 5, 76);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('c1214a2d-4e50-4a2a-bfb0-00239321940e', '41cd5d55-41f6-4379-870e-1102c5fcd414', 35, 6, 77);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('ed3c8855-ecf5-4ea2-b888-c40ffa48e95c', '41cd5d55-41f6-4379-870e-1102c5fcd414', 35, 7, 78);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('3666f92f-f586-4203-8537-a976020d82e4', '41cd5d55-41f6-4379-870e-1102c5fcd414', 35, 8, 79);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('81c2e4a2-6618-49ed-966a-4653bc39004a', '41cd5d55-41f6-4379-870e-1102c5fcd414', 35, 9, 80);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('f199ef8b-7f5e-42d4-a2e5-83b169acac8e', '41cd5d55-41f6-4379-870e-1102c5fcd414', 35, 10, 81);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('dd65ae20-4f41-47ad-b2e8-7f74f10c4169', '41cd5d55-41f6-4379-870e-1102c5fcd414', 35, 11, 82);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('9376a76a-6200-40b7-a2f5-dd18476c3e6a', '41cd5d55-41f6-4379-870e-1102c5fcd414', 36, 11, 83);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('73f3e6b2-e61b-4fb3-9594-cdcf7db70985', '41cd5d55-41f6-4379-870e-1102c5fcd414', 37, 11, 84);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('05063372-a9b4-4156-8dde-0bf86feb872a', '0f925217-5f08-4396-b9d3-141f50cc29e1', 36, 3, 73);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('546b33aa-c08f-4407-931e-979259396423', '0f925217-5f08-4396-b9d3-141f50cc29e1', 36, 4, 74);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('6b567c20-fb86-4983-b8bc-f1d07f8a18f7', '0f925217-5f08-4396-b9d3-141f50cc29e1', 35, 4, 75);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('23d3ef88-2fb0-48aa-b552-2632b263e208', '0f925217-5f08-4396-b9d3-141f50cc29e1', 35, 5, 76);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('bc457922-def2-433b-869b-ed6f732645cf', '0f925217-5f08-4396-b9d3-141f50cc29e1', 35, 6, 77);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('0d0980ad-093e-4a0d-b03b-c8faa4dca6ff', '0f925217-5f08-4396-b9d3-141f50cc29e1', 35, 7, 78);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('8cb02653-0f11-4846-a026-dd430c24a404', '0f925217-5f08-4396-b9d3-141f50cc29e1', 35, 8, 79);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('68ecddb0-9db5-43f3-9230-31b3e7ad2d55', '0f925217-5f08-4396-b9d3-141f50cc29e1', 35, 9, 80);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('4ba2ab6e-8522-4713-8172-6bd6590de395', '0f925217-5f08-4396-b9d3-141f50cc29e1', 35, 10, 81);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('fe40dab9-b151-438a-9403-eb7026b4c59a', '0f925217-5f08-4396-b9d3-141f50cc29e1', 35, 11, 82);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('6cda6f2e-203a-49dd-b3f8-fcf6540e9fb3', '0f925217-5f08-4396-b9d3-141f50cc29e1', 35, 12, 83);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('bd4da2f2-9b8a-4e53-be08-0eee2fb30916', '0f925217-5f08-4396-b9d3-141f50cc29e1', 34, 12, 84);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('8ad43de1-76d0-4b6a-a5b7-b897d8ec9eb5', '0f925217-5f08-4396-b9d3-141f50cc29e1', 34, 13, 85);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('7d771d45-c284-4c12-9a45-c3e8cd952bcf', '0f925217-5f08-4396-b9d3-141f50cc29e1', 34, 14, 86);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('75ca39ba-e253-4f8c-968c-b084477b7b6d', '0f925217-5f08-4396-b9d3-141f50cc29e1', 33, 14, 87);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('4aaa10c9-1708-4ab7-b621-d7b7365d88ce', '0f925217-5f08-4396-b9d3-141f50cc29e1', 33, 15, 88);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('384e81d2-c149-4c0f-a41d-b4d6f96fcd75', '0f925217-5f08-4396-b9d3-141f50cc29e1', 32, 15, 89);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('aacb5232-0b61-46c1-8b5b-3181f8d5ae07', '714f8d1b-48b1-414f-a430-1e37e16b6005', 36, 3, 73);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('8c7ac934-25a8-4782-9add-a0540a5f8a2e', '714f8d1b-48b1-414f-a430-1e37e16b6005', 36, 4, 74);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('8569e6ac-2c84-4797-b307-ac289b62289d', '714f8d1b-48b1-414f-a430-1e37e16b6005', 35, 4, 75);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('627c23f7-a20b-43c6-a65f-b82ea5e2f91e', '714f8d1b-48b1-414f-a430-1e37e16b6005', 35, 5, 76);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('5617e56f-da3e-4419-86f1-70a41fd16fb4', '714f8d1b-48b1-414f-a430-1e37e16b6005', 35, 6, 77);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('43cc87aa-5e35-4d36-9fab-a8fe55141eec', '714f8d1b-48b1-414f-a430-1e37e16b6005', 35, 7, 78);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('9fc7a762-0ad0-49dc-a9d2-57e46e0f94b3', '714f8d1b-48b1-414f-a430-1e37e16b6005', 35, 8, 79);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('165e5128-aa73-4853-9c25-836863f81e59', '714f8d1b-48b1-414f-a430-1e37e16b6005', 35, 9, 80);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('2f01ea6d-b19d-40a0-8e5a-5ef934fb755b', '714f8d1b-48b1-414f-a430-1e37e16b6005', 35, 10, 81);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('88fc2f43-2adf-445c-8392-c7a6dbbe2d47', '714f8d1b-48b1-414f-a430-1e37e16b6005', 35, 11, 82);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('b0c7b24a-7451-4ecc-a9e5-b67aa331cb67', '714f8d1b-48b1-414f-a430-1e37e16b6005', 35, 12, 83);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('d1b14c23-0ce4-41ff-aa7e-54790b8953e8', '714f8d1b-48b1-414f-a430-1e37e16b6005', 34, 12, 84);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('d1cd4aa7-e94a-4c42-a44a-416f5d4a79be', '714f8d1b-48b1-414f-a430-1e37e16b6005', 34, 13, 85);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('625b7039-4410-4b27-b43e-011ab0b041d5', '714f8d1b-48b1-414f-a430-1e37e16b6005', 34, 14, 86);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('9ed01f3b-0752-48dc-a500-2349bf98b057', '714f8d1b-48b1-414f-a430-1e37e16b6005', 33, 14, 87);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('7b61f9e8-45da-4d0d-a580-2d8f4c51af3c', '714f8d1b-48b1-414f-a430-1e37e16b6005', 33, 15, 88);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('62eb81ab-77b2-4f74-a452-f7e05c6a6b85', '714f8d1b-48b1-414f-a430-1e37e16b6005', 32, 15, 89);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('3d1607b5-4e63-4032-ad2a-f0e6c441ea4d', '714f8d1b-48b1-414f-a430-1e37e16b6005', 33, 15, 90);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('bbe091dd-55fb-42a2-beff-c0439c4b234b', 'f4a89274-cd22-4404-b387-2b27ff02f527', 36, 3, 73);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('2a4e5dbe-e0ce-47ac-b472-650408688165', 'f4a89274-cd22-4404-b387-2b27ff02f527', 36, 4, 74);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('e63e3cb4-8483-4481-8c14-f40bb2d432ca', 'f4a89274-cd22-4404-b387-2b27ff02f527', 35, 4, 75);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('c7a39460-5db0-4659-a94c-5c43a900d309', 'f4a89274-cd22-4404-b387-2b27ff02f527', 35, 5, 76);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('cf5fd56d-1519-49a3-8348-d52aa7852b50', 'f4a89274-cd22-4404-b387-2b27ff02f527', 35, 6, 77);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('672cb395-79a8-4a04-95ec-0e52a56709eb', 'f4a89274-cd22-4404-b387-2b27ff02f527', 35, 7, 78);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('2c87e11f-abb9-4163-95e5-5ea5f8f25d91', 'f4a89274-cd22-4404-b387-2b27ff02f527', 34, 6, 79);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('67e5ec4c-8827-4f83-a985-c98c43f3c7fc', 'f4a89274-cd22-4404-b387-2b27ff02f527', 33, 6, 80);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('5a77d764-09fe-4dd3-a359-461dd3103f8b', 'f4a89274-cd22-4404-b387-2b27ff02f527', 32, 6, 81);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('e721648a-3d9b-4b81-a2ca-3be0f8f13337', 'f4a89274-cd22-4404-b387-2b27ff02f527', 31, 6, 82);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('c2f27881-78e5-4e58-92a6-369e23348911', 'f4a89274-cd22-4404-b387-2b27ff02f527', 30, 6, 83);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('d5c09a12-63b8-46c7-b358-d076b9de4322', '54bb2802-69f1-47f1-863c-3ac28e1a0e4b', 36, 3, 73);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('d372b96d-fec1-4947-b0ff-fa46789f8671', '54bb2802-69f1-47f1-863c-3ac28e1a0e4b', 36, 4, 74);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('b3b9e364-b99a-4582-956c-7afc85819c98', '54bb2802-69f1-47f1-863c-3ac28e1a0e4b', 35, 4, 75);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('87b23f47-b040-480d-b952-95dff971824e', '54bb2802-69f1-47f1-863c-3ac28e1a0e4b', 35, 5, 76);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('8d4e33e3-2042-4ef5-811a-2bc3766a64ae', '54bb2802-69f1-47f1-863c-3ac28e1a0e4b', 35, 6, 77);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('302c9fb1-4452-44e7-8251-a6d204d8c765', '54bb2802-69f1-47f1-863c-3ac28e1a0e4b', 35, 7, 78);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('4c33bd2d-5f5a-45ee-99a4-8ff2acb28ee0', '54bb2802-69f1-47f1-863c-3ac28e1a0e4b', 35, 8, 79);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('80f2d5a0-92b3-4f89-b319-e5aa617c4f89', '54bb2802-69f1-47f1-863c-3ac28e1a0e4b', 35, 9, 80);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('54a34a70-c993-442d-8e3b-5d7ea3a7bcd8', '54bb2802-69f1-47f1-863c-3ac28e1a0e4b', 35, 10, 81);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('5474990b-b932-4b52-b68b-03664ce753b1', '54bb2802-69f1-47f1-863c-3ac28e1a0e4b', 35, 11, 82);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('a5505773-773d-4cb7-9523-771109ec795e', '54bb2802-69f1-47f1-863c-3ac28e1a0e4b', 35, 12, 83);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('171c04c1-41d1-4f90-af74-faf46c0b1dd8', '54bb2802-69f1-47f1-863c-3ac28e1a0e4b', 34, 12, 84);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('b68066be-1959-4c07-9f82-58c2cd2900bd', '54bb2802-69f1-47f1-863c-3ac28e1a0e4b', 34, 13, 85);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('e04200e9-3978-4841-adf8-d5163519acb0', '54bb2802-69f1-47f1-863c-3ac28e1a0e4b', 34, 14, 86);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('1c1497b0-d83b-433d-bc24-4fe37ec43971', '54bb2802-69f1-47f1-863c-3ac28e1a0e4b', 33, 14, 87);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('edbdd506-890b-4979-b8ad-6f8459f63dcb', '54bb2802-69f1-47f1-863c-3ac28e1a0e4b', 33, 15, 88);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('375143f8-8bdb-4c0b-86e8-9ddbc6bad4e4', '54bb2802-69f1-47f1-863c-3ac28e1a0e4b', 32, 15, 89);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('c2510829-1826-4ab5-a649-b35f89984c3d', 'd417bf58-9d05-4347-aafa-5272727a1774', 33, 2, 69);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('a5be4c5c-5507-47be-8f14-dd9f6b510a82', 'd417bf58-9d05-4347-aafa-5272727a1774', 34, 2, 70);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('208be12f-56b0-475d-b707-04b6f7179e4f', 'd417bf58-9d05-4347-aafa-5272727a1774', 34, 3, 71);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('eba2d9dc-278a-4c29-b854-29bca0e29533', 'd417bf58-9d05-4347-aafa-5272727a1774', 35, 3, 72);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('2d59440f-a2af-4f54-b852-4e7ab5548aae', 'd417bf58-9d05-4347-aafa-5272727a1774', 36, 3, 73);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('fdc43e0a-ac3a-4a26-9bb2-4ac8a80c01d0', 'd417bf58-9d05-4347-aafa-5272727a1774', 36, 4, 74);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('57b81fad-1117-433f-a484-180127cdc3a1', 'd417bf58-9d05-4347-aafa-5272727a1774', 35, 4, 75);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('6ed6e2b1-df31-4f10-beb3-548aa913f29d', 'd417bf58-9d05-4347-aafa-5272727a1774', 35, 5, 76);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('040c04ad-e4bc-4482-8896-f9377ba65582', 'd417bf58-9d05-4347-aafa-5272727a1774', 35, 6, 77);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('0932dd57-3044-4991-88a1-0aa32d57b42d', 'd417bf58-9d05-4347-aafa-5272727a1774', 35, 7, 78);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('787407cc-d2db-487d-b785-12b2425a8c63', 'd417bf58-9d05-4347-aafa-5272727a1774', 35, 8, 79);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('90e0c8a6-8122-4429-b275-b1f67a7d0623', 'd417bf58-9d05-4347-aafa-5272727a1774', 35, 9, 80);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('6b29bc60-ad7b-445f-bbfb-6530cc658518', 'd417bf58-9d05-4347-aafa-5272727a1774', 35, 10, 81);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('f325dd89-2760-4ace-b926-485082fc05a1', 'd417bf58-9d05-4347-aafa-5272727a1774', 35, 11, 82);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('551be381-51b1-420c-a233-a977ee8bcce3', 'd417bf58-9d05-4347-aafa-5272727a1774', 35, 12, 83);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('7113cb61-682e-4f82-ad08-4890cd20179f', 'd417bf58-9d05-4347-aafa-5272727a1774', 34, 12, 84);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('6dc9cef9-48eb-4a85-9070-ba2286d657f1', 'd417bf58-9d05-4347-aafa-5272727a1774', 34, 13, 85);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('bcc06d44-8c1d-4b48-8753-5f04e8b3fc70', 'd417bf58-9d05-4347-aafa-5272727a1774', 34, 14, 86);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('bddd7d4f-b511-4763-8c88-8cb8c0ea6fe0', 'd417bf58-9d05-4347-aafa-5272727a1774', 33, 14, 87);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('285d24e6-4432-464f-bb1f-5c63e3282160', 'd417bf58-9d05-4347-aafa-5272727a1774', 33, 15, 88);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('3872aeba-fa0b-48cd-91c7-0ccb9a522848', 'd417bf58-9d05-4347-aafa-5272727a1774', 32, 15, 89);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('b14b9981-8362-4bc1-8b69-0d6e04486e13', 'd417bf58-9d05-4347-aafa-5272727a1774', 33, 15, 90);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('393de37a-943d-4203-bf5b-1a37b4044f1b', 'd417bf58-9d05-4347-aafa-5272727a1774', 33, 16, 91);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('1eefad2d-04db-4984-8a07-04706ad1a075', '7296a76f-e74d-4b44-ae92-a8741ec9b094', 33, 2, 69);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('914a6b6b-1f6d-4d8c-8810-5e030cb917c2', '7296a76f-e74d-4b44-ae92-a8741ec9b094', 34, 2, 70);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('137d8e30-9a81-44b0-a571-419a4abfef16', '7296a76f-e74d-4b44-ae92-a8741ec9b094', 34, 3, 71);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('f587457b-d754-4af4-8b1c-b37a90157986', '7296a76f-e74d-4b44-ae92-a8741ec9b094', 35, 3, 72);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('c130a446-7691-4e8d-b4f5-98b0d8432a6c', '7296a76f-e74d-4b44-ae92-a8741ec9b094', 36, 3, 73);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('a9037839-0392-4b16-8e71-027df94d41e7', '7296a76f-e74d-4b44-ae92-a8741ec9b094', 36, 4, 74);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('8525c910-62b9-4404-80bc-e9259e9e4a28', '7296a76f-e74d-4b44-ae92-a8741ec9b094', 35, 4, 75);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('91f0044f-f7e3-4aa5-9589-35cbdce9553b', '7296a76f-e74d-4b44-ae92-a8741ec9b094', 35, 5, 76);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('b034f6e7-9f94-4a5c-b43a-205b24ef04c4', '7296a76f-e74d-4b44-ae92-a8741ec9b094', 35, 6, 77);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('f424122e-f5bf-4049-824c-a5135dcf9e0e', '7296a76f-e74d-4b44-ae92-a8741ec9b094', 35, 7, 78);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('9001d6a9-33f8-4942-a4bc-920bd2c82762', '7296a76f-e74d-4b44-ae92-a8741ec9b094', 35, 8, 79);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('9b8b4245-ce5b-4a8c-aea5-c098b4c47165', '7296a76f-e74d-4b44-ae92-a8741ec9b094', 35, 9, 80);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('514289f5-7bbe-4612-a05d-a5169ccf39b1', '7296a76f-e74d-4b44-ae92-a8741ec9b094', 35, 10, 81);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('611a54cd-2165-49de-9673-c8313d4ede0f', '7296a76f-e74d-4b44-ae92-a8741ec9b094', 35, 11, 82);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('f283d615-fe4d-4bb7-8c7d-6ff7bf69ff31', '7296a76f-e74d-4b44-ae92-a8741ec9b094', 35, 12, 83);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('124c07a3-1110-475f-84e2-8d8e2565c67a', '7296a76f-e74d-4b44-ae92-a8741ec9b094', 34, 12, 84);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('97e319f1-d98e-4f09-993c-fc18310f8e34', '7296a76f-e74d-4b44-ae92-a8741ec9b094', 34, 13, 85);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('f7d65ca4-744f-4b95-8bcc-6f743e4f6fef', '7296a76f-e74d-4b44-ae92-a8741ec9b094', 34, 14, 86);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('cab06bc7-28ca-4749-bd86-d9d4864597f0', '7296a76f-e74d-4b44-ae92-a8741ec9b094', 33, 14, 87);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('0b6be067-2a88-401c-b183-dba55ec9ef64', '7296a76f-e74d-4b44-ae92-a8741ec9b094', 33, 15, 88);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('efc02ce3-e0b7-4f39-a095-2a166d6eca75', '9d959583-f416-4f64-b271-dc823d685267', 33, 2, 69);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('1282f018-8fef-4337-bb16-ac2a3ebccdba', '9d959583-f416-4f64-b271-dc823d685267', 34, 2, 70);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('845b9ac8-4e52-4d11-b1c3-3678329206db', '9d959583-f416-4f64-b271-dc823d685267', 34, 3, 71);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('6d6cf2e0-0dc5-4195-a6ba-dc9b586cde8b', '9d959583-f416-4f64-b271-dc823d685267', 35, 3, 72);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('15f06906-3d9b-43f4-8455-c5a62c5dae1d', '9d959583-f416-4f64-b271-dc823d685267', 36, 3, 73);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('996b3b41-8cea-449a-a029-f5f587a97cc8', '9d959583-f416-4f64-b271-dc823d685267', 36, 4, 74);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('a1366192-bbb3-49e4-974e-8a3c79b969f8', '9d959583-f416-4f64-b271-dc823d685267', 35, 4, 75);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('dc78a067-07c7-460a-90d6-e52b982701c1', '9d959583-f416-4f64-b271-dc823d685267', 35, 5, 76);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('0c85c675-72fa-4a7c-b3b4-064c5eb45765', '9d959583-f416-4f64-b271-dc823d685267', 35, 6, 77);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('d5ad5d21-4bcd-42e7-91cf-112a38bcc94b', '9d959583-f416-4f64-b271-dc823d685267', 35, 7, 78);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('3afdabdc-b0b3-4b61-a87d-147f83228958', '9d959583-f416-4f64-b271-dc823d685267', 35, 8, 79);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('ccc29607-ad1d-412c-81ef-79111ad0f381', '9d959583-f416-4f64-b271-dc823d685267', 35, 9, 80);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('17555b4c-7d30-41d5-b8b1-fd4f419f6548', '9d959583-f416-4f64-b271-dc823d685267', 35, 10, 81);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('8bc72e8a-4185-4b76-9a64-86fcd5b79519', '9d959583-f416-4f64-b271-dc823d685267', 35, 11, 82);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('0205d816-9d95-4c29-b0c9-ee2d391f6afa', '9d959583-f416-4f64-b271-dc823d685267', 35, 12, 83);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('eb714c7f-b30d-4a15-862e-9cc5d9b5dca9', '9d959583-f416-4f64-b271-dc823d685267', 34, 12, 84);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('e6597193-80ea-43f8-b042-c10102516ede', '9d959583-f416-4f64-b271-dc823d685267', 34, 13, 85);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('626b46f5-f226-47ad-8902-34d7fcc84809', '9d959583-f416-4f64-b271-dc823d685267', 34, 14, 86);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('765ef9f8-1b63-4440-8840-8c6fa020a0ef', '9d959583-f416-4f64-b271-dc823d685267', 33, 14, 87);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('0dcc706e-e3ef-4e31-b253-3270391fedea', '9d959583-f416-4f64-b271-dc823d685267', 33, 15, 88);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('e8ae59da-9f01-4d96-8a20-c18aaff49f4b', '9d959583-f416-4f64-b271-dc823d685267', 32, 15, 89);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('7cc3bcb6-605f-40e5-8361-e2aa40f47371', '9d959583-f416-4f64-b271-dc823d685267', 32, 16, 90);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('58d3a6ea-756d-42a2-b43d-63cbea9e1369', 'cfedc51f-46d7-4873-b443-a4fd75320d97', 33, 2, 69);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('c683fe9b-f901-46b3-b925-fce884d03c10', 'cfedc51f-46d7-4873-b443-a4fd75320d97', 34, 2, 70);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('41cd06ab-d00f-42b5-9ad9-e833c7616462', 'cfedc51f-46d7-4873-b443-a4fd75320d97', 34, 3, 71);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('08c74177-bb50-4eb0-8961-52ddb125da42', 'cfedc51f-46d7-4873-b443-a4fd75320d97', 35, 3, 72);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('7a0935e1-a33b-44b6-a8f7-45d0d027a691', 'cfedc51f-46d7-4873-b443-a4fd75320d97', 36, 3, 73);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('0e423aae-d481-4394-9178-e7e3a25a4993', 'cfedc51f-46d7-4873-b443-a4fd75320d97', 36, 4, 74);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('5c6520db-0706-4293-aa3d-60f3e66e32e4', 'cfedc51f-46d7-4873-b443-a4fd75320d97', 35, 4, 75);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('516ab65e-e183-41f6-8794-646365cebf9f', 'cfedc51f-46d7-4873-b443-a4fd75320d97', 35, 5, 76);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('1bdd3373-f151-404c-a6e9-a56ba5616fee', 'cfedc51f-46d7-4873-b443-a4fd75320d97', 35, 6, 77);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('6191291d-e8e5-4d4a-882c-00cfcf291488', 'cfedc51f-46d7-4873-b443-a4fd75320d97', 35, 7, 78);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('0e799867-7d24-4db3-9696-ddcb0fabf8ec', 'cfedc51f-46d7-4873-b443-a4fd75320d97', 35, 8, 79);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('fce715bf-1d11-48c4-bf01-80aec86c4032', 'cfedc51f-46d7-4873-b443-a4fd75320d97', 35, 9, 80);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('eac63ac8-cde2-4a25-9bbe-cda6db1983de', 'cfedc51f-46d7-4873-b443-a4fd75320d97', 35, 10, 81);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('d11258a3-b2ac-45f3-b983-9a71e87a3895', 'cfedc51f-46d7-4873-b443-a4fd75320d97', 35, 11, 82);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('7de3b1a6-a61f-477b-95f5-474746cf68fd', 'cfedc51f-46d7-4873-b443-a4fd75320d97', 35, 12, 83);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('fdb8211a-31bd-424d-8b07-9a69d11c8108', 'cfedc51f-46d7-4873-b443-a4fd75320d97', 34, 12, 84);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('c951ca94-1045-451a-abed-500810789845', 'cfedc51f-46d7-4873-b443-a4fd75320d97', 34, 13, 85);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('60175fdf-1677-4f9b-b73c-5457e5051281', 'cfedc51f-46d7-4873-b443-a4fd75320d97', 34, 14, 86);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('b065ca21-2f87-4a2d-884e-f71bd8f90f20', 'cfedc51f-46d7-4873-b443-a4fd75320d97', 33, 14, 87);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('6871f2ef-2e35-4b39-9c23-609003c7c3bd', 'cfedc51f-46d7-4873-b443-a4fd75320d97', 33, 15, 88);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('ae57f4a1-644f-45c2-88ab-4336208efb8c', 'cfedc51f-46d7-4873-b443-a4fd75320d97', 33, 14, 89);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('26c09894-25c9-4a5d-b1a1-5ebabd9767e8', 'a5dd5279-a899-4ca8-94c0-debffbf3ea56', 33, 2, 69);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('392d2e03-9da0-4709-aaf2-f01f76c78190', 'a5dd5279-a899-4ca8-94c0-debffbf3ea56', 34, 2, 70);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('893408c1-1ac5-4077-bd4d-79049cde193c', 'a5dd5279-a899-4ca8-94c0-debffbf3ea56', 34, 3, 71);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('e26f1995-d10c-48b5-bd9c-bfdebc75d20e', 'a5dd5279-a899-4ca8-94c0-debffbf3ea56', 35, 3, 72);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('50691de8-0266-4a4d-9452-c8d8c5420536', 'a5dd5279-a899-4ca8-94c0-debffbf3ea56', 36, 3, 73);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('c6a657be-48d2-4d24-be76-9426a195f9cb', 'a5dd5279-a899-4ca8-94c0-debffbf3ea56', 36, 4, 74);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('9e767fe0-b331-4619-a06c-103d1b1b3d6b', 'a5dd5279-a899-4ca8-94c0-debffbf3ea56', 35, 4, 75);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('793fca2d-5d68-4440-8a4b-09817ae3c42c', 'a5dd5279-a899-4ca8-94c0-debffbf3ea56', 35, 5, 76);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('a5eb8acb-a58b-45b8-8e3a-83bb7f245546', 'a5dd5279-a899-4ca8-94c0-debffbf3ea56', 35, 6, 77);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('50121b5b-b812-4b26-b780-22d666a4aec8', 'a5dd5279-a899-4ca8-94c0-debffbf3ea56', 35, 7, 78);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('20f76773-903f-4214-8645-3376b7dd0dbc', 'a5dd5279-a899-4ca8-94c0-debffbf3ea56', 35, 8, 79);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('c513e231-b46d-42e6-9e08-7609f3d3538c', 'a5dd5279-a899-4ca8-94c0-debffbf3ea56', 35, 9, 80);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('7eb79509-36da-4f14-bc37-7cef5295184d', 'a5dd5279-a899-4ca8-94c0-debffbf3ea56', 35, 10, 81);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('198db281-ca9a-44ef-8501-ac8844fdc25e', 'a5dd5279-a899-4ca8-94c0-debffbf3ea56', 35, 11, 82);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('0ecbaf92-3edc-4da8-ac0d-482463e69121', 'a5dd5279-a899-4ca8-94c0-debffbf3ea56', 35, 12, 83);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('c985bdfd-7a37-4f83-b774-086355069836', 'a5dd5279-a899-4ca8-94c0-debffbf3ea56', 34, 12, 84);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('bd37e59e-0765-4ea4-ab9e-cef9e8f12979', 'a5dd5279-a899-4ca8-94c0-debffbf3ea56', 34, 13, 85);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('a5b364bd-d817-4329-9c9e-755072fee2ff', 'a5dd5279-a899-4ca8-94c0-debffbf3ea56', 34, 14, 86);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('26b0d6de-365b-4987-a900-0493445ef8b9', 'a5dd5279-a899-4ca8-94c0-debffbf3ea56', 33, 14, 87);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('9e16cd1c-4647-493c-994a-f9779ff335b0', 'a5dd5279-a899-4ca8-94c0-debffbf3ea56', 33, 15, 88);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('190951d1-21d2-43af-9859-86342155ad5c', 'a5dd5279-a899-4ca8-94c0-debffbf3ea56', 32, 15, 89);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('94ca398d-7b27-4d19-abca-24a790dec1c9', 'a5dd5279-a899-4ca8-94c0-debffbf3ea56', 32, 16, 90);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('0bed8f76-b4c4-4c31-ac33-7b414d3af190', 'd6499ae9-3168-4a84-9609-cd1ab200cd6f', 33, 2, 69);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('24ecd3d4-4158-40b8-b636-63019f4c61d9', 'd6499ae9-3168-4a84-9609-cd1ab200cd6f', 34, 2, 70);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('386f0cdd-dc22-404d-95e1-7d9f0b37228f', 'd6499ae9-3168-4a84-9609-cd1ab200cd6f', 34, 3, 71);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('cd97c7db-b3c0-468f-a25c-ba28f4a13b5b', 'd6499ae9-3168-4a84-9609-cd1ab200cd6f', 35, 3, 72);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('f4dfe666-5376-41a2-8c40-af1f528336b5', 'd6499ae9-3168-4a84-9609-cd1ab200cd6f', 36, 3, 73);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('7c94bdd8-1f8a-4a1d-a9cd-acbd26bfefe4', 'd6499ae9-3168-4a84-9609-cd1ab200cd6f', 36, 4, 74);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('7f1c4939-0025-413e-91c4-3c5da5dcff74', 'd6499ae9-3168-4a84-9609-cd1ab200cd6f', 35, 4, 75);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('7948dd4f-4f1c-4844-b322-0fb4a2733e7f', 'd6499ae9-3168-4a84-9609-cd1ab200cd6f', 35, 5, 76);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('4b7fa630-ce26-40bd-b873-64913c64fbed', 'd6499ae9-3168-4a84-9609-cd1ab200cd6f', 35, 6, 77);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('0245b662-b5a6-4f1f-ae1b-ffe86848eda4', 'd6499ae9-3168-4a84-9609-cd1ab200cd6f', 35, 7, 78);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('d2aaa50b-8c46-406d-a2c3-3b16d0d1ba66', 'd6499ae9-3168-4a84-9609-cd1ab200cd6f', 35, 8, 79);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('adfa6ba8-d18c-4682-a2d4-8664d58acfb4', 'd6499ae9-3168-4a84-9609-cd1ab200cd6f', 35, 9, 80);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('b3eebfa4-02c8-4baf-9a59-b8ea506f8ee7', 'd6499ae9-3168-4a84-9609-cd1ab200cd6f', 35, 10, 81);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('d96f932e-aa30-4bbc-a15e-4547e0ce720a', 'd6499ae9-3168-4a84-9609-cd1ab200cd6f', 35, 11, 82);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('36969a54-ef18-4e29-8df1-e746fc503ce4', 'd6499ae9-3168-4a84-9609-cd1ab200cd6f', 35, 12, 83);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('f57a481f-182d-42e5-b3e8-e8ee5dab8c87', 'd6499ae9-3168-4a84-9609-cd1ab200cd6f', 34, 12, 84);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('a6f01992-68c9-45bd-a771-389afda5b3b7', 'd6499ae9-3168-4a84-9609-cd1ab200cd6f', 34, 13, 85);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('de24596d-859d-4baa-9ea9-9098df356eca', 'd6499ae9-3168-4a84-9609-cd1ab200cd6f', 34, 14, 86);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('720ca292-199a-4668-839f-f6c65daf6b90', 'd6499ae9-3168-4a84-9609-cd1ab200cd6f', 33, 14, 87);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('8c884aa0-c7c6-47e3-a4fd-18a39c01dd2e', 'd6499ae9-3168-4a84-9609-cd1ab200cd6f', 33, 15, 88);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('2c8e441b-160a-4222-a904-3ce4ad798e96', 'd6499ae9-3168-4a84-9609-cd1ab200cd6f', 32, 15, 89);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('5798a86d-17bb-46f7-8024-ef09ee248636', 'd6499ae9-3168-4a84-9609-cd1ab200cd6f', 32, 14, 90);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('9d53cfa5-7022-4750-ab4a-afe5e6614c0f', '982d31d6-57d8-4d72-9e13-102bf1dab524', 33, 2, 69);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('a240133b-483b-470c-be5b-7f2d8c01b1e8', '982d31d6-57d8-4d72-9e13-102bf1dab524', 34, 2, 70);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('7b976c22-80f1-42f6-bb0a-0e227d83b9dd', '982d31d6-57d8-4d72-9e13-102bf1dab524', 34, 3, 71);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('807ca8a3-2d51-4741-8e69-396f51bef90d', '982d31d6-57d8-4d72-9e13-102bf1dab524', 35, 3, 72);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('2fe65f0d-bcb2-42d7-ab4b-95b207dfe0aa', '982d31d6-57d8-4d72-9e13-102bf1dab524', 36, 3, 73);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('6c7d7afc-9e72-4a8b-80bd-8c19dea2caa7', '982d31d6-57d8-4d72-9e13-102bf1dab524', 36, 4, 74);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('d6e7d837-f814-4a54-a138-9d0852cacee3', '982d31d6-57d8-4d72-9e13-102bf1dab524', 35, 4, 75);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('34cd5892-0a48-4f57-9952-e2f771e946e8', '982d31d6-57d8-4d72-9e13-102bf1dab524', 35, 5, 76);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('cb16e276-fdf2-4809-ab26-6fdf74d21a20', '982d31d6-57d8-4d72-9e13-102bf1dab524', 35, 6, 77);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('4709f35d-585b-400b-afb7-6b9f8f5b0db7', '982d31d6-57d8-4d72-9e13-102bf1dab524', 35, 7, 78);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('4972e040-b979-43a3-af0a-e2cbdfb1effa', '982d31d6-57d8-4d72-9e13-102bf1dab524', 35, 8, 79);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('0302f97c-ffa5-47b7-a741-dbae8783fc7f', '982d31d6-57d8-4d72-9e13-102bf1dab524', 35, 9, 80);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('5225b187-5b52-4597-8d60-23a92c8548db', '982d31d6-57d8-4d72-9e13-102bf1dab524', 35, 10, 81);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('70f021d6-1f5b-45bd-8e46-ffcfafee6fe0', '982d31d6-57d8-4d72-9e13-102bf1dab524', 35, 11, 82);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('ee6f9a7b-35e4-4f17-8c90-a502b93961c9', '982d31d6-57d8-4d72-9e13-102bf1dab524', 35, 12, 83);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('11dd2151-56c4-4227-a8eb-9fe4803b7624', '982d31d6-57d8-4d72-9e13-102bf1dab524', 34, 12, 84);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('ab417370-1049-4404-803d-7b71996ce4dd', '982d31d6-57d8-4d72-9e13-102bf1dab524', 34, 13, 85);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('ce8efe38-27c7-4163-816c-7bfccafd48e7', '982d31d6-57d8-4d72-9e13-102bf1dab524', 34, 14, 86);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('67018aba-5fff-4d78-8110-34865eff4f50', '982d31d6-57d8-4d72-9e13-102bf1dab524', 33, 14, 87);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('7d0e8c2d-7f38-4b80-b9c6-e4b39dafc200', '982d31d6-57d8-4d72-9e13-102bf1dab524', 33, 15, 88);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('54e46c3c-7365-4d9e-900d-2342c893a040', '982d31d6-57d8-4d72-9e13-102bf1dab524', 32, 15, 89);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('df3bc6fa-c4e9-4138-bdad-495a9a3b7ca1', '982d31d6-57d8-4d72-9e13-102bf1dab524', 33, 15, 90);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('5814edc2-f252-45b2-b5c0-dd21b8dad801', '982d31d6-57d8-4d72-9e13-102bf1dab524', 33, 16, 91);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('42b9e6b4-1cdd-4df7-acca-cb17549ee63d', 'fe139296-545d-481d-afcf-71c97ca9d7b4', 33, 2, 69);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('ceed1831-073a-4794-b686-c00f2fe18e6b', 'fe139296-545d-481d-afcf-71c97ca9d7b4', 34, 2, 70);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('39dc63a5-06f5-4059-acc9-0bb712d0dba6', 'fe139296-545d-481d-afcf-71c97ca9d7b4', 34, 3, 71);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('632a1497-1032-43f8-806e-baa207b237fe', 'fe139296-545d-481d-afcf-71c97ca9d7b4', 35, 3, 72);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('10f6c46d-ac26-41de-b18f-7da15cfe1a57', 'fe139296-545d-481d-afcf-71c97ca9d7b4', 36, 3, 73);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('2179f42f-dfe7-4505-b52a-c11da74b4644', 'fe139296-545d-481d-afcf-71c97ca9d7b4', 36, 4, 74);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('b0f48d6b-9fe6-4030-8905-39331343a416', 'fe139296-545d-481d-afcf-71c97ca9d7b4', 35, 4, 75);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('75b28b75-7608-4eac-a303-42e0a6c2df55', 'fe139296-545d-481d-afcf-71c97ca9d7b4', 35, 5, 76);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('13c0fd00-f6b7-4783-8da8-6c190fc42289', 'fe139296-545d-481d-afcf-71c97ca9d7b4', 35, 6, 77);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('e2a4b938-ec16-472d-b410-d26fc216160b', 'fe139296-545d-481d-afcf-71c97ca9d7b4', 35, 7, 78);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('8fb92e40-1837-40a1-baa4-befa74242ffd', 'fe139296-545d-481d-afcf-71c97ca9d7b4', 35, 8, 79);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('b4d78796-656a-4e98-a3d5-c278cf413597', 'fe139296-545d-481d-afcf-71c97ca9d7b4', 35, 9, 80);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('5500368c-2f92-4cad-b513-adcf5d4668ff', 'fe139296-545d-481d-afcf-71c97ca9d7b4', 35, 10, 81);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('bdb19196-d274-48be-9305-5b5121552e8a', 'fe139296-545d-481d-afcf-71c97ca9d7b4', 35, 11, 82);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('fd94b136-ed6d-4d3f-a4ce-8c0d63d7e471', 'fe139296-545d-481d-afcf-71c97ca9d7b4', 35, 12, 83);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('749c4176-c033-4a98-b4ee-61ee8ae3a5ee', 'fe139296-545d-481d-afcf-71c97ca9d7b4', 34, 12, 84);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('8abbe369-50fa-4428-b3bb-2c62a5c1ca0c', 'fe139296-545d-481d-afcf-71c97ca9d7b4', 34, 13, 85);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('9788f788-2f90-4338-b652-bd99ab5fda2b', 'fe139296-545d-481d-afcf-71c97ca9d7b4', 34, 14, 86);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('e185b2c9-b793-4e04-91f3-b3700b161063', 'fe139296-545d-481d-afcf-71c97ca9d7b4', 33, 14, 87);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('918f43b9-d917-4023-a537-63c28744ce8d', 'fe139296-545d-481d-afcf-71c97ca9d7b4', 33, 13, 88);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('f8a91dad-7217-4946-a409-e0259fb5423e', '3407a10d-89ce-46b2-924e-086bc61b5c04', 33, 2, 69);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('4f7752dd-34f1-4330-b274-6e725fbb635b', '3407a10d-89ce-46b2-924e-086bc61b5c04', 34, 2, 70);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('841d1576-e415-4262-9d92-9a6ba4cd2153', '3407a10d-89ce-46b2-924e-086bc61b5c04', 34, 3, 71);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('d43d88d8-7b12-4147-b0ce-c8d77c6b9f73', '3407a10d-89ce-46b2-924e-086bc61b5c04', 35, 3, 72);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('589f2051-4351-4ff6-b063-552fdf91be91', '3407a10d-89ce-46b2-924e-086bc61b5c04', 36, 3, 73);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('415631dd-c9b3-4387-8949-5a45d463cb43', '3407a10d-89ce-46b2-924e-086bc61b5c04', 36, 4, 74);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('5988c623-e3c9-4ae1-ba04-b8eaffc232c8', '3407a10d-89ce-46b2-924e-086bc61b5c04', 35, 4, 75);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('07c7628c-f94c-44cb-be22-bcf6e308ea13', '3407a10d-89ce-46b2-924e-086bc61b5c04', 35, 5, 76);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('cfb51528-864c-4046-99b3-305e46a9cc45', '3407a10d-89ce-46b2-924e-086bc61b5c04', 35, 6, 77);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('ba6148eb-c291-4842-8884-ae9840c16b9d', '3407a10d-89ce-46b2-924e-086bc61b5c04', 35, 7, 78);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('4c31f45c-877f-492f-b2af-4b304d67195b', '3407a10d-89ce-46b2-924e-086bc61b5c04', 35, 8, 79);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('b5c007f0-fa32-4daf-805c-7c94987bc880', '3407a10d-89ce-46b2-924e-086bc61b5c04', 35, 9, 80);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('a9ae208d-0421-459e-b421-b218a98454ad', '3407a10d-89ce-46b2-924e-086bc61b5c04', 35, 10, 81);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('b5eea4b6-130b-4ce5-bbe2-40bd29061841', '3407a10d-89ce-46b2-924e-086bc61b5c04', 35, 11, 82);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('c12c5ff8-e11d-4c50-ba8a-e4cbd02e6ef7', '3407a10d-89ce-46b2-924e-086bc61b5c04', 35, 12, 83);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('57a7e2ba-1b7f-4295-82ff-7bd72afe9375', '3407a10d-89ce-46b2-924e-086bc61b5c04', 34, 12, 84);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('5d6ab060-b8ee-418e-962e-3d59ee77c6ab', '3407a10d-89ce-46b2-924e-086bc61b5c04', 34, 13, 85);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('0a6d3c41-2a95-4845-a9e6-509cb7d7934b', '3407a10d-89ce-46b2-924e-086bc61b5c04', 34, 14, 86);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('741b5422-65d7-4329-9452-ee79b5e33ebb', '3407a10d-89ce-46b2-924e-086bc61b5c04', 33, 14, 87);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('98cce76a-abae-4388-8b31-d42b238b06d3', '3407a10d-89ce-46b2-924e-086bc61b5c04', 33, 15, 88);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('db9bab8c-00da-4826-9ede-5fc1f07cc636', '3407a10d-89ce-46b2-924e-086bc61b5c04', 32, 15, 89);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('22410782-f784-4e2d-af38-422fc992beab', '3407a10d-89ce-46b2-924e-086bc61b5c04', 32, 16, 90);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('1eea479c-ff60-4730-b933-b6aff02a817e', '3407a10d-89ce-46b2-924e-086bc61b5c04', 32, 17, 91);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('f75a8b94-284c-4bb3-8f2e-8603246b0cd8', '3407a10d-89ce-46b2-924e-086bc61b5c04', 32, 18, 92);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('9feaf0ba-8707-405f-b84e-276a28a165e4', '4c58807a-a233-4e84-942c-1cf1c518a6a7', 33, 2, 69);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('2525062b-2a94-4b80-b907-0e8dc8c526a1', '4c58807a-a233-4e84-942c-1cf1c518a6a7', 34, 2, 70);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('7793f839-0276-4f30-8894-291c7f8f974f', '4c58807a-a233-4e84-942c-1cf1c518a6a7', 34, 3, 71);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('a75b4139-57ce-4cca-b753-6bafd811a68c', '4c58807a-a233-4e84-942c-1cf1c518a6a7', 35, 3, 72);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('02bc2c3c-4e32-4c0f-ad77-f95f6710e3d7', '4c58807a-a233-4e84-942c-1cf1c518a6a7', 36, 3, 73);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('f19eee87-594b-4f07-b31e-2a346b6f977b', '4c58807a-a233-4e84-942c-1cf1c518a6a7', 36, 4, 74);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('d80795ac-608e-4006-9db1-c80c0804214a', '4c58807a-a233-4e84-942c-1cf1c518a6a7', 35, 4, 75);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('f4757f67-eff0-4d44-adab-594b63718dc3', '4c58807a-a233-4e84-942c-1cf1c518a6a7', 35, 5, 76);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('f8cfaa66-5049-450b-81f9-16df274065fd', '4c58807a-a233-4e84-942c-1cf1c518a6a7', 35, 6, 77);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('d232ffbb-d287-48ca-9711-3bfdf7313b93', '4c58807a-a233-4e84-942c-1cf1c518a6a7', 35, 7, 78);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('4f88e7a0-a343-49ea-9c0d-49050d5eebe2', '4c58807a-a233-4e84-942c-1cf1c518a6a7', 35, 8, 79);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('9b227603-c507-4b44-88c6-c7369694eb34', '4c58807a-a233-4e84-942c-1cf1c518a6a7', 35, 9, 80);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('dc029e2c-da6a-49b9-8148-8326bc9550d1', '4c58807a-a233-4e84-942c-1cf1c518a6a7', 35, 10, 81);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('dec99e5b-8aab-4479-a257-572a16bc0f22', '4c58807a-a233-4e84-942c-1cf1c518a6a7', 35, 11, 82);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('5b2c8259-f25d-47e4-ae85-6c6ab1b6f13b', '4c58807a-a233-4e84-942c-1cf1c518a6a7', 35, 12, 83);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('e18e0f23-ca72-4460-83b6-33ada8956c88', '4c58807a-a233-4e84-942c-1cf1c518a6a7', 34, 12, 84);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('a4350e92-8b94-46ae-b40e-88aba9520318', '4c58807a-a233-4e84-942c-1cf1c518a6a7', 34, 13, 85);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('7b6b7565-48ac-4d10-a0f4-4a81943584a8', '4c58807a-a233-4e84-942c-1cf1c518a6a7', 34, 14, 86);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('c82bd7b2-053b-4feb-8f43-c3d4faf5e047', '4c58807a-a233-4e84-942c-1cf1c518a6a7', 33, 14, 87);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('d7dac3af-93fe-4c72-ade3-da247045383b', '4c58807a-a233-4e84-942c-1cf1c518a6a7', 33, 15, 88);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('72ca2d05-29bd-415b-9dc1-6aeed01fe013', '4c58807a-a233-4e84-942c-1cf1c518a6a7', 32, 15, 89);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('3c4531a1-4230-483b-8ba8-f25f375f8e75', '4c58807a-a233-4e84-942c-1cf1c518a6a7', 32, 16, 90);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('75707fef-2aaa-4ac6-9d9e-6f58e89b6303', '4c58807a-a233-4e84-942c-1cf1c518a6a7', 32, 17, 91);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('dadcb21c-3450-4687-8434-d9a45cf9e2a8', '4c58807a-a233-4e84-942c-1cf1c518a6a7', 32, 18, 92);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('aafb9768-5037-4c0f-a716-3191704d8f83', 'dba771e9-5d36-4b49-be5c-fd47b3c33b83', 33, 2, 69);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('869f360b-ad27-4445-995d-b914f7f1f155', 'dba771e9-5d36-4b49-be5c-fd47b3c33b83', 34, 2, 70);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('906a958c-b848-45cb-871f-838cdcde5ab7', 'dba771e9-5d36-4b49-be5c-fd47b3c33b83', 34, 3, 71);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('cf5245b1-7b72-43f5-9346-017708c6e832', 'dba771e9-5d36-4b49-be5c-fd47b3c33b83', 35, 3, 72);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('2b1c52f7-0098-41c6-9f65-c539ab5d801d', 'dba771e9-5d36-4b49-be5c-fd47b3c33b83', 36, 3, 73);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('4f5166bf-5e3f-4c48-94a3-99a31d95b9c1', 'dba771e9-5d36-4b49-be5c-fd47b3c33b83', 36, 4, 74);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('7f3a69e4-6d70-4fac-a57d-6183d5d7d187', 'dba771e9-5d36-4b49-be5c-fd47b3c33b83', 35, 4, 75);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('1da7881f-c835-4c8f-8150-2ba7816de6f2', 'dba771e9-5d36-4b49-be5c-fd47b3c33b83', 35, 5, 76);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('92a54b59-00ef-4b25-a869-8b8bc9b80024', 'dba771e9-5d36-4b49-be5c-fd47b3c33b83', 35, 6, 77);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('535f4add-c1dc-4ccc-a516-363907daa102', 'dba771e9-5d36-4b49-be5c-fd47b3c33b83', 35, 7, 78);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('2cb22a76-fa35-4890-a502-8c6a6ce0d085', 'dba771e9-5d36-4b49-be5c-fd47b3c33b83', 35, 8, 79);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('e3bf4680-dece-4d6d-9d79-a9743738929e', 'dba771e9-5d36-4b49-be5c-fd47b3c33b83', 35, 9, 80);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('053c8c43-689a-4681-a8a1-de11e7403a88', 'dba771e9-5d36-4b49-be5c-fd47b3c33b83', 35, 10, 81);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('b5d6c8cd-26b5-4b40-b5a8-99b12527dbb7', 'dba771e9-5d36-4b49-be5c-fd47b3c33b83', 35, 11, 82);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('9fa9d8d2-4360-4436-91b7-434997017aa0', 'dba771e9-5d36-4b49-be5c-fd47b3c33b83', 35, 12, 83);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('593f1f0b-3afc-4c2d-b11f-4df86ed29155', 'dba771e9-5d36-4b49-be5c-fd47b3c33b83', 34, 12, 84);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('3ccc0072-66e3-463d-b3e3-5681a7a65acb', 'dba771e9-5d36-4b49-be5c-fd47b3c33b83', 34, 13, 85);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('6ee26729-839b-4dbe-9230-a9254df430e4', 'dba771e9-5d36-4b49-be5c-fd47b3c33b83', 34, 14, 86);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('c3c1610f-3dc8-4b44-89b2-4853db0c54b4', 'dba771e9-5d36-4b49-be5c-fd47b3c33b83', 33, 14, 87);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('478a30c2-7ae1-43c6-8aed-89f6bc602011', 'dba771e9-5d36-4b49-be5c-fd47b3c33b83', 33, 15, 88);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('29157686-ef00-4075-8400-fbc8d17d2de0', 'dba771e9-5d36-4b49-be5c-fd47b3c33b83', 32, 15, 89);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('7b5d34fc-bbef-4dab-a18a-d3e06db584cd', 'dba771e9-5d36-4b49-be5c-fd47b3c33b83', 33, 15, 90);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('1324c279-f243-446a-94c0-32966b03f0f4', '5fbcf39c-ab68-4bd9-9ff4-d9109a8279c9', 33, 2, 69);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('412eaa4e-961f-4ee6-ba91-c5f75e4e27e9', '5fbcf39c-ab68-4bd9-9ff4-d9109a8279c9', 34, 2, 70);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('3e7ac0d0-67be-46a0-a872-1b479104d943', '5fbcf39c-ab68-4bd9-9ff4-d9109a8279c9', 34, 3, 71);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('1c9c6f0d-6993-4664-90cd-203478efb403', '5fbcf39c-ab68-4bd9-9ff4-d9109a8279c9', 35, 3, 72);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('88920a45-a618-4162-998a-d25f50bef0c6', '5fbcf39c-ab68-4bd9-9ff4-d9109a8279c9', 36, 3, 73);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('42c5636e-d305-458d-adbd-12c33a3d19ef', '5fbcf39c-ab68-4bd9-9ff4-d9109a8279c9', 36, 4, 74);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('e4e1e59a-e925-4101-bb90-f1456b2d1d23', '5fbcf39c-ab68-4bd9-9ff4-d9109a8279c9', 35, 4, 75);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('4c53e5ef-b59d-4cfb-ac95-03f6a2b87298', '5fbcf39c-ab68-4bd9-9ff4-d9109a8279c9', 35, 5, 76);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('57a6e028-eb78-4198-9ef1-3b170a0ee80f', '5fbcf39c-ab68-4bd9-9ff4-d9109a8279c9', 35, 6, 77);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('9c8faf20-39dd-4ae5-8b90-391ff219e6b7', '5fbcf39c-ab68-4bd9-9ff4-d9109a8279c9', 35, 7, 78);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('e41255c0-1132-4a5d-8335-fa1630ae7e4d', '5fbcf39c-ab68-4bd9-9ff4-d9109a8279c9', 35, 8, 79);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('f633d027-6ff4-4780-a201-90096aa9ddbe', '5fbcf39c-ab68-4bd9-9ff4-d9109a8279c9', 35, 9, 80);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('2ba185cb-24be-4567-8026-e445669694a6', '5fbcf39c-ab68-4bd9-9ff4-d9109a8279c9', 35, 10, 81);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('30c9619e-1fae-4b1c-8cdb-f9830b04b587', '5fbcf39c-ab68-4bd9-9ff4-d9109a8279c9', 35, 11, 82);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('5d945618-c834-46de-b9e8-f107ef17cc21', '5fbcf39c-ab68-4bd9-9ff4-d9109a8279c9', 35, 12, 83);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('7add22fd-0773-4eab-81ff-e31f3719e961', '5fbcf39c-ab68-4bd9-9ff4-d9109a8279c9', 34, 12, 84);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('99318339-dec9-44f5-b38f-a64d10f2576f', '5fbcf39c-ab68-4bd9-9ff4-d9109a8279c9', 34, 13, 85);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('2699d206-feed-40c1-978b-585ef2f105f9', '5fbcf39c-ab68-4bd9-9ff4-d9109a8279c9', 34, 14, 86);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('d1c19ac6-b59f-47cc-91c7-396078ed31e9', '5fbcf39c-ab68-4bd9-9ff4-d9109a8279c9', 33, 14, 87);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('551d039a-26f7-4dd0-b7de-6fabb50a4a5c', '5fbcf39c-ab68-4bd9-9ff4-d9109a8279c9', 33, 15, 88);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('573b45c6-7577-4f26-ab40-8cede75aa347', '5fbcf39c-ab68-4bd9-9ff4-d9109a8279c9', 32, 15, 89);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('56c42013-3b14-4780-8781-ec4099748386', '5fbcf39c-ab68-4bd9-9ff4-d9109a8279c9', 32, 16, 90);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('cca1d413-067a-4675-a9b8-1d130d91de00', '5207cbfb-e7bb-4554-9f31-5387bfd72001', 33, 2, 69);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('a3a5ca66-a6a4-434e-8c38-8bb2d10aed94', '5207cbfb-e7bb-4554-9f31-5387bfd72001', 34, 2, 70);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('6dec5679-40a7-41f5-b6ce-13800365b349', '5207cbfb-e7bb-4554-9f31-5387bfd72001', 34, 3, 71);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('4a2aaf2b-27bc-42f6-b306-8915c6867d01', '5207cbfb-e7bb-4554-9f31-5387bfd72001', 35, 3, 72);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('04aac999-f2aa-4b25-93b2-1a061313e80e', '5207cbfb-e7bb-4554-9f31-5387bfd72001', 36, 3, 73);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('8ba99e5a-850d-480c-b963-27372dbd6941', '5207cbfb-e7bb-4554-9f31-5387bfd72001', 36, 4, 74);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('07784efa-b366-46d0-b63f-d1436ab35e26', '5207cbfb-e7bb-4554-9f31-5387bfd72001', 35, 4, 75);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('e83d8ad5-887a-4805-b4e0-a3280a434766', '5207cbfb-e7bb-4554-9f31-5387bfd72001', 35, 5, 76);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('7e2cd2ee-f27d-4166-905c-961670289eee', '5207cbfb-e7bb-4554-9f31-5387bfd72001', 35, 6, 77);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('6f4e4f8d-6c13-4e1b-baaf-bda168f71d05', '5207cbfb-e7bb-4554-9f31-5387bfd72001', 35, 7, 78);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('62356069-06bf-4246-a8c1-0e6f857f03ff', '5207cbfb-e7bb-4554-9f31-5387bfd72001', 35, 8, 79);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('08d09652-5bb1-44d4-81cf-d0fcc7e8e69e', '5207cbfb-e7bb-4554-9f31-5387bfd72001', 35, 9, 80);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('4146d06c-744b-4235-98ac-00c91f666bb6', '5207cbfb-e7bb-4554-9f31-5387bfd72001', 35, 10, 81);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('83e00d42-9a0d-4702-8007-bee71a762d69', '5207cbfb-e7bb-4554-9f31-5387bfd72001', 35, 11, 82);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('a854bd9f-677e-46bc-8b70-77884372e637', '5207cbfb-e7bb-4554-9f31-5387bfd72001', 35, 12, 83);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('1659b6aa-1c2c-47d6-a968-99fcfba8b619', '5207cbfb-e7bb-4554-9f31-5387bfd72001', 34, 12, 84);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('5a46eeb4-5f0d-4a3b-b18d-a155ab8129ec', '5207cbfb-e7bb-4554-9f31-5387bfd72001', 34, 13, 85);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('e9ac5055-5918-487f-9169-52633e320fa3', '5207cbfb-e7bb-4554-9f31-5387bfd72001', 34, 14, 86);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('f6ea9545-e7a5-4e56-bd25-2500d5f59c02', '5207cbfb-e7bb-4554-9f31-5387bfd72001', 33, 14, 87);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('3351b5fd-6cc3-4001-bb6d-902d85779c5e', '5207cbfb-e7bb-4554-9f31-5387bfd72001', 33, 15, 88);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('099efc67-482a-4dda-bc3b-e615444661cd', '5207cbfb-e7bb-4554-9f31-5387bfd72001', 32, 15, 89);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('f224a85e-ff70-4113-a14b-3c11b388441f', '5207cbfb-e7bb-4554-9f31-5387bfd72001', 32, 14, 90);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('9523b489-030b-43f9-90ac-6c14aac70948', 'b07a14bd-c21f-4e18-9daa-3ea4fbb9b19e', 33, 2, 69);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('a1e039c2-b2dd-4e8d-bb97-8134b86f6b0b', 'b07a14bd-c21f-4e18-9daa-3ea4fbb9b19e', 34, 2, 70);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('52834699-be47-4c9e-bead-1ee2b2246a58', 'b07a14bd-c21f-4e18-9daa-3ea4fbb9b19e', 34, 3, 71);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('fc9b5a64-c400-4f08-ad50-7a72fcfad6cd', 'b07a14bd-c21f-4e18-9daa-3ea4fbb9b19e', 35, 3, 72);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('f15795a9-9732-40bb-b9bc-19598a57106a', 'b07a14bd-c21f-4e18-9daa-3ea4fbb9b19e', 36, 3, 73);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('42579a6d-94b6-4973-a59d-6f34d116fdba', 'b07a14bd-c21f-4e18-9daa-3ea4fbb9b19e', 36, 4, 74);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('c22aad74-4e75-4e2b-82f1-d7a120da9246', 'b07a14bd-c21f-4e18-9daa-3ea4fbb9b19e', 35, 4, 75);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('82c4c8e7-9d62-43ec-86a0-85c39376e9b2', 'b07a14bd-c21f-4e18-9daa-3ea4fbb9b19e', 35, 5, 76);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('374c575c-f982-413a-810e-96db848d98a4', 'b07a14bd-c21f-4e18-9daa-3ea4fbb9b19e', 35, 6, 77);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('9fe8bb86-b7c7-408b-b386-447a79758ff7', 'b07a14bd-c21f-4e18-9daa-3ea4fbb9b19e', 35, 7, 78);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('4dc8848a-c755-49a1-b2a2-16869f1802af', 'b07a14bd-c21f-4e18-9daa-3ea4fbb9b19e', 35, 8, 79);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('6d0a9e03-2a2d-4198-923f-d80869fcb3b0', 'b07a14bd-c21f-4e18-9daa-3ea4fbb9b19e', 35, 9, 80);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('a38b7f2b-5c94-4bc1-8848-647baedfc834', 'b07a14bd-c21f-4e18-9daa-3ea4fbb9b19e', 35, 10, 81);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('01ceee7e-905c-4d12-827b-88ea00fba177', 'b07a14bd-c21f-4e18-9daa-3ea4fbb9b19e', 35, 11, 82);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('8fea548a-77fb-43cb-8790-a05dc5a3dfb9', 'b07a14bd-c21f-4e18-9daa-3ea4fbb9b19e', 35, 12, 83);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('42589ba3-1c8c-4763-9e00-2a3dec0bb5b6', 'b07a14bd-c21f-4e18-9daa-3ea4fbb9b19e', 34, 12, 84);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('f233e294-3767-4a39-9588-7413b8f0ac59', 'b07a14bd-c21f-4e18-9daa-3ea4fbb9b19e', 34, 13, 85);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('dc591922-cf9a-4b37-87c1-27e153680068', 'b07a14bd-c21f-4e18-9daa-3ea4fbb9b19e', 34, 14, 86);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('cfa95dbb-03fe-42eb-af92-b0465e721ae0', 'b07a14bd-c21f-4e18-9daa-3ea4fbb9b19e', 33, 14, 87);
INSERT INTO public.grid_point (id, grid_trip_id, lat, lng, "time") VALUES ('9a12adec-a1e5-4fda-9784-dbbe42534bc9', 'b07a14bd-c21f-4e18-9daa-3ea4fbb9b19e', 33, 15, 88);


--
-- TOC entry 2874 (class 0 OID 16466)
-- Dependencies: 205
-- Data for Name: grid_trip; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.grid_trip (grid_trip_id, account_id, trip_id, date, weekday) VALUES ('cb0325e8-cc35-4107-841a-f7fb0b778a05', '6JnJfhdq4CNfNxYdgPToDJn6xkL2', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', '2021-04-19', 1);
INSERT INTO public.grid_trip (grid_trip_id, account_id, trip_id, date, weekday) VALUES ('2742ba64-2230-4422-afb9-3d13f0ad7d64', '6JnJfhdq4CNfNxYdgPToDJn6xkL2', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', '2021-04-20', 2);
INSERT INTO public.grid_trip (grid_trip_id, account_id, trip_id, date, weekday) VALUES ('cadfd3b7-06cd-4f97-a77b-19f1cb574785', '6JnJfhdq4CNfNxYdgPToDJn6xkL2', '984b189b-2c0a-48bd-8acc-869de37e2276', '2021-04-21', 3);
INSERT INTO public.grid_trip (grid_trip_id, account_id, trip_id, date, weekday) VALUES ('9b57a0bd-7768-46fb-9cd3-26f810f5ee26', '6JnJfhdq4CNfNxYdgPToDJn6xkL2', '2ec43423-9186-4da5-b99e-39f2453bbdcc', '2021-04-22', 4);
INSERT INTO public.grid_trip (grid_trip_id, account_id, trip_id, date, weekday) VALUES ('190fb864-ed25-486b-998a-f4e86c11b51f', '6JnJfhdq4CNfNxYdgPToDJn6xkL2', '2fd7b4b5-3ad5-477c-9bad-67a731767705', '2021-04-23', 5);
INSERT INTO public.grid_trip (grid_trip_id, account_id, trip_id, date, weekday) VALUES ('dd1b01ba-ab37-4be1-87e4-cdeaf6d7e536', '6JnJfhdq4CNfNxYdgPToDJn6xkL2', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', '2021-04-24', 6);
INSERT INTO public.grid_trip (grid_trip_id, account_id, trip_id, date, weekday) VALUES ('29ec48c9-e845-4099-9cb1-cab2102f6291', '6JnJfhdq4CNfNxYdgPToDJn6xkL2', 'c08c986d-ec20-4399-99ee-2c18fd968a59', '2021-04-25', 7);
INSERT INTO public.grid_trip (grid_trip_id, account_id, trip_id, date, weekday) VALUES ('5e29295d-8d52-4135-aad9-625ee301944f', '6JnJfhdq4CNfNxYdgPToDJn6xkL2', '2429b60a-65da-48c6-97e5-1a824a7a4248', '2021-04-26', 1);
INSERT INTO public.grid_trip (grid_trip_id, account_id, trip_id, date, weekday) VALUES ('c011fd3e-3b05-4e23-8b41-dc4e8260b0ee', '6JnJfhdq4CNfNxYdgPToDJn6xkL2', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', '2021-04-27', 2);
INSERT INTO public.grid_trip (grid_trip_id, account_id, trip_id, date, weekday) VALUES ('41cd5d55-41f6-4379-870e-1102c5fcd414', '6JnJfhdq4CNfNxYdgPToDJn6xkL2', '04235284-eb78-432e-88eb-0a2076d0be7c', '2021-04-28', 3);
INSERT INTO public.grid_trip (grid_trip_id, account_id, trip_id, date, weekday) VALUES ('0f925217-5f08-4396-b9d3-141f50cc29e1', '6JnJfhdq4CNfNxYdgPToDJn6xkL2', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', '2021-04-29', 4);
INSERT INTO public.grid_trip (grid_trip_id, account_id, trip_id, date, weekday) VALUES ('714f8d1b-48b1-414f-a430-1e37e16b6005', '6JnJfhdq4CNfNxYdgPToDJn6xkL2', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', '2021-04-30', 5);
INSERT INTO public.grid_trip (grid_trip_id, account_id, trip_id, date, weekday) VALUES ('f4a89274-cd22-4404-b387-2b27ff02f527', '6JnJfhdq4CNfNxYdgPToDJn6xkL2', '6db3ea28-de72-4bb1-82b2-1f72559f4bc0', '2021-05-01', 6);
INSERT INTO public.grid_trip (grid_trip_id, account_id, trip_id, date, weekday) VALUES ('54bb2802-69f1-47f1-863c-3ac28e1a0e4b', '6JnJfhdq4CNfNxYdgPToDJn6xkL2', '0abaac6a-8581-4a43-9759-cab16e1a3813', '2021-05-02', 7);
INSERT INTO public.grid_trip (grid_trip_id, account_id, trip_id, date, weekday) VALUES ('d417bf58-9d05-4347-aafa-5272727a1774', 'jwsIcZEzaPUPYtQN8559y0QFYco2', '83bf9927-6695-4aab-84e8-162c26fdaf9e', '2021-05-21', 3);
INSERT INTO public.grid_trip (grid_trip_id, account_id, trip_id, date, weekday) VALUES ('7296a76f-e74d-4b44-ae92-a8741ec9b094', 'jwsIcZEzaPUPYtQN8559y0QFYco2', '0bac2659-deee-4c37-b989-0fb837349e95', '2021-04-19', 1);
INSERT INTO public.grid_trip (grid_trip_id, account_id, trip_id, date, weekday) VALUES ('9d959583-f416-4f64-b271-dc823d685267', 'jwsIcZEzaPUPYtQN8559y0QFYco2', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', '2021-04-20', 2);
INSERT INTO public.grid_trip (grid_trip_id, account_id, trip_id, date, weekday) VALUES ('cfedc51f-46d7-4873-b443-a4fd75320d97', 'jwsIcZEzaPUPYtQN8559y0QFYco2', '1d453c85-77a7-4531-ac37-1d13a6f9f334', '2021-04-22', 4);
INSERT INTO public.grid_trip (grid_trip_id, account_id, trip_id, date, weekday) VALUES ('a5dd5279-a899-4ca8-94c0-debffbf3ea56', 'jwsIcZEzaPUPYtQN8559y0QFYco2', '853087e2-6953-41a2-932c-3179a1e1fbff', '2021-04-23', 5);
INSERT INTO public.grid_trip (grid_trip_id, account_id, trip_id, date, weekday) VALUES ('d6499ae9-3168-4a84-9609-cd1ab200cd6f', 'jwsIcZEzaPUPYtQN8559y0QFYco2', '05cad89c-d422-441d-b86a-d08b2ba30102', '2021-04-24', 6);
INSERT INTO public.grid_trip (grid_trip_id, account_id, trip_id, date, weekday) VALUES ('982d31d6-57d8-4d72-9e13-102bf1dab524', 'jwsIcZEzaPUPYtQN8559y0QFYco2', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', '2021-04-25', 7);
INSERT INTO public.grid_trip (grid_trip_id, account_id, trip_id, date, weekday) VALUES ('fe139296-545d-481d-afcf-71c97ca9d7b4', 'jwsIcZEzaPUPYtQN8559y0QFYco2', 'e1f621a2-c361-42e3-a965-b60beb80cc73', '2021-04-26', 1);
INSERT INTO public.grid_trip (grid_trip_id, account_id, trip_id, date, weekday) VALUES ('3407a10d-89ce-46b2-924e-086bc61b5c04', 'jwsIcZEzaPUPYtQN8559y0QFYco2', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', '2021-04-27', 2);
INSERT INTO public.grid_trip (grid_trip_id, account_id, trip_id, date, weekday) VALUES ('4c58807a-a233-4e84-942c-1cf1c518a6a7', 'jwsIcZEzaPUPYtQN8559y0QFYco2', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', '2021-04-28', 3);
INSERT INTO public.grid_trip (grid_trip_id, account_id, trip_id, date, weekday) VALUES ('dba771e9-5d36-4b49-be5c-fd47b3c33b83', 'jwsIcZEzaPUPYtQN8559y0QFYco2', 'eee166e8-274a-403e-95ba-067d3f47cc18', '2021-04-29', 4);
INSERT INTO public.grid_trip (grid_trip_id, account_id, trip_id, date, weekday) VALUES ('5fbcf39c-ab68-4bd9-9ff4-d9109a8279c9', 'jwsIcZEzaPUPYtQN8559y0QFYco2', '3161a5f9-24d1-40da-a194-2d67895a67bc', '2021-04-30', 5);
INSERT INTO public.grid_trip (grid_trip_id, account_id, trip_id, date, weekday) VALUES ('5207cbfb-e7bb-4554-9f31-5387bfd72001', 'jwsIcZEzaPUPYtQN8559y0QFYco2', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', '2021-05-01', 6);
INSERT INTO public.grid_trip (grid_trip_id, account_id, trip_id, date, weekday) VALUES ('b07a14bd-c21f-4e18-9daa-3ea4fbb9b19e', 'jwsIcZEzaPUPYtQN8559y0QFYco2', 'ca419691-ad54-4151-9f15-ba086983200e', '2021-05-02', 7);


--
-- TOC entry 2880 (class 0 OID 16669)
-- Dependencies: 211
-- Data for Name: route; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.route (id, account_id, frequent_route_id, address_start, address_end, lat_start, lng_start, lat_end, lng_end, time_start, time_end, is_shared, type_shared, length_route, weekday) VALUES (2, 'jwsIcZEzaPUPYtQN8559y0QFYco2', 'dee75198-043c-4850-96a4-2aec09bf3ca0', 'Số 81 Đường Lê Đức Thọ, Mỹ Đình, Nam Từ Liêm, Hà Nội, Việt Nam', '44 Cầu Giấy, Quan Hoa, Cầu Giấy, Hà Nội, Việt Nam', 21.030278, 105.769167, 21.030403, 105.800951, '05:45', '07:01', 1, 'Participant', 3.6, 0);
INSERT INTO public.route (id, account_id, frequent_route_id, address_start, address_end, lat_start, lng_start, lat_end, lng_end, time_start, time_end, is_shared, type_shared, length_route, weekday) VALUES (1, '6JnJfhdq4CNfNxYdgPToDJn6xkL2', '3f802a4f-bcde-4f06-8850-76a355e87d98', 'Ki Ốt 22, Hồ Tùng Mậu, Mai Dịch, Cầu Giấy, Hà Nội, Việt Nam', '44 Cầu Giấy, Quan Hoa, Cầu Giấy, Hà Nội, Việt Nam', 21.038042, 105.772563, 21.030403, 105.800951, '06:06', '07:01', 2, 'Participant', 3.2, 0);


--
-- TOC entry 2878 (class 0 OID 16620)
-- Dependencies: 209
-- Data for Name: route_point; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2872 (class 0 OID 16442)
-- Dependencies: 203
-- Data for Name: trip; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.trip (trip_id, account_owner, date, weekday) VALUES ('83bf9927-6695-4aab-84e8-162c26fdaf9e', 'jwsIcZEzaPUPYtQN8559y0QFYco2', '2021-05-21', 3);
INSERT INTO public.trip (trip_id, account_owner, date, weekday) VALUES ('0bac2659-deee-4c37-b989-0fb837349e95', 'jwsIcZEzaPUPYtQN8559y0QFYco2', '2021-04-19', 1);
INSERT INTO public.trip (trip_id, account_owner, date, weekday) VALUES ('65b5f9c9-e29f-4e54-9878-7262eeaa1277', 'jwsIcZEzaPUPYtQN8559y0QFYco2', '2021-04-20', 2);
INSERT INTO public.trip (trip_id, account_owner, date, weekday) VALUES ('1d453c85-77a7-4531-ac37-1d13a6f9f334', 'jwsIcZEzaPUPYtQN8559y0QFYco2', '2021-04-22', 4);
INSERT INTO public.trip (trip_id, account_owner, date, weekday) VALUES ('853087e2-6953-41a2-932c-3179a1e1fbff', 'jwsIcZEzaPUPYtQN8559y0QFYco2', '2021-04-23', 5);
INSERT INTO public.trip (trip_id, account_owner, date, weekday) VALUES ('05cad89c-d422-441d-b86a-d08b2ba30102', 'jwsIcZEzaPUPYtQN8559y0QFYco2', '2021-04-24', 6);
INSERT INTO public.trip (trip_id, account_owner, date, weekday) VALUES ('fc261d8f-edec-4987-96c5-d80f61dcaeb4', 'jwsIcZEzaPUPYtQN8559y0QFYco2', '2021-04-25', 7);
INSERT INTO public.trip (trip_id, account_owner, date, weekday) VALUES ('e1f621a2-c361-42e3-a965-b60beb80cc73', 'jwsIcZEzaPUPYtQN8559y0QFYco2', '2021-04-26', 1);
INSERT INTO public.trip (trip_id, account_owner, date, weekday) VALUES ('24d5a46c-92c7-4603-a5dc-43cb83869cc4', 'jwsIcZEzaPUPYtQN8559y0QFYco2', '2021-04-27', 2);
INSERT INTO public.trip (trip_id, account_owner, date, weekday) VALUES ('bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 'jwsIcZEzaPUPYtQN8559y0QFYco2', '2021-04-28', 3);
INSERT INTO public.trip (trip_id, account_owner, date, weekday) VALUES ('eee166e8-274a-403e-95ba-067d3f47cc18', 'jwsIcZEzaPUPYtQN8559y0QFYco2', '2021-04-29', 4);
INSERT INTO public.trip (trip_id, account_owner, date, weekday) VALUES ('3161a5f9-24d1-40da-a194-2d67895a67bc', 'jwsIcZEzaPUPYtQN8559y0QFYco2', '2021-04-30', 5);
INSERT INTO public.trip (trip_id, account_owner, date, weekday) VALUES ('e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 'jwsIcZEzaPUPYtQN8559y0QFYco2', '2021-05-01', 6);
INSERT INTO public.trip (trip_id, account_owner, date, weekday) VALUES ('ca419691-ad54-4151-9f15-ba086983200e', 'jwsIcZEzaPUPYtQN8559y0QFYco2', '2021-05-02', 7);
INSERT INTO public.trip (trip_id, account_owner, date, weekday) VALUES ('aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', '6JnJfhdq4CNfNxYdgPToDJn6xkL2', '2021-04-19', 1);
INSERT INTO public.trip (trip_id, account_owner, date, weekday) VALUES ('9ca31c84-d9d1-42ea-9e3b-760992c8c891', '6JnJfhdq4CNfNxYdgPToDJn6xkL2', '2021-04-20', 2);
INSERT INTO public.trip (trip_id, account_owner, date, weekday) VALUES ('984b189b-2c0a-48bd-8acc-869de37e2276', '6JnJfhdq4CNfNxYdgPToDJn6xkL2', '2021-04-21', 3);
INSERT INTO public.trip (trip_id, account_owner, date, weekday) VALUES ('2ec43423-9186-4da5-b99e-39f2453bbdcc', '6JnJfhdq4CNfNxYdgPToDJn6xkL2', '2021-04-22', 4);
INSERT INTO public.trip (trip_id, account_owner, date, weekday) VALUES ('2fd7b4b5-3ad5-477c-9bad-67a731767705', '6JnJfhdq4CNfNxYdgPToDJn6xkL2', '2021-04-23', 5);
INSERT INTO public.trip (trip_id, account_owner, date, weekday) VALUES ('7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', '6JnJfhdq4CNfNxYdgPToDJn6xkL2', '2021-04-24', 6);
INSERT INTO public.trip (trip_id, account_owner, date, weekday) VALUES ('c08c986d-ec20-4399-99ee-2c18fd968a59', '6JnJfhdq4CNfNxYdgPToDJn6xkL2', '2021-04-25', 7);
INSERT INTO public.trip (trip_id, account_owner, date, weekday) VALUES ('2429b60a-65da-48c6-97e5-1a824a7a4248', '6JnJfhdq4CNfNxYdgPToDJn6xkL2', '2021-04-26', 1);
INSERT INTO public.trip (trip_id, account_owner, date, weekday) VALUES ('43e1bfc6-5bbe-4014-98e6-504ae79a2c53', '6JnJfhdq4CNfNxYdgPToDJn6xkL2', '2021-04-27', 2);
INSERT INTO public.trip (trip_id, account_owner, date, weekday) VALUES ('04235284-eb78-432e-88eb-0a2076d0be7c', '6JnJfhdq4CNfNxYdgPToDJn6xkL2', '2021-04-28', 3);
INSERT INTO public.trip (trip_id, account_owner, date, weekday) VALUES ('1b5455d0-840f-4beb-8e8d-bef1cd71aebd', '6JnJfhdq4CNfNxYdgPToDJn6xkL2', '2021-04-29', 4);
INSERT INTO public.trip (trip_id, account_owner, date, weekday) VALUES ('c7de238e-c5f4-4873-bf43-fa04c6439e86', '6JnJfhdq4CNfNxYdgPToDJn6xkL2', '2021-04-30', 5);
INSERT INTO public.trip (trip_id, account_owner, date, weekday) VALUES ('6db3ea28-de72-4bb1-82b2-1f72559f4bc0', '6JnJfhdq4CNfNxYdgPToDJn6xkL2', '2021-05-01', 6);
INSERT INTO public.trip (trip_id, account_owner, date, weekday) VALUES ('0abaac6a-8581-4a43-9759-cab16e1a3813', '6JnJfhdq4CNfNxYdgPToDJn6xkL2', '2021-05-02', 7);


--
-- TOC entry 2873 (class 0 OID 16458)
-- Dependencies: 204
-- Data for Name: waypoint; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('abbba383-f16a-48b2-a57c-b4c77076887a', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03804, 105.7725, '2021-04-19 06:06:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a000f97a-c424-4708-ab4b-661519cfcfca', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03806, 105.77254, '2021-04-19 06:11:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6146a20d-81db-4a51-a0ea-e66fe75308ee', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03774, 105.77381, '2021-04-19 06:11:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('575b5d36-0671-4917-8229-a8c5aa1698da', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03742, 105.77491, '2021-04-19 06:16:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1175e75f-8a19-4e0e-bbe4-721ca074c8c6', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03699, 105.77631, '2021-04-19 06:21:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a11e118f-f54d-483a-aca4-cb7d212c2525', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03676, 105.77707, '2021-04-19 06:21:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('76d4cdc5-07aa-4181-a859-a637b56e4f5b', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03666, 105.77743, '2021-04-19 06:21:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('dfe659fd-1677-45e2-a8d3-47f35ffde183', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03656, 105.77783, '2021-04-19 06:26:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8d3be7e7-0b96-4bc7-a29b-e6385c9fe2d7', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03651, 105.77832, '2021-04-19 06:26:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('03256f42-ea71-44a5-97bf-c38088df7cb0', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03649, 105.7792, '2021-04-19 06:26:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('74e1ea4c-517d-461d-ab70-637b1571fd58', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03648, 105.77956, '2021-04-19 06:26:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('01ee0794-40ba-4f19-8369-c5e0d1523caf', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03645, 105.78023, '2021-04-19 06:31:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e65125e4-68e8-46e7-a41f-ecf8d5c24b91', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03637, 105.78086, '2021-04-19 06:31:13');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('73571e04-2240-44c4-b5e1-97110ed2a2d3', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03651, 105.78124, '2021-04-19 06:31:14');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ad34e1d9-08f7-433e-8c5d-968c551812d8', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03659, 105.78161, '2021-04-19 06:31:15');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('61cbe5ab-8bf4-492f-9e76-92f7ed4435fd', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03659, 105.78179, '2021-04-19 06:31:16');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('54efc14d-9b35-4dfc-ad8e-c2fb4cb5a56d', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03656, 105.78247, '2021-04-19 06:31:17');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('75593210-e220-44cf-b1b8-60bfbce86cf9', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03651, 105.7848, '2021-04-19 06:36:18');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('15ca4d33-0fee-4c6d-90f2-ca4608e78c96', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03649, 105.78595, '2021-04-19 06:41:19');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a5ad6088-eb88-44fe-a91f-4d010746084f', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03641, 105.78712, '2021-04-19 06:41:20');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8ba848f1-4500-437d-a9e4-2adf1180b248', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03639, 105.78791, '2021-04-19 06:46:21');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('79e07f62-7d34-48d9-b48f-a0262c0eb1ab', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03635, 105.7892, '2021-04-19 06:46:22');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('eca6bd63-4c15-48d1-ac58-87170d6d0960', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03627, 105.78978, '2021-04-19 06:46:23');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f66a7646-34e7-4fef-ad19-01af3eaf0c2f', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03616, 105.79029, '2021-04-19 06:51:24');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1d4393e2-ff29-49ff-a9b0-6e2676d659ba', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03576, 105.79162, '2021-04-19 06:51:25');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('65375b66-ebaf-41d9-955d-8d46ff8c69fa', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03514, 105.79344, '2021-04-19 06:56:26');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4dc9e249-db25-4ed2-942a-b32789120193', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03499, 105.7938, '2021-04-19 07:01:27');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('31425c69-fd31-40dc-a5f0-8604cda8ab31', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03474, 105.79462, '2021-04-19 07:01:28');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('30322ee8-72a0-4bb5-b548-fbc01a963719', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.0343, 105.796, '2021-04-19 07:06:29');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('904fa6f3-e1b7-4fa9-8452-d76327281487', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.034, 105.79696, '2021-04-19 07:06:30');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2aa37f0a-7bf9-483c-9183-9be4ed4ed7dd', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03388, 105.79724, '2021-04-19 07:06:31');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2401d509-fe51-4d04-8afb-be29c18db71f', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03378, 105.79737, '2021-04-19 07:06:32');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c226785f-d1f8-4725-8117-0a977fb5ede6', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03339, 105.79777, '2021-04-19 07:11:33');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2aa4353b-6c6a-4ebb-8346-68abad59cc85', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03265, 105.79856, '2021-04-19 07:11:34');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5bd22146-e67a-4f24-a9c7-df9db2171103', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03182, 105.79944, '2021-04-19 07:16:35');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6c7c20fd-4469-435d-a61d-94a7f340cf84', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03108, 105.80021, '2021-04-19 07:21:36');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7367cd49-9f21-485d-be66-48a8c9a0c9ba', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03035, 105.80102, '2021-04-19 07:21:37');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('614b8bd4-1023-4a2f-b265-04166da416d8', 'aa26dda1-900d-4ac5-91a4-7ef3036fa8fc', 21.03028, 105.80111, '2021-04-19 07:21:38');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2ba0845e-d253-4af9-976e-96c514ed8eba', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03804, 105.7725, '2021-04-19 06:06:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b670e00a-92f8-4569-9eba-2630077cac55', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03806, 105.77254, '2021-04-19 06:11:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('527ae431-78fc-4a72-befc-c9ff37a20e85', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03774, 105.77381, '2021-04-19 06:11:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b352204a-6f74-49b7-99d0-f47aa39b434c', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03742, 105.77491, '2021-04-19 06:16:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('eec94cd3-cf5d-4ba9-8da5-2c2cfdeba1a4', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03699, 105.77631, '2021-04-19 06:21:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('82209943-5341-4d8e-8f11-fd0f5915d08a', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03676, 105.77707, '2021-04-19 06:21:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d4f2f235-9e10-464b-b6ec-904ee663d52c', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03666, 105.77743, '2021-04-19 06:21:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('dc706d73-83fd-4eac-8d92-b610b5dfc105', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03656, 105.77783, '2021-04-19 06:26:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c55736c5-b697-472e-be0e-0481cb89c9d6', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03651, 105.77832, '2021-04-19 06:26:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c5ea5a56-5d14-4694-8889-cf898d673d5d', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03649, 105.7792, '2021-04-19 06:26:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('10b8a8ce-b07c-4bd0-a2a8-aae6e795d071', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03648, 105.77956, '2021-04-19 06:26:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9a4a13a8-2240-42f7-a213-6ee57439ce58', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03645, 105.78023, '2021-04-19 06:31:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('406cd6e2-16e8-406c-9098-1dee05304765', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03637, 105.78086, '2021-04-19 06:31:13');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('30ef4ad3-1c7e-4969-9f9f-9fb74267815b', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03651, 105.78124, '2021-04-19 06:31:14');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c85467b0-6a5b-48fc-bfc2-5e6bf9ed4b5d', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03659, 105.78161, '2021-04-19 06:31:15');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d788e2d0-00f3-4f27-8790-5809f428e25e', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03659, 105.78179, '2021-04-19 06:31:16');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('fcfcbc8c-fd35-4b87-88de-7357d66dcb41', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03656, 105.78247, '2021-04-19 06:31:17');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('745fad00-4a48-431d-b7d3-3ed59b55bede', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03651, 105.7848, '2021-04-19 06:36:18');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3b277385-cf22-4f98-8aa3-e53e1e167337', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03649, 105.78595, '2021-04-19 06:41:19');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7df0b290-633b-4873-aacb-e93ed10a1320', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03641, 105.78712, '2021-04-19 06:41:20');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a306761e-af8b-423e-85c2-8e166a4805d7', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03639, 105.78791, '2021-04-19 06:46:21');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7d626ce8-a00f-4cb8-947f-15b24b685da7', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03635, 105.7892, '2021-04-19 06:46:22');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('58647cef-efdf-4276-b912-d2c32b78886a', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03627, 105.78978, '2021-04-19 06:46:23');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5f9ccc05-f510-4710-aa85-cc39d46df7b9', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03616, 105.79029, '2021-04-19 06:51:24');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d7243d32-d82a-451d-bcb2-0ba54cc48b3a', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03576, 105.79162, '2021-04-19 06:51:25');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('400499c9-2432-4a78-8abd-94d9e7f3ad3f', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03514, 105.79344, '2021-04-19 06:56:26');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('35c4b418-315f-4e6a-b88d-c1c9c97e30c7', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03499, 105.7938, '2021-04-19 07:01:27');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8db4e40e-e9f6-453f-a11b-5b37170cab1d', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03474, 105.79462, '2021-04-19 07:01:28');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f5498b18-57d2-48df-8fa7-b8e1f1cb7d29', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.0343, 105.796, '2021-04-19 07:06:29');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('70ec6c72-c20c-4328-b4b7-46f0aa3b5c20', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.034, 105.79696, '2021-04-19 07:06:30');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f376e6f6-7d1f-4cfc-808a-d3030936bf57', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03388, 105.79724, '2021-04-19 07:06:31');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1f6d68eb-4a67-4010-a219-2b19658f01ab', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03378, 105.79737, '2021-04-19 07:06:32');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('979c6cf6-4346-4c86-b18a-72d7745a88b2', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03339, 105.79777, '2021-04-19 07:11:33');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('07a575b1-4584-4160-85f6-b09a0eaf8d92', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03265, 105.79856, '2021-04-19 07:11:34');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b5659809-368f-43e1-8118-270ce300062f', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03182, 105.79944, '2021-04-19 07:16:35');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b0fafb6d-4fa3-424d-abea-29834e4c23d2', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03108, 105.80021, '2021-04-19 07:21:36');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('71035cba-aa78-48ef-8e55-f5b6dcdf6533', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03035, 105.80102, '2021-04-19 07:21:37');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('350b564f-a9a9-491c-bf3a-553450acf395', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03001, 105.80149, '2021-04-19 07:21:38');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('be2f1227-3c60-4ac8-809b-8204c47beffb', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.02998, 105.80149, '2021-04-19 07:26:39');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0ba2e753-eb8f-4c7b-a7a1-2186dc162d9c', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.02987, 105.80151, '2021-04-19 07:26:40');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ad65e38a-eacc-492d-a7ff-272f1404c961', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.02972, 105.80165, '2021-04-19 07:26:41');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('87165281-a51c-440c-a19b-90a33565e0fc', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.02966, 105.80177, '2021-04-19 07:26:42');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('095e3d8d-0d85-4b9c-901b-baee51e3d13a', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.02964, 105.80189, '2021-04-19 07:26:43');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0331931e-500e-4c16-b867-e9e0f4bcffdf', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.02969, 105.80202, '2021-04-19 07:26:44');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f6cb5689-beb8-4ec4-9d3a-775cedcdb00a', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.02978, 105.8021, '2021-04-19 07:26:45');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('27c45930-0f82-4fad-8ce1-1b9769163b1e', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.02991, 105.80216, '2021-04-19 07:26:46');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('562f3fbd-949a-4902-90fa-8ddd496dcdc6', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.02999, 105.80217, '2021-04-19 07:26:47');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0e6e2e09-0a5c-4dd4-8f8f-02f58424f9f5', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03004, 105.80215, '2021-04-19 07:31:48');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c25d33ab-aa92-457d-b380-3f4145b88fa3', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03033, 105.80229, '2021-04-19 07:31:49');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5484ad3b-b609-4b50-b4fa-3093b92ae713', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03077, 105.80264, '2021-04-19 07:36:50');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a2aa4bc9-46d0-4422-8f39-7f05a4a22c9d', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03105, 105.80303, '2021-04-19 07:36:51');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('abe330b7-6582-4442-8897-e5f333ded35f', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03177, 105.80355, '2021-04-19 07:36:52');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e30cca9a-c921-4ad0-86f1-ab7e9b5ea493', '9ca31c84-d9d1-42ea-9e3b-760992c8c891', 21.03224, 105.80386, '2021-04-19 07:36:53');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('88028628-7ebc-4135-bd01-5421d9906e53', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03804, 105.7725, '2021-04-19 06:06:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0dacca64-aeb4-4e6b-a045-39841af7d258', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03806, 105.77254, '2021-04-19 06:11:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4e10f680-18e7-4f95-8179-f685a90ad081', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03774, 105.77381, '2021-04-19 06:11:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('fd6641aa-b4ed-4499-9f08-f06531ea501b', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03742, 105.77491, '2021-04-19 06:16:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7617bba0-06e5-4e92-b1b3-d1d67b05c0fb', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03699, 105.77631, '2021-04-19 06:21:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ef9875cf-6602-4d6f-b622-9376b7638483', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03676, 105.77707, '2021-04-19 06:21:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('66008f68-61a3-4553-a62f-6535a900ef6d', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03666, 105.77743, '2021-04-19 06:21:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('80f23062-5fdb-4b4d-abd6-f88af68c8a2a', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03656, 105.77783, '2021-04-19 06:26:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6950a9a9-198a-4a28-be03-f92a36808b99', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03651, 105.77832, '2021-04-19 06:26:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c61519f5-5a21-421f-9507-ce0876400829', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03649, 105.7792, '2021-04-19 06:26:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f32ce0a5-7bd8-443c-9239-0f2f9e67863d', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03648, 105.77956, '2021-04-19 06:26:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('13b26f88-f0cd-44b7-9616-9ee90faf0b4e', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03645, 105.78023, '2021-04-19 06:31:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d5345bb5-74bc-4f70-b77b-a399c61b73ae', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03637, 105.78086, '2021-04-19 06:31:13');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ab8da4e7-73f4-4239-8ff8-250bc64e337e', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03651, 105.78124, '2021-04-19 06:31:14');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d4d6f304-8e94-43b6-8e98-8a62c0addd71', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03659, 105.78161, '2021-04-19 06:31:15');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a6fa0166-c791-4a0b-b2cb-020ea942f5b1', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03659, 105.78179, '2021-04-19 06:31:16');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1e911c87-4cf9-4cee-ad52-9a6d1210e691', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03656, 105.78247, '2021-04-19 06:31:17');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6ac35550-a083-4e94-a859-bbe9067dd705', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03651, 105.7848, '2021-04-19 06:36:18');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6c36b3b3-7766-48b0-89e3-1a14d654a50f', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03649, 105.78595, '2021-04-19 06:41:19');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c91c2d2b-b939-4b2c-bf79-a1f67f63cd4f', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03641, 105.78712, '2021-04-19 06:41:20');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a516a74c-a55c-40a7-ba9c-9b0fdde69ebe', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03639, 105.78791, '2021-04-19 06:46:21');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('46960682-e609-4432-835e-030cea9ec039', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03635, 105.7892, '2021-04-19 06:46:22');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9ada9825-2b56-4ebc-b7b1-d527709e9deb', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03627, 105.78978, '2021-04-19 06:46:23');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1391904e-d85d-4e04-ae73-e6b4bb3a56db', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03616, 105.79029, '2021-04-19 06:51:24');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0b59ea5b-c611-441b-8e82-126f7c4554ae', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03576, 105.79162, '2021-04-19 06:51:25');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5f91b5e7-8ec3-420e-913f-15f2c55aa341', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03514, 105.79344, '2021-04-19 06:56:26');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f19cb396-65a6-4727-b683-eca260432c7d', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03499, 105.7938, '2021-04-19 07:01:27');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f9ca6220-03c3-4257-87e8-7216f861d368', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03474, 105.79462, '2021-04-19 07:01:28');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5d496c5c-1266-47bd-9aa6-d0822e2da079', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.0343, 105.796, '2021-04-19 07:06:29');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('195535a7-57fb-4236-877d-b9c6e7215783', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.034, 105.79696, '2021-04-19 07:06:30');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ebd6fdd5-aae4-43b8-bc5d-328914227975', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03388, 105.79724, '2021-04-19 07:06:31');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('07cc758b-3884-4bca-9837-bc8fd4c9a5b4', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03378, 105.79737, '2021-04-19 07:06:32');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9305d42b-3132-4b39-aacc-dce961d938be', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03339, 105.79777, '2021-04-19 07:11:33');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e76b6987-1dd0-45d9-9311-4bbe093b011c', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03265, 105.79856, '2021-04-19 07:11:34');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e9e1fb20-56e2-4117-9fb5-6058bb13bf64', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03182, 105.79944, '2021-04-19 07:16:35');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b38a63ad-cfde-4243-b078-f7e5e31bfdc6', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03108, 105.80021, '2021-04-19 07:21:36');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9c8a9412-e492-4023-a55b-886cbe74bd97', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03035, 105.80102, '2021-04-19 07:21:37');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('13ff2054-200d-4953-a20c-0347f30ddd36', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.03001, 105.80149, '2021-04-19 07:21:38');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f28dd647-7a85-4ef2-9571-c9ef8967e742', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.02998, 105.80149, '2021-04-19 07:26:39');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5a352e40-ed0d-471b-818e-09c139080e1b', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.02987, 105.80151, '2021-04-19 07:26:40');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('abe40a36-6c15-4e07-9d7e-07356f6f56b1', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.02972, 105.80165, '2021-04-19 07:26:41');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1ab7396a-ad1d-4446-9ac4-4643a635ea80', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.02966, 105.80177, '2021-04-19 07:26:42');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('112d0c5b-768b-4202-9785-eb96b48749bd', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.02964, 105.80189, '2021-04-19 07:26:43');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('28ff84e3-8d9e-41ac-8afe-553aaede3c20', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.02935, 105.80236, '2021-04-19 07:26:44');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('328d5b7b-9324-4bff-9e19-9d2f529af36c', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.029, 105.80312, '2021-04-19 07:31:45');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5e7e1e23-c9f6-41de-98f2-a4f2300bac53', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.02822, 105.80471, '2021-04-19 07:31:46');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8c71b905-c6f3-4e96-8799-2697dcb23d39', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.02818, 105.80489, '2021-04-19 07:31:47');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('31f2f981-ee5d-4d3b-b065-a9786d593b51', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.02818, 105.80506, '2021-04-19 07:36:48');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bafc6389-b6fb-4577-9d84-540622ced470', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.02828, 105.80528, '2021-04-19 07:36:49');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('76e05ef1-bacb-4c27-a6ee-372cb79a2214', '984b189b-2c0a-48bd-8acc-869de37e2276', 21.02832, 105.8053, '2021-04-19 07:36:50');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('811148ab-dd7b-4dcf-8d85-f682425117af', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03804, 105.7725, '2021-04-19 06:06:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ddbf161e-ca98-41d6-96c7-84d84f38ba7c', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03806, 105.77254, '2021-04-19 06:11:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c2a2cb1c-39a5-445c-8cdc-c6a4298b2241', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03774, 105.77381, '2021-04-19 06:11:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a569484b-c680-451f-ace1-09ee40670110', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03742, 105.77491, '2021-04-19 06:16:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('baa0705d-eff3-4a8c-ab2c-3b03728ab231', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03699, 105.77631, '2021-04-19 06:21:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a5794322-bd27-496d-bbf2-9246e9b56864', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03676, 105.77707, '2021-04-19 06:21:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9220109e-af01-4932-aa8c-ec2b2406cf4e', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03666, 105.77743, '2021-04-19 06:21:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d74e117c-3253-48cc-a46f-222178b4f382', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03656, 105.77783, '2021-04-19 06:26:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8b186e30-6833-4183-8ac1-5ae5913ce868', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03651, 105.77832, '2021-04-19 06:26:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8ec9033a-9a9f-4f19-aac2-11acc17258af', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03649, 105.7792, '2021-04-19 06:26:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ea672498-e13a-4fad-ab0a-53fc6ccbb64d', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03648, 105.77956, '2021-04-19 06:26:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('906f35ca-40e5-4eaa-96fc-c7bd3aa39c5e', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03645, 105.78023, '2021-04-19 06:31:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b7901e1d-2802-4ec5-8b26-95d7ec40430d', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03637, 105.78086, '2021-04-19 06:31:13');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5c494c72-62d2-448e-8779-fdf88c024e1e', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03651, 105.78124, '2021-04-19 06:31:14');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c9939c24-92b5-4f6f-8c55-fd5149d4c004', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03659, 105.78161, '2021-04-19 06:31:15');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('fe729e53-c6d8-48e9-a6a8-b069459e1a67', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03659, 105.78179, '2021-04-19 06:31:16');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('336f6c59-0aa0-4fba-9868-1ee53a1dcb68', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03656, 105.78247, '2021-04-19 06:31:17');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a3bdd5cb-2b7a-4163-8fe0-6be82e404e88', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03651, 105.7848, '2021-04-19 06:36:18');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('141ff64e-67b8-4b1c-a0f4-1dbe2d22abfe', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03649, 105.78595, '2021-04-19 06:41:19');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('30e76768-5e9b-4391-9217-a4a7415e803f', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03641, 105.78712, '2021-04-19 06:41:20');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('663ba233-0025-4d95-9d29-845d4b4ed203', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03639, 105.78791, '2021-04-19 06:46:21');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('341270d1-6047-4649-a77a-962caf3cd39d', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03635, 105.7892, '2021-04-19 06:46:22');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1b8c7113-2414-4886-9bc5-67072fc2e2f2', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03627, 105.78978, '2021-04-19 06:46:23');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('657d9e65-d630-4254-bb6a-d60eedb59000', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03616, 105.79029, '2021-04-19 06:51:24');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8827a97a-ae3d-4dcf-8de3-c9d3e7e99c51', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03576, 105.79162, '2021-04-19 06:51:25');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9157c227-8343-485c-9768-ae09ee5ca6f9', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03514, 105.79344, '2021-04-19 06:56:26');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('625526c9-7f98-476f-9d00-bf6522e19a57', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03499, 105.7938, '2021-04-19 07:01:27');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0eb72226-ad42-491d-aefc-3eeb6bd4dde2', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03474, 105.79462, '2021-04-19 07:01:28');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6220f9cc-b458-47ea-bfaa-e899bb999087', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.0343, 105.796, '2021-04-19 07:06:29');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('25c2038b-165d-4dea-a6e5-c5ef0ec40531', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.034, 105.79696, '2021-04-19 07:06:30');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e525f17d-f983-4948-83ae-56f66c4f4698', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03388, 105.79724, '2021-04-19 07:06:31');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2c171aef-56de-43f2-8d58-e2de12cd3856', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03378, 105.79737, '2021-04-19 07:06:32');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bba718aa-4377-486c-bce2-22ee98437df1', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03339, 105.79777, '2021-04-19 07:11:33');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e4ca5cc6-5d5c-4206-b751-61649d589961', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03265, 105.79856, '2021-04-19 07:11:34');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4ad85e57-bade-4d9f-b0f7-6796c5515b32', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03182, 105.79944, '2021-04-19 07:16:35');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5790c155-bc1f-4d28-810f-ce950343cdca', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03108, 105.80021, '2021-04-19 07:21:36');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7bfa6d9d-0a4f-40fd-85ce-887bccc1da65', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03035, 105.80102, '2021-04-19 07:21:37');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c39f826d-1014-4e09-bb4e-e4fb90e40247', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.03001, 105.80149, '2021-04-19 07:21:38');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b04f7257-4f5d-4aa9-b1fd-019f2be2d86e', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.02998, 105.80149, '2021-04-19 07:26:39');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e2f4a288-ddc0-4c8e-b8df-60e0b9109a73', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.02919, 105.80079, '2021-04-19 07:26:40');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0aaba40e-8b0f-4c25-8ea5-55f950b1623a', '2ec43423-9186-4da5-b99e-39f2453bbdcc', 21.02832, 105.80002, '2021-04-19 07:26:41');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2f1ca6ed-6e82-4adc-810d-13a6ec87195a', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03804, 105.7725, '2021-04-19 06:06:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('20ea73b9-9578-44e4-af2a-792d94d3c4ec', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03806, 105.77254, '2021-04-19 06:11:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7dec599f-f05a-4c0e-8c3c-e10ac3c81dcd', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03774, 105.77381, '2021-04-19 06:11:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7a3860fa-0abe-4daf-8dd3-d82b20cda52c', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03742, 105.77491, '2021-04-19 06:16:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('82202f69-d114-40c2-8e07-ae3d8db98adc', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03699, 105.77631, '2021-04-19 06:21:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('90776c7b-3a60-4c58-9044-cf908e20521f', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03676, 105.77707, '2021-04-19 06:21:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b8b842ef-f90c-4b63-b5b3-b7c86a018add', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03666, 105.77743, '2021-04-19 06:21:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('95429711-10a0-4bfb-8467-39d9a173f99b', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03656, 105.77783, '2021-04-19 06:26:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9a6eb578-ac12-4002-b4b3-364d8e895a4f', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03651, 105.77832, '2021-04-19 06:26:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d66a1d40-77c4-43d8-887a-4864f0708915', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03649, 105.7792, '2021-04-19 06:26:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('21643a57-71b3-4d88-bf6b-a8eee8b1bfa6', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03648, 105.77956, '2021-04-19 06:26:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e6c08763-91ae-47a5-9535-4b084ef76dd7', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03645, 105.78023, '2021-04-19 06:31:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e1537bea-f3c7-4c38-b8b7-e0ada30c85d7', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03637, 105.78086, '2021-04-19 06:31:13');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c9c469bd-f519-417f-94a8-c2681a762a46', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03651, 105.78124, '2021-04-19 06:31:14');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0cf1b90f-1497-4adf-8d1d-f723bf2d1561', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03659, 105.78161, '2021-04-19 06:31:15');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2b22b377-10d1-4f88-825e-aea201bb2f5a', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03659, 105.78179, '2021-04-19 06:31:16');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c635ec1c-f89a-4405-a1d9-9cad675afb94', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03656, 105.78247, '2021-04-19 06:31:17');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bef8f39a-1541-4711-be3b-fcedfc70c79e', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03651, 105.7848, '2021-04-19 06:36:18');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('02030431-614e-4881-adea-94c799213baa', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03649, 105.78595, '2021-04-19 06:41:19');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1911ad20-da4c-40cb-8f62-57ac65f9dbf9', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03641, 105.78712, '2021-04-19 06:41:20');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bbe61df7-9e82-48f3-94d2-914f29217ccf', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03639, 105.78791, '2021-04-19 06:46:21');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('edd5d30d-4a93-432f-b4f3-45a5f9665bd0', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03635, 105.7892, '2021-04-19 06:46:22');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('91c7e870-2086-4ea1-bf3b-ab8da7f7ef14', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03627, 105.78978, '2021-04-19 06:46:23');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('38566ebf-be95-47b3-8953-df8edbea5a31', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03616, 105.79029, '2021-04-19 06:51:24');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('30d283fc-1c68-4f8c-8410-821bb6f879d5', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03576, 105.79162, '2021-04-19 06:51:25');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3f3ac6d0-d22d-459d-9fc8-28e83eb3afa3', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03514, 105.79344, '2021-04-19 06:56:26');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('fa70155c-883e-4169-b153-5fc02e698b5b', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03501, 105.79338, '2021-04-19 06:56:27');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bf457b67-a803-428a-8ff5-e18c6b1ca1ca', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03463, 105.79313, '2021-04-19 07:01:28');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ebaefecb-5c5b-43a2-be39-4413bb247130', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03408, 105.79272, '2021-04-19 07:01:29');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('418d4e08-a6ae-4c41-a105-d003ec246550', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03362, 105.79242, '2021-04-19 07:06:30');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('fb71b997-d2dd-4073-9398-57a85731b28b', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.0331, 105.792, '2021-04-19 07:06:31');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1530fff7-9fc3-456b-af17-8b594c1f9d69', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03291, 105.79189, '2021-04-19 07:06:32');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7ece1ef2-d5ed-473e-9fdd-e7ac8e42d8dc', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03277, 105.79175, '2021-04-19 07:06:33');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4841dc59-a821-4db6-b3af-55af006d08b8', '2fd7b4b5-3ad5-477c-9bad-67a731767705', 21.03274, 105.79171, '2021-04-19 07:06:34');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5ea9236a-31c4-408e-9c20-e12e42c42e73', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03804, 105.7725, '2021-04-19 06:06:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('63a8c93f-1ae4-4c8b-a407-e48f2186a0d8', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03806, 105.77254, '2021-04-19 06:11:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2abc37de-3a8c-4619-bd05-c9a018a53fd5', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03774, 105.77381, '2021-04-19 06:11:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4cfee474-c9c2-4e0f-848f-8f9eff3882af', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03742, 105.77491, '2021-04-19 06:16:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('17569318-911f-401d-8182-e4403950f81f', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03699, 105.77631, '2021-04-19 06:21:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2e4e3e06-a55a-4980-b95d-3a44ae8cfe51', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03676, 105.77707, '2021-04-19 06:21:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c8adc99f-4c49-44b7-bce1-70c4e352cd22', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03666, 105.77743, '2021-04-19 06:21:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('74cc871e-2ab3-4b84-bf74-31eee1c209b6', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03656, 105.77783, '2021-04-19 06:26:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0719dae9-538d-4955-a6de-cec3ca5751b7', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03651, 105.77832, '2021-04-19 06:26:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3b2499a3-eb56-4b91-ba65-f049dfab3ecf', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03649, 105.7792, '2021-04-19 06:26:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ce4781b1-3111-44be-88d3-54e018d1c9d6', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03648, 105.77956, '2021-04-19 06:26:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b1971463-1553-4705-8585-89aac0dbc057', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03645, 105.78023, '2021-04-19 06:31:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f03fcf98-10ea-40df-9d09-25b30cdaa7b1', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03637, 105.78086, '2021-04-19 06:31:13');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('eecba220-f27e-4f09-b758-39e429b00075', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03651, 105.78124, '2021-04-19 06:31:14');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('74f6d7a0-6f9a-406b-a686-d5596f2fa4f0', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03659, 105.78161, '2021-04-19 06:31:15');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c3578a0f-598f-4534-b87d-2e518976afff', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03659, 105.78179, '2021-04-19 06:31:16');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5aac78aa-92e8-4495-87f8-6cf11ff3e027', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03656, 105.78247, '2021-04-19 06:31:17');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('dbb5f8f7-9e45-4058-a997-6067d7f26068', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03651, 105.7848, '2021-04-19 06:36:18');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0eaa012a-04d2-454b-a338-7154755f33df', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03649, 105.78595, '2021-04-19 06:41:19');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('eea75a63-5484-4342-9957-a885d7a6ec32', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03641, 105.78712, '2021-04-19 06:41:20');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ca1c604a-09cd-4859-b5f8-ad7017b4ace7', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03639, 105.78791, '2021-04-19 06:46:21');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e192026e-19d2-432b-b69e-cd07e67d149d', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03635, 105.7892, '2021-04-19 06:46:22');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('81b85e88-8fc8-4248-a18e-400da97f7b8c', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03612, 105.78937, '2021-04-19 06:46:23');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('31cde13c-1bc2-4330-a6d1-3f65f7ad6946', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03602, 105.7894, '2021-04-19 06:46:24');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1a4b3d47-769f-407f-a95b-3984b7335274', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.036, 105.78942, '2021-04-19 06:46:25');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7f6d3753-952a-4e7e-9262-ff579e29331e', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03549, 105.78928, '2021-04-19 06:46:26');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('153eb55e-138a-48a4-a8e4-d1b91bbb2333', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03486, 105.78913, '2021-04-19 06:51:27');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('22a681b2-cffd-4ceb-8866-7625fc4d4a20', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03442, 105.78899, '2021-04-19 06:51:28');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('82b2a281-639a-4923-9422-658ff95f1b96', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03368, 105.78881, '2021-04-19 06:51:29');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d6c9db9f-586a-4d10-a6b4-db594814fa0a', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03327, 105.78869, '2021-04-19 06:51:30');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3e1e1d29-18b7-4895-9127-6f9e710510e2', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03182, 105.78835, '2021-04-19 06:56:31');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('75378b52-3c95-4270-b4ad-9796f6c0d0c6', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03031, 105.78798, '2021-04-19 06:56:32');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('26ea3770-a268-4dd7-a683-2d094ae03feb', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.03028, 105.78813, '2021-04-19 06:56:33');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e30dc17f-6d63-42fb-b506-eab6e2cbfcf9', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.02982, 105.79091, '2021-04-19 07:01:34');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('116d0a21-40bc-412b-9d3d-2d835db30fc7', '7d5fe6b1-d29b-4aeb-9ae9-9ba1834af145', 21.02978, 105.79111, '2021-04-19 07:01:35');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7101c874-a6d6-4223-a2a6-7133653cda5c', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03804, 105.7725, '2021-04-19 06:06:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6a4eb842-7886-4b47-a460-d18ea3ab0ffa', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03806, 105.77254, '2021-04-19 06:11:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c7f9ceb9-a2e0-4638-baf7-3df46d955573', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03774, 105.77381, '2021-04-19 06:11:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2e1afe63-20e8-492d-83b6-39ba95cd8ae2', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03742, 105.77491, '2021-04-19 06:16:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8391f346-8a8c-48b9-901f-a6c73834c3e6', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03699, 105.77631, '2021-04-19 06:21:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('20403468-e18e-4b0f-b307-30c1d5e02e6b', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03676, 105.77707, '2021-04-19 06:21:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('505afa99-ceca-4c89-ada0-886932f30015', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03666, 105.77743, '2021-04-19 06:21:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f3be4331-1d05-4d70-a34e-143dcbb89515', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03656, 105.77783, '2021-04-19 06:26:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('aec0a28e-6beb-45a9-9d74-ec96be3be1d0', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03651, 105.77832, '2021-04-19 06:26:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('741ac900-32a1-406d-b63d-8d3229cca7bb', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03649, 105.7792, '2021-04-19 06:26:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('20589062-1aca-4921-b75b-713ef2995a3c', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03648, 105.77956, '2021-04-19 06:26:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a4591cfe-a92e-49b3-b5c3-11d6d5520d7d', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03645, 105.78023, '2021-04-19 06:31:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5acdaf94-c3cc-4003-91aa-53928187ebf3', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03637, 105.78086, '2021-04-19 06:31:13');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('fa1b66b2-8a63-4da7-857b-21f8839c1cd2', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03651, 105.78124, '2021-04-19 06:31:14');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e514b2c2-3f86-4266-bdf6-59c9491f3f8d', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03659, 105.78161, '2021-04-19 06:31:15');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4d236e02-7839-432d-bec8-bfb4b8355ef2', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03659, 105.78179, '2021-04-19 06:31:16');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e870d2ac-f4f4-40d9-b2b7-a22e4021f53d', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03656, 105.78247, '2021-04-19 06:31:17');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('60965e68-45a3-449b-99f7-2a826c18a34e', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03651, 105.7848, '2021-04-19 06:36:18');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5c1be2cd-0326-4f78-9961-a3055873c98c', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03649, 105.78595, '2021-04-19 06:41:19');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9c5d24f2-2eeb-4714-a7c1-d1ffa83c4e71', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03641, 105.78712, '2021-04-19 06:41:20');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3c930e06-0e94-4b01-b97a-2d740eb72aa7', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03639, 105.78791, '2021-04-19 06:46:21');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2c8973fc-c7e1-424f-9132-aa5870adf2f3', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03635, 105.7892, '2021-04-19 06:46:22');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7192ba39-a100-40fc-8be9-0211f2cecc97', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03627, 105.78978, '2021-04-19 06:46:23');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('595a4170-8ecd-4288-a497-ab242cdea4e0', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03616, 105.79029, '2021-04-19 06:51:24');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0e059b95-4f2c-434f-b0cc-f0eecde5c831', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03576, 105.79162, '2021-04-19 06:51:25');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('df86a562-e7d5-429d-a16d-9a5a5e105d56', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03514, 105.79344, '2021-04-19 06:56:26');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b2fd9b4a-ce6b-4962-9f8f-4889c75b973b', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03499, 105.7938, '2021-04-19 07:01:27');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('53888f35-c3ee-46f3-adca-2e8608753d0e', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03474, 105.79462, '2021-04-19 07:01:28');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b55ca5e5-62bb-4627-8ca4-4bfba0dbfdad', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.0343, 105.796, '2021-04-19 07:06:29');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('14f7c6de-ba8b-406b-9872-54529e2f0c5c', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.034, 105.79696, '2021-04-19 07:06:30');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2f6b3eea-c5a1-4c91-be8a-a22ec5366006', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03388, 105.79724, '2021-04-19 07:06:31');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9f2ec87c-5142-40e9-9028-d9c359dc0f6f', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03378, 105.79737, '2021-04-19 07:06:32');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d12915ac-83a0-431f-bd0c-6242f292aa25', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03339, 105.79777, '2021-04-19 07:11:33');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8d33742b-ba18-4b2f-9d06-3cb06130496e', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03265, 105.79856, '2021-04-19 07:11:34');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('01d41716-bbe2-4e83-b85a-c391d1b6e7e5', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03182, 105.79944, '2021-04-19 07:16:35');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b3de5ce2-f26c-40d1-8357-aebc10640787', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03108, 105.80021, '2021-04-19 07:21:36');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('60d4f68f-5613-4dad-86fa-46e43cc6247d', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03035, 105.80102, '2021-04-19 07:21:37');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7fd7ad1d-464f-47fa-87ef-d3fc8c2f4021', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.03001, 105.80149, '2021-04-19 07:21:38');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e8a8b8d6-c513-4cd5-b6ee-aadcff886194', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.02998, 105.80149, '2021-04-19 07:26:39');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('fb1c2095-1792-4771-9deb-162016dcf86d', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.02987, 105.80151, '2021-04-19 07:26:40');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a48aaf5c-a6db-49d1-b198-99ad011a3a7f', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.02972, 105.80165, '2021-04-19 07:26:41');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b4c26ff8-3af5-434a-ab7c-9b2bd328f6b7', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.02966, 105.80177, '2021-04-19 07:26:42');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('43320ae0-78b7-4d0e-910b-19f7a7f06f36', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.02964, 105.80189, '2021-04-19 07:26:43');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0bf19ad6-53c4-4e72-88cf-c120c197fdc2', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.02935, 105.80236, '2021-04-19 07:26:44');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('26b0e918-2bc9-4cd1-a2a2-082851144076', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.029, 105.80312, '2021-04-19 07:31:45');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8a5632c6-d781-4505-85e4-d4e080086c02', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.02822, 105.80471, '2021-04-19 07:31:46');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0490ccf6-c5a4-4745-90c4-9e5aa14df383', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.02818, 105.80489, '2021-04-19 07:31:47');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('cbcccd7f-c59d-4a11-9aaa-a7660344b6ba', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.02818, 105.80506, '2021-04-19 07:36:48');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('386757a3-4134-48a9-84af-7446880af640', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.0284, 105.8055, '2021-04-19 07:36:49');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('720f9a74-e5c8-4152-a111-5c4d67a3f7fd', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.02843, 105.80577, '2021-04-19 07:36:50');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2323b0be-fd13-4cac-8919-2643afe024bc', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.02838, 105.80608, '2021-04-19 07:36:51');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('017582fb-bc89-483a-8bcf-935773f818da', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.02817, 105.807, '2021-04-19 07:36:52');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bbe769b9-132f-4a06-bef0-aa51335b8297', 'c08c986d-ec20-4399-99ee-2c18fd968a59', 21.02807, 105.8075, '2021-04-19 07:41:53');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c2166077-85d3-4e16-900b-1740847b6375', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03804, 105.7725, '2021-04-19 06:06:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9d15a072-1bf5-4b69-ae6e-611769133aca', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03806, 105.77254, '2021-04-19 06:11:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c7d84649-7988-4c26-876b-f7f93515fc83', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03774, 105.77381, '2021-04-19 06:11:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('034f4a1c-a285-41f6-90b3-75af4eb69b86', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03742, 105.77491, '2021-04-19 06:16:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('78cc827e-ad08-492b-8f56-82aba6ad5aa8', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03699, 105.77631, '2021-04-19 06:21:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('fdb249e5-3f99-4c78-8c12-eb08e901a760', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03676, 105.77707, '2021-04-19 06:21:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('89106c2b-24ea-489c-b757-91294476bac2', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03666, 105.77743, '2021-04-19 06:21:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('01aca520-7f77-420a-a77e-56b06febeac4', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03656, 105.77783, '2021-04-19 06:26:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2a13cd45-a0ee-44d5-8ba8-1b22660adcaf', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03651, 105.77832, '2021-04-19 06:26:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a9372282-4551-4193-8b3b-2a68c081a45a', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03649, 105.7792, '2021-04-19 06:26:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('235bde80-ac51-4d00-814f-8ea856d2499b', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03648, 105.77956, '2021-04-19 06:26:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('62138288-148f-4306-9011-6a1d9360f7ff', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03645, 105.78023, '2021-04-19 06:31:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('892d880a-3baa-4e91-ba20-8de1e323438b', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03637, 105.78086, '2021-04-19 06:31:13');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e9c50804-553b-4059-978c-81a2fc259cc9', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03651, 105.78124, '2021-04-19 06:31:14');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d038961f-0c09-40ef-9f4e-fcbdffa228cc', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03659, 105.78161, '2021-04-19 06:31:15');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ab7bfc0b-af2e-4630-a381-69fd740f4170', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03659, 105.78179, '2021-04-19 06:31:16');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b8985369-3258-47f5-9c5e-cd431d4db047', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03656, 105.78247, '2021-04-19 06:31:17');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('89711591-7b3a-4d1f-adc0-0b6c39ecfa22', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03651, 105.7848, '2021-04-19 06:36:18');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b771afc4-64ec-4695-b6d5-e319383e5b7d', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03649, 105.78595, '2021-04-19 06:41:19');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('33276101-d6fb-4a3d-93b9-c179be1cc1b1', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03641, 105.78712, '2021-04-19 06:41:20');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9e345c7a-c196-4c20-bb0e-635e37f94b1b', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03639, 105.78791, '2021-04-19 06:46:21');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5f0b8644-d5e4-45f9-b45a-830127e73af0', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03635, 105.7892, '2021-04-19 06:46:22');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('140808fd-2a5f-4cf0-bb20-f37e234ca8e6', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03627, 105.78978, '2021-04-19 06:46:23');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e0a2f9d9-a8bd-4446-be65-f96bbafd2e8e', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03616, 105.79029, '2021-04-19 06:51:24');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('81379c0d-a602-434e-a508-0199faaed0d6', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03576, 105.79162, '2021-04-19 06:51:25');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c7c31950-d936-4e8a-8071-769f2905c44e', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03514, 105.79344, '2021-04-19 06:56:26');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('21d42382-74d3-463a-835e-a6200e0aad39', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03499, 105.7938, '2021-04-19 07:01:27');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6b385a2d-7dbd-4991-a240-baabf14d813c', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03474, 105.79462, '2021-04-19 07:01:28');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('50a3c5e3-5cb0-4ba2-aae4-971acd3357f2', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.0343, 105.796, '2021-04-19 07:06:29');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('03ce8e7d-a5f8-4cc9-a0de-3aa1f0ec4006', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.034, 105.79696, '2021-04-19 07:06:30');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1b9ec6ca-5c12-47a9-b474-b887acec9cc4', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03388, 105.79724, '2021-04-19 07:06:31');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7147ea76-363e-436d-9f9d-b859d834f68f', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03378, 105.79737, '2021-04-19 07:06:32');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d511d856-ea95-40ea-a489-d83f570ca4b6', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03339, 105.79777, '2021-04-19 07:11:33');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3fbd846f-aa6c-411c-adfc-883e90550872', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03265, 105.79856, '2021-04-19 07:11:34');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c6ac9992-6648-4437-bda7-d434506e82e0', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03182, 105.79944, '2021-04-19 07:16:35');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7b3ca4b6-9e05-4942-a596-23489b747679', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03108, 105.80021, '2021-04-19 07:21:36');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c950a068-f1c8-4b7b-905a-01c7285210c5', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03035, 105.80102, '2021-04-19 07:21:37');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ac3492d0-c066-4c05-ab9a-389f71e84735', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.03001, 105.80149, '2021-04-19 07:21:38');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3e977588-0562-4e74-abff-b1c565743652', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.02998, 105.80149, '2021-04-19 07:26:39');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1b1631c3-8a35-4927-8b35-c8e784bfcaf6', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.02987, 105.80151, '2021-04-19 07:26:40');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1ccc512b-928c-4c08-9114-372577a6fff8', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.02972, 105.80165, '2021-04-19 07:26:41');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9fab2883-cb9d-4c19-a26b-4e258abca909', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.02966, 105.80177, '2021-04-19 07:26:42');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('49f5f92d-439a-4d0d-a36c-d7f05f9517fe', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.02964, 105.80189, '2021-04-19 07:26:43');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d483d6c4-21af-4bed-b0f0-3d9e38203638', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.02935, 105.80236, '2021-04-19 07:26:44');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3c2c4efc-98af-4694-ac3a-758da100b596', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.029, 105.80312, '2021-04-19 07:31:45');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0f6945b7-cfd4-491a-88c2-1d54a77512c4', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.02822, 105.80471, '2021-04-19 07:31:46');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('83ba35a3-7ff9-4892-9142-1b97e0982f5f', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.02818, 105.80489, '2021-04-19 07:31:47');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('446667af-946f-4289-a527-395d4c3fbfe3', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.02818, 105.80506, '2021-04-19 07:36:48');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c8f57618-854f-4fbb-9c60-666e47b77115', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.02828, 105.80528, '2021-04-19 07:36:49');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6af8733a-78a0-4f2e-bdf9-1d49b0d81f1e', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.02853, 105.80544, '2021-04-19 07:36:50');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bbc9a326-9ac5-4a07-802f-b2e957af98ae', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.02877, 105.80564, '2021-04-19 07:36:51');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e608f6f5-e60d-466a-8e15-a217633dc36f', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.02884, 105.80576, '2021-04-19 07:36:52');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6fdf071f-6325-4475-8314-246bfa148118', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.0291, 105.80647, '2021-04-19 07:36:53');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('404ad226-4667-4fff-819b-949e3ba9a4a6', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.02921, 105.80683, '2021-04-19 07:36:54');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e81f5b88-e7a5-4cf7-8dc1-ab0e78645212', '2429b60a-65da-48c6-97e5-1a824a7a4248', 21.02941, 105.80834, '2021-04-19 07:41:55');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('14db2f93-0ca3-4389-8a1a-90e0d7368e8d', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03804, 105.7725, '2021-04-19 06:06:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c98a58b5-f46f-4bf2-999d-6e4291cef777', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03806, 105.77254, '2021-04-19 06:11:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('829854b1-8836-4939-9c45-2ded2391a329', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03774, 105.77381, '2021-04-19 06:11:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('55c3b3ff-1ff7-4ce0-9f78-186fe58e1be2', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03742, 105.77491, '2021-04-19 06:16:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bfb60223-50ca-4be8-9188-e240c7273fef', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03699, 105.77631, '2021-04-19 06:21:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1b13e0b4-18d3-425a-bea2-06d59afa5e30', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03676, 105.77707, '2021-04-19 06:21:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c50a12dc-4e2d-4c95-accd-55f307701676', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03666, 105.77743, '2021-04-19 06:21:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('51651b27-3552-4cd3-ab02-78099a1b7828', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03656, 105.77783, '2021-04-19 06:26:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('279851c9-fd75-49eb-bd1c-dd48cc75b6bd', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03651, 105.77832, '2021-04-19 06:26:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2e86e92c-f9e0-4de0-8f4e-14f65667c42c', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03649, 105.7792, '2021-04-19 06:26:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a51f6ce7-89ee-4cae-ba9d-c60f555fe5f3', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03648, 105.77956, '2021-04-19 06:26:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('07d3f601-01ff-4a74-8953-b8ff6b68e28f', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03645, 105.78023, '2021-04-19 06:31:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('02faff90-5c24-46f6-8942-8f9a35a8c5fc', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03637, 105.78086, '2021-04-19 06:31:13');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('40fcb412-9d6d-44e9-895d-69f091b179ca', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03651, 105.78124, '2021-04-19 06:31:14');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d95b5818-0f85-4515-8746-9428cade1543', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03659, 105.78161, '2021-04-19 06:31:15');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9558184e-277d-4c64-aae0-92efcab769b7', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03659, 105.78179, '2021-04-19 06:31:16');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5eb49210-a939-4421-b446-16f7477d29c7', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03656, 105.78247, '2021-04-19 06:31:17');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1c2b09f8-304a-4421-8625-2293e4bf610e', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03651, 105.7848, '2021-04-19 06:36:18');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('078e513f-46e9-465c-96cb-dff77163548d', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03649, 105.78595, '2021-04-19 06:41:19');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e9739a30-4727-4a8d-967b-591c8003ba15', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03641, 105.78712, '2021-04-19 06:41:20');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('14b3530a-ae72-4a1a-b9fb-ec4506998436', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03639, 105.78791, '2021-04-19 06:46:21');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('311a4a99-033b-46ce-b33b-d83cc8f2099e', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03635, 105.7892, '2021-04-19 06:46:22');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e59d4ebb-e719-43e6-8106-5f82fb346ce9', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03627, 105.78978, '2021-04-19 06:46:23');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1d4997dd-6987-4163-866f-3814684bbf26', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03616, 105.79029, '2021-04-19 06:51:24');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6c3f6349-20e3-45ea-b9da-069986d603b3', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03576, 105.79162, '2021-04-19 06:51:25');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('18503b36-6f2a-42e0-b8fb-643430103ee7', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03514, 105.79344, '2021-04-19 06:56:26');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('012439c3-9a62-43bb-9bf3-a29100806659', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03499, 105.7938, '2021-04-19 07:01:27');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('35a59c8a-5e19-4d82-9716-8bfcd3bf32aa', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03474, 105.79462, '2021-04-19 07:01:28');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f1e423fe-e76b-4279-9c98-6e588c9acdde', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.0343, 105.796, '2021-04-19 07:06:29');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7d596455-e9d7-4596-b9f4-be28c7383522', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.034, 105.79696, '2021-04-19 07:06:30');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ce8d925a-85c1-4113-9996-d0d4060ee29a', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03388, 105.79724, '2021-04-19 07:06:31');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('afd47779-1f6d-4a30-b8d4-ba4fad0a4bda', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03378, 105.79737, '2021-04-19 07:06:32');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6dbcff29-a24f-43fd-9dbc-b16bcb32ff0f', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03339, 105.79777, '2021-04-19 07:11:33');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('65a04ce3-1da6-4c6f-9c08-004d880b7edb', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03265, 105.79856, '2021-04-19 07:11:34');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2811c740-a2ca-41e3-8a3c-1b7954a803cf', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03182, 105.79944, '2021-04-19 07:16:35');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('db401d3a-f3f2-403e-abb5-912b4402321c', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03108, 105.80021, '2021-04-19 07:21:36');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b1ac2eb9-bfce-410b-bded-b60729b856c8', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03035, 105.80102, '2021-04-19 07:21:37');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a1af3d10-5a2f-41fa-ae24-53395ca57579', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.03001, 105.80149, '2021-04-19 07:21:38');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9a8d25e3-c10b-4cca-a3b7-18c168626f65', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.02998, 105.80149, '2021-04-19 07:26:39');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e57ff8d3-5a12-47a7-9a36-8901e032253d', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.02987, 105.80151, '2021-04-19 07:26:40');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b4335f69-2331-4145-95f1-45c57ebafe18', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.02972, 105.80165, '2021-04-19 07:26:41');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ca13938a-db85-4869-9ee0-eacdaabb14bf', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.02966, 105.80177, '2021-04-19 07:26:42');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('27407bb6-729b-441f-be35-41632d710101', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.02964, 105.80189, '2021-04-19 07:26:43');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0e744c9d-a5b1-40e4-8427-41dc7e983c1b', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.02935, 105.80236, '2021-04-19 07:26:44');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d1963b72-63bb-44e3-bbd0-9f9482085e74', '43e1bfc6-5bbe-4014-98e6-504ae79a2c53', 21.02916, 105.80277, '2021-04-19 07:31:45');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c7975da7-8787-425c-8cd7-52b06a5bc3c2', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.03804, 105.7725, '2021-04-19 06:06:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1b92769b-ce83-4b7f-983e-75eb9dba5a32', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.03806, 105.77254, '2021-04-19 06:11:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1263ad98-fe71-4f72-bc72-e3c20e3239fc', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.03774, 105.77381, '2021-04-19 06:11:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('599f6bfa-2eeb-4c63-95da-8cfcb8989dcb', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.03742, 105.77491, '2021-04-19 06:16:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('92209457-9e82-48df-94c0-3005fd36714d', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.03699, 105.77631, '2021-04-19 06:21:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('366d34f5-55f3-44b3-a435-492da0917a27', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.03676, 105.77707, '2021-04-19 06:21:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b1be8fb2-76d1-40da-9aab-977da935fda4', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.03666, 105.77743, '2021-04-19 06:21:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('966e6caa-e8d9-4ed5-8d54-0c54a300e57a', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.03656, 105.77783, '2021-04-19 06:26:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('92b39ad1-0cb8-4374-8fcf-adc122276893', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.03651, 105.77832, '2021-04-19 06:26:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9bf5a51f-9a71-4b1f-a051-b0a98494304b', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.03649, 105.7792, '2021-04-19 06:26:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('066976d6-e0c8-4300-a062-89430904138e', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.03648, 105.77956, '2021-04-19 06:26:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bbe845d7-d45a-4925-9f57-bce8b1f13303', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.03645, 105.78023, '2021-04-19 06:31:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bdce6b11-e9e3-4392-9cef-04d097f3a802', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.03637, 105.78086, '2021-04-19 06:31:13');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4cd3afc6-15da-47aa-9497-383b33275d31', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.03651, 105.78124, '2021-04-19 06:31:14');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('16fd34c8-846f-4c0b-b379-15856903fa7f', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.03659, 105.78161, '2021-04-19 06:31:15');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('386e10d6-065a-4fbc-a763-169320151266', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.03659, 105.78179, '2021-04-19 06:31:16');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6ff4d5b8-8cf0-406c-8c9c-cc9e7f7d6602', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.03656, 105.78247, '2021-04-19 06:31:17');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('30334418-554e-4e04-b244-84d87574a441', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.03651, 105.7848, '2021-04-19 06:36:18');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('704a53f2-3e62-45f3-b289-21ad750faecf', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.03649, 105.78595, '2021-04-19 06:41:19');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('33003fed-5f03-472d-8eb0-161b79f1dfe5', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.03641, 105.78712, '2021-04-19 06:41:20');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a632c1db-fa0b-4946-a455-fd9872a8e2f3', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.03639, 105.78791, '2021-04-19 06:46:21');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('11317233-54a1-4ccf-be70-493a47a6f1a4', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.03635, 105.7892, '2021-04-19 06:46:22');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7fd8a6bf-d521-42a1-9650-402d20b787b2', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.03627, 105.78978, '2021-04-19 06:46:23');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9ea156d4-a76e-4bd5-8f8e-dcebca27f115', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.03632, 105.78983, '2021-04-19 06:46:24');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c82a399d-aa09-41d9-83f0-388956adfc08', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.03646, 105.78995, '2021-04-19 06:46:25');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7a918898-11db-40a4-9aac-d0864c44a8c1', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.03656, 105.79001, '2021-04-19 06:51:26');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c927d409-328d-4b22-a7eb-499a0279afb2', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.03694, 105.79014, '2021-04-19 06:51:27');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2350410d-1be5-42d7-bbd7-0994aeb7c812', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.0383, 105.79046, '2021-04-19 06:56:28');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3b409b5b-2146-44a5-9809-cd922fa54460', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.03886, 105.79053, '2021-04-19 06:56:29');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('aa7ca385-6881-4478-881c-885364044ff6', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.03978, 105.79053, '2021-04-19 06:56:30');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5d91133f-cd5a-4536-a2bb-ae947111bc63', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.04026, 105.79054, '2021-04-19 07:01:31');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('58f9636c-aba1-4927-b8ad-bfa3a47db775', '04235284-eb78-432e-88eb-0a2076d0be7c', 21.04139, 105.79052, '2021-04-19 07:01:32');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b47dc31c-6865-4f20-a3d5-77f5bf59ed9d', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03804, 105.7725, '2021-04-19 06:06:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1d2cab16-baa9-4ff1-b53f-6a04f0508cf7', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03806, 105.77254, '2021-04-19 06:11:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('19c0c171-21dd-4e6d-864e-a44631b42a9f', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03774, 105.77381, '2021-04-19 06:11:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b25c1818-0153-43c6-88a2-158b674ae89c', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03742, 105.77491, '2021-04-19 06:16:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e450e325-e88f-4747-b78a-6346e9639cd5', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03699, 105.77631, '2021-04-19 06:21:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ead9c3a8-e200-4dfe-8e39-935ae1cc8bf2', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03676, 105.77707, '2021-04-19 06:21:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1beb8d1c-36c2-4940-9325-d0ac9b3577fd', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03666, 105.77743, '2021-04-19 06:21:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('fcf162bc-8400-4162-b05d-199ede146ef3', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03656, 105.77783, '2021-04-19 06:26:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('fa9ffa1f-d094-4c6c-82ef-5e7c0ef16e72', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03651, 105.77832, '2021-04-19 06:26:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('365a1674-14c5-4078-827b-da3b729e2ac9', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03649, 105.7792, '2021-04-19 06:26:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8754d41a-1935-4991-961e-56422bf49444', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03648, 105.77956, '2021-04-19 06:26:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b5b0aa3f-151d-453d-956c-32a5680f0f5a', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03645, 105.78023, '2021-04-19 06:31:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('32520564-e38b-4e3b-b995-86501d440632', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03637, 105.78086, '2021-04-19 06:31:13');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f17ff6fa-65e3-48e5-8696-8de15ecb8dc5', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03651, 105.78124, '2021-04-19 06:31:14');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1690df97-1e7c-452d-97aa-a3b2ceb66896', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03659, 105.78161, '2021-04-19 06:31:15');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c1ad4736-3eb0-469b-aafc-7b13b811f3cf', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03659, 105.78179, '2021-04-19 06:31:16');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1960b2a4-cdd6-490a-8229-50bb0585fc37', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03656, 105.78247, '2021-04-19 06:31:17');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7acb269c-54ec-463a-ba52-a76b301b35bc', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03651, 105.7848, '2021-04-19 06:36:18');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('68cfebb6-a49c-4fee-b427-919aa3de6598', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03649, 105.78595, '2021-04-19 06:41:19');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0262d76a-1c77-44c7-8137-354735719eb0', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03641, 105.78712, '2021-04-19 06:41:20');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('94522586-bdbe-4ebb-b63e-d8e152a97840', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03639, 105.78791, '2021-04-19 06:46:21');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c03d7f02-e68f-4c56-aca0-8d266083a8db', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03635, 105.7892, '2021-04-19 06:46:22');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('36cec3ac-67a8-4f9b-99cd-d92129314e36', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03627, 105.78978, '2021-04-19 06:46:23');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('841b9160-7cbc-44f4-b608-724aa1652f68', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03616, 105.79029, '2021-04-19 06:51:24');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('07d9017e-d459-43a4-a244-17d6f2c38d8b', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03576, 105.79162, '2021-04-19 06:51:25');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('118a00df-40c8-47e8-92f3-f2e7840609bd', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03514, 105.79344, '2021-04-19 06:56:26');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3f7194bf-e6ff-49ad-afb5-3fba98fee40f', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03499, 105.7938, '2021-04-19 07:01:27');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('36efc0ca-23d6-4cdd-9e7e-aa3dea4a04bc', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03474, 105.79462, '2021-04-19 07:01:28');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('506966b5-021f-4cfc-8055-de40d58ffe4c', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.0343, 105.796, '2021-04-19 07:06:29');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('cd4b2035-c45d-45de-8b03-e30b7b3ff4d1', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.034, 105.79696, '2021-04-19 07:06:30');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d7901bfe-fc8b-4486-83ee-ec2d1b52c666', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03388, 105.79724, '2021-04-19 07:06:31');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d72ad07b-ff1d-4e22-9025-852715f2ca63', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03378, 105.79737, '2021-04-19 07:06:32');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('177b9a05-b921-4231-bbdb-a34721cf287a', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03339, 105.79777, '2021-04-19 07:11:33');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('723c8115-58fc-4a94-8ee8-77ad2127c0ea', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03265, 105.79856, '2021-04-19 07:11:34');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1708ac93-6e0f-42aa-b1a0-1318918fe783', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03182, 105.79944, '2021-04-19 07:16:35');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7ce8bc2b-48d7-4ae9-b471-1eaa4578c70d', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03108, 105.80021, '2021-04-19 07:21:36');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d6d3e8b4-1d02-499f-86d0-529d13f5e06c', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.03035, 105.80102, '2021-04-19 07:21:37');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8d1cde86-8a0d-4f48-8220-6f646dd3935b', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.0299, 105.8007, '2021-04-19 07:26:38');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2239e73f-eb11-40ad-a373-d6b6c23f60ef', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.02967, 105.80052, '2021-04-19 07:26:39');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('aa7fd4a4-fdd5-4f5d-86dd-1251c00d45dc', '1b5455d0-840f-4beb-8e8d-bef1cd71aebd', 21.02944, 105.80029, '2021-04-19 07:26:40');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ee37b6cf-239a-4e3c-968a-970fbcb288cc', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03804, 105.7725, '2021-04-19 06:06:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2af259cf-5f2a-42a3-a11b-5ecd8fa09d0d', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03806, 105.77254, '2021-04-19 06:11:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('154b29e5-832e-4dd5-b566-3d8ec195dedd', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03774, 105.77381, '2021-04-19 06:11:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('24d20cd3-6df4-47f9-b3fe-901013b422cd', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03742, 105.77491, '2021-04-19 06:16:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('03cc8ede-8d78-422b-9e97-fde99ff29467', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03699, 105.77631, '2021-04-19 06:21:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('03520b18-d87c-4a12-a716-647592b17b09', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03676, 105.77707, '2021-04-19 06:21:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3de42ea1-8ae5-406d-b115-c9bd0f0d9d22', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03666, 105.77743, '2021-04-19 06:21:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5ccd9676-1a15-4118-9784-eec4c80217d7', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03656, 105.77783, '2021-04-19 06:26:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ad7524d9-c83f-4f51-a9e7-9c8fc671e9fa', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03651, 105.77832, '2021-04-19 06:26:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('89110d9e-16c8-4e0f-8b79-1e22f844c8ff', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03649, 105.7792, '2021-04-19 06:26:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8688b957-697a-4c97-8ccf-10a814011457', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03648, 105.77956, '2021-04-19 06:26:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1ae2c336-25fe-401a-8fef-3604e16835b4', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03645, 105.78023, '2021-04-19 06:31:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('cd8ec35e-95ea-44a4-a5fa-92404870a1fc', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03637, 105.78086, '2021-04-19 06:31:13');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9ad10bb5-2a92-4962-bc18-4225ecb2b6e8', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03651, 105.78124, '2021-04-19 06:31:14');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('305fe09e-8865-4ca2-a87a-981e5720b487', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03659, 105.78161, '2021-04-19 06:31:15');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bd04d27f-2805-4c04-9a46-4f9233ead709', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03659, 105.78179, '2021-04-19 06:31:16');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5509d326-0c6d-4313-bfd2-eedfc252e45e', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03656, 105.78247, '2021-04-19 06:31:17');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e96c90c3-70f3-43a1-a836-d390c3e94678', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03651, 105.7848, '2021-04-19 06:36:18');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c3177bed-296b-4f00-80d0-fa436c142a81', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03649, 105.78595, '2021-04-19 06:41:19');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2707887e-1985-45a7-bcf1-c6bf4620ce78', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03641, 105.78712, '2021-04-19 06:41:20');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('76deb733-41bf-42c7-8790-6645d1d19e6e', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03639, 105.78791, '2021-04-19 06:46:21');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('706b4372-8b83-4155-8bd2-b3a57d4b3fa2', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03635, 105.7892, '2021-04-19 06:46:22');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bc2320a3-dc8b-4849-a963-b1c7fa396693', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03627, 105.78978, '2021-04-19 06:46:23');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ac9f9b96-091a-4793-a053-99b8ee8972c4', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03616, 105.79029, '2021-04-19 06:51:24');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1f8cb9b2-155d-4b2f-9b56-2592059fb1c1', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03576, 105.79162, '2021-04-19 06:51:25');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8515e2e8-4087-482e-addc-d4b78e82b1eb', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03514, 105.79344, '2021-04-19 06:56:26');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ecf09ee2-b90c-499a-bf5b-9b5541f4afda', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03499, 105.7938, '2021-04-19 07:01:27');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('aeec41cc-3a49-44c9-9a55-4aa8c3231921', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03474, 105.79462, '2021-04-19 07:01:28');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bae3b957-f5a1-4e5d-a913-aed805f38b4d', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.0343, 105.796, '2021-04-19 07:06:29');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1ff5582f-3b8b-4ddf-9ecc-700a2a04ecee', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.034, 105.79696, '2021-04-19 07:06:30');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('86352ac1-1a56-4ee3-ad9d-765a15a958ff', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03388, 105.79724, '2021-04-19 07:06:31');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e10b8cdc-801c-4d73-9521-577c1d23867b', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03378, 105.79737, '2021-04-19 07:06:32');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f06bde50-60a3-4748-b66d-bbfd22bb676a', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03339, 105.79777, '2021-04-19 07:11:33');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e3fadba2-bbe4-407f-b6c8-f015ad1ccf3a', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03265, 105.79856, '2021-04-19 07:11:34');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a1756808-fbf7-4573-8b75-de0afb58895f', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03182, 105.79944, '2021-04-19 07:16:35');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4f903441-bde8-4f40-86a7-3c2dbeea892e', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03108, 105.80021, '2021-04-19 07:21:36');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7d74b36c-d463-4a1d-834b-44dad059f054', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03035, 105.80102, '2021-04-19 07:21:37');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6bb99c6b-9f7e-479f-9ae7-7dd90f5eeae9', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03001, 105.80149, '2021-04-19 07:21:38');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4cecde72-cebb-4932-8882-8dfedcea8b00', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.02998, 105.80149, '2021-04-19 07:26:39');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2f92fdd8-aaab-4924-b0c1-5bdc5bcd609a', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.02987, 105.80151, '2021-04-19 07:26:40');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d2edbc0f-21ab-42bb-9576-d1f0290eaad8', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.02972, 105.80165, '2021-04-19 07:26:41');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('04060f65-c645-48e4-83a6-f019426ec784', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.02966, 105.80177, '2021-04-19 07:26:42');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7a8d9c6b-1d1e-4d39-892a-71072dab49ab', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.02964, 105.80189, '2021-04-19 07:26:43');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2375c276-a521-43ef-808d-58bfaa006234', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.02969, 105.80202, '2021-04-19 07:26:44');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a254e945-4fac-45a9-acb2-f4baee0c3baa', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.02978, 105.8021, '2021-04-19 07:26:45');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b6ac7733-958a-4ea4-b4c9-3f440a5c6c46', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.02991, 105.80216, '2021-04-19 07:26:46');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('835cc058-a30c-4e4b-bcbb-5bdc48e730d7', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.02999, 105.80217, '2021-04-19 07:26:47');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8b397970-4819-4334-84a2-ac8f6dfb5d69', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03004, 105.80215, '2021-04-19 07:31:48');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a85dff3a-1b80-4f7d-a582-77d4bc3b9104', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03016, 105.80202, '2021-04-19 07:31:49');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('23d9faf5-c219-436d-b495-537bf3e41c78', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03019, 105.80195, '2021-04-19 07:31:50');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4859d248-4ef0-47a0-85fe-0b096723da16', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03022, 105.80183, '2021-04-19 07:31:51');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3af86b43-b0e3-4768-8e18-a7c222904709', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03022, 105.80172, '2021-04-19 07:31:52');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('16004555-a2db-4ce9-b9ff-1729b2c81c53', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.0302, 105.80166, '2021-04-19 07:31:53');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c5089d25-7471-4b05-ac9b-0f0c68003e2a', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03018, 105.80161, '2021-04-19 07:31:54');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9a3d5a5f-34bd-4332-9cdd-a0dc498aa825', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03048, 105.80114, '2021-04-19 07:31:55');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('332a990a-621f-455d-990b-2f1ce47bb00c', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03076, 105.80138, '2021-04-19 07:31:56');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('330926ae-5cb4-4604-8cee-4350b39f1c86', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.0311, 105.80168, '2021-04-19 07:31:57');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('13fbe45e-b8e3-4aad-8546-0a94b31eb7fb', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03136, 105.80195, '2021-04-19 07:31:58');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bbff77e4-b461-4e07-916a-3f043264d7db', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03159, 105.80217, '2021-04-19 07:31:59');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8ae481cc-442f-40f3-bd36-9726b89d96e2', 'c7de238e-c5f4-4873-bf43-fa04c6439e86', 21.03195, 105.80249, '2021-04-19 07:32:00');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('cf95b38e-7e52-4a7f-97ed-aabc91aa8df0', '6db3ea28-de72-4bb1-82b2-1f72559f4bc0', 21.03804, 105.7725, '2021-04-19 06:06:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0f3c3c42-12de-4e81-9b37-01efe23faca9', '6db3ea28-de72-4bb1-82b2-1f72559f4bc0', 21.03806, 105.77254, '2021-04-19 06:11:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a6a8bdd4-4f5e-44f4-8408-edd9c5d044c6', '6db3ea28-de72-4bb1-82b2-1f72559f4bc0', 21.03774, 105.77381, '2021-04-19 06:11:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0c4547a8-ea45-494b-ae58-d279f223d7ce', '6db3ea28-de72-4bb1-82b2-1f72559f4bc0', 21.03742, 105.77491, '2021-04-19 06:16:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('515111c2-de3c-4498-bfa2-5e803a0e5297', '6db3ea28-de72-4bb1-82b2-1f72559f4bc0', 21.03699, 105.77631, '2021-04-19 06:21:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b17ad8df-8075-4e4e-bc19-23000300aafc', '6db3ea28-de72-4bb1-82b2-1f72559f4bc0', 21.03676, 105.77707, '2021-04-19 06:21:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a88dae50-50e2-4c82-b26c-d76eeefc40ae', '6db3ea28-de72-4bb1-82b2-1f72559f4bc0', 21.03666, 105.77743, '2021-04-19 06:21:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('859b4eff-7e26-4d93-bb30-d3b1426f082d', '6db3ea28-de72-4bb1-82b2-1f72559f4bc0', 21.03656, 105.77783, '2021-04-19 06:26:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2d7444be-7384-4422-9d87-3b5fd77c5f66', '6db3ea28-de72-4bb1-82b2-1f72559f4bc0', 21.03651, 105.77832, '2021-04-19 06:26:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4cb37f9e-83c4-41f5-85e1-cb8773b6bc5b', '6db3ea28-de72-4bb1-82b2-1f72559f4bc0', 21.03649, 105.7792, '2021-04-19 06:26:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0ffdcad2-6f65-44b7-8e62-b224b6305b9d', '6db3ea28-de72-4bb1-82b2-1f72559f4bc0', 21.03648, 105.77956, '2021-04-19 06:26:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4b05bb8f-97bb-4804-b40c-d11e355d0b54', '6db3ea28-de72-4bb1-82b2-1f72559f4bc0', 21.03531, 105.78018, '2021-04-19 06:31:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c13364b0-10fe-425e-ae77-117c14be8330', '6db3ea28-de72-4bb1-82b2-1f72559f4bc0', 21.03418, 105.77995, '2021-04-19 06:36:13');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6a6b5c38-0e0b-41ae-8fe7-508f8b837dde', '6db3ea28-de72-4bb1-82b2-1f72559f4bc0', 21.03327, 105.7798, '2021-04-19 06:36:14');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bc79d0c1-3dfe-424a-bdb8-cc73535a02fa', '6db3ea28-de72-4bb1-82b2-1f72559f4bc0', 21.03241, 105.77969, '2021-04-19 06:41:15');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('eed94d65-a4e6-48f5-8041-7a27ca546116', '6db3ea28-de72-4bb1-82b2-1f72559f4bc0', 21.0308, 105.7794, '2021-04-19 06:41:16');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5e024831-c231-4439-a139-62e5802f0ef4', '6db3ea28-de72-4bb1-82b2-1f72559f4bc0', 21.03022, 105.77934, '2021-04-19 06:41:17');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0994f1b4-9d42-4250-bfbd-58970cfb7805', '6db3ea28-de72-4bb1-82b2-1f72559f4bc0', 21.02889, 105.7791, '2021-04-19 06:46:18');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('229542a4-f410-4592-9bbe-6b863d7dc492', '6db3ea28-de72-4bb1-82b2-1f72559f4bc0', 21.02821, 105.77894, '2021-04-19 06:46:19');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('45682c53-da0f-4e5b-97e0-8a4b32ce957c', '6db3ea28-de72-4bb1-82b2-1f72559f4bc0', 21.0271, 105.77878, '2021-04-19 06:51:20');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6cf9bf9a-c7b9-4b98-b187-eb126ba845d2', '6db3ea28-de72-4bb1-82b2-1f72559f4bc0', 21.02644, 105.77868, '2021-04-19 06:51:21');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ed1787f0-5023-4d46-9464-5db878015501', '6db3ea28-de72-4bb1-82b2-1f72559f4bc0', 21.02519, 105.77851, '2021-04-19 06:51:22');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3844a8ee-40bd-4999-b8de-3dbd911da97a', '6db3ea28-de72-4bb1-82b2-1f72559f4bc0', 21.02485, 105.77845, '2021-04-19 06:56:23');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('60d7f884-5a83-4a83-9a47-2a2b42d91a51', '6db3ea28-de72-4bb1-82b2-1f72559f4bc0', 21.02442, 105.77844, '2021-04-19 06:56:24');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6ba0da1d-8bb7-4faf-9fcf-148cda197f58', '6db3ea28-de72-4bb1-82b2-1f72559f4bc0', 21.02385, 105.77848, '2021-04-19 06:56:25');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b32021bd-010b-4d2f-a85d-eae4cb5e7a71', '6db3ea28-de72-4bb1-82b2-1f72559f4bc0', 21.02305, 105.7786, '2021-04-19 06:56:26');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b8bb9d23-c60f-47f7-b1c9-322fd0a99590', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03804, 105.7725, '2021-04-19 06:06:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('200b6f7e-3b67-425e-99c6-008e19cf67c7', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03806, 105.77254, '2021-04-19 06:11:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0091c634-f47e-4c84-ab3e-4c558041a7a7', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03774, 105.77381, '2021-04-19 06:11:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8e9840a3-ae11-4ffb-9db0-44391a7df322', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03742, 105.77491, '2021-04-19 06:16:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9a1ee42f-9e8b-40dc-a7d9-5316768f11f4', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03699, 105.77631, '2021-04-19 06:21:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d5d37e64-052c-442f-ad9d-4172e26a2abf', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03676, 105.77707, '2021-04-19 06:21:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c7c29d7a-baee-4ad1-9603-e135618bd442', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03666, 105.77743, '2021-04-19 06:21:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d9fcc3d2-0f52-461b-8f4c-ffeafe3baf51', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03656, 105.77783, '2021-04-19 06:26:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a152a1cd-07fa-4cee-a3c8-de21c5d344e0', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03651, 105.77832, '2021-04-19 06:26:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b7b6e965-1312-4fd4-832c-c8b466b70b63', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03649, 105.7792, '2021-04-19 06:26:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('17b66a79-bdb8-4f71-93a6-98caa48d68a3', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03648, 105.77956, '2021-04-19 06:26:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d5a6d868-4460-4c40-8d81-0561acd2bcde', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03645, 105.78023, '2021-04-19 06:31:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bbc1f09e-5073-4807-83ea-6abb924ec2c8', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03637, 105.78086, '2021-04-19 06:31:13');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('45e4f93d-44da-44f5-b824-4c902e28a413', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03651, 105.78124, '2021-04-19 06:31:14');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6bbcef41-4130-4e40-b49c-0df497fa16db', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03659, 105.78161, '2021-04-19 06:31:15');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('59a9d1df-0472-4a53-8782-a8cdf01f0721', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03659, 105.78179, '2021-04-19 06:31:16');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f1b7dd27-85a2-4263-94c7-61ab0d6a1646', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03656, 105.78247, '2021-04-19 06:31:17');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c40b77bd-d120-433d-80d3-8d02d40115b3', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03651, 105.7848, '2021-04-19 06:36:18');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('01e03735-1518-470d-a31d-04453957d381', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03649, 105.78595, '2021-04-19 06:41:19');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('305fb105-c40e-4aec-8b5c-22e1365cbae4', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03641, 105.78712, '2021-04-19 06:41:20');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e4a1d2ce-1404-4c35-a0b8-99bcb798face', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03639, 105.78791, '2021-04-19 06:46:21');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a8a7ca3c-cf7c-4914-9a3a-abaaebee2bdd', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03635, 105.7892, '2021-04-19 06:46:22');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('fed636da-9de3-4ba5-9cc5-ac06fd201563', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03627, 105.78978, '2021-04-19 06:46:23');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('48b4efa2-b750-453f-9a6b-e4da18d76f96', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03616, 105.79029, '2021-04-19 06:51:24');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a3e66642-fa1a-49d9-a271-7a974cef04f5', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03576, 105.79162, '2021-04-19 06:51:25');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('db7fc6a0-78a8-4041-880a-04e9bc210f4f', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03514, 105.79344, '2021-04-19 06:56:26');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e36c98c9-9399-455a-9c6f-bf617b3455da', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03499, 105.7938, '2021-04-19 07:01:27');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1378282e-fa74-4e56-9bd8-8e2f5ec8a081', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03474, 105.79462, '2021-04-19 07:01:28');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('37833bfe-6e61-4cf1-8e5e-b1e0296b8794', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.0343, 105.796, '2021-04-19 07:06:29');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b1d12e79-2752-4649-a5e9-c4c5107c73cf', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.034, 105.79696, '2021-04-19 07:06:30');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('90ba7bdf-7d2f-4659-aad6-f2606146859b', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03388, 105.79724, '2021-04-19 07:06:31');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('99cc5b23-3190-4f6c-937d-e480064b0ab2', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03378, 105.79737, '2021-04-19 07:06:32');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8653265f-6168-4ec7-84cb-259c91f05b54', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03339, 105.79777, '2021-04-19 07:11:33');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('dbf03cbb-3f6d-4f64-a638-d941d30e330c', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03265, 105.79856, '2021-04-19 07:11:34');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e2824beb-09b2-4080-883a-0109f5b420eb', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03182, 105.79944, '2021-04-19 07:16:35');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1da85b7d-d54e-499c-827f-30f196f4777e', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03108, 105.80021, '2021-04-19 07:21:36');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('98518e7b-7284-4908-a74d-21238c0902c0', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03035, 105.80102, '2021-04-19 07:21:37');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9bf9e113-383d-4569-bf43-0a5701933965', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.03001, 105.80149, '2021-04-19 07:21:38');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a1704782-05c0-4954-84a8-1ddde2dd006f', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.02998, 105.80149, '2021-04-19 07:26:39');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5951e8bb-4e91-43b1-be11-c2678a7567dd', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.02987, 105.80151, '2021-04-19 07:26:40');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1f040ab5-e537-45ab-8af9-9929f5035d68', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.02972, 105.80165, '2021-04-19 07:26:41');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8e45ac8d-00f4-4a2f-a163-3b273a94e63c', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.02966, 105.80177, '2021-04-19 07:26:42');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9a67ca71-38d9-4b4f-b51a-a0dc603001e6', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.02964, 105.80189, '2021-04-19 07:26:43');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d86337c1-aa06-4d1b-a24f-9b74995473d1', '0abaac6a-8581-4a43-9759-cab16e1a3813', 21.02944, 105.80222, '2021-04-19 07:26:44');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('55968e74-497f-4264-bd7a-d5426af955bb', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03027, 105.7692, '2021-04-19 05:46:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0c5bdabc-7113-45b5-91a5-deffea35de87', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03104, 105.76935, '2021-04-19 05:46:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c9b22a6b-d595-4e5f-96f1-25f51907ad35', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03213, 105.76959, '2021-04-19 05:46:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1ccf80f5-ff1e-416b-abf0-112abd55c385', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03335, 105.76985, '2021-04-19 05:51:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('39f61157-1ac4-48da-8871-8830639b1ecc', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03355, 105.76988, '2021-04-19 05:51:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a1bf4d84-e49f-484b-8608-c81931ad9267', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03448, 105.77015, '2021-04-19 05:56:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ae988d2f-9a31-450d-a263-bd07120b2f40', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03507, 105.77037, '2021-04-19 06:01:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('60f1316b-d119-463f-be78-b229e13eb735', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03548, 105.77057, '2021-04-19 06:01:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f64616de-efd7-441e-bb95-3a19f6e497dd', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03667, 105.77128, '2021-04-19 06:01:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c011b938-befb-4261-bcb6-6e46b5f28a5f', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03784, 105.77194, '2021-04-19 06:06:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('fa2e44a3-ef0f-4dd8-9b76-4dd65b5cabab', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03786, 105.77201, '2021-04-19 06:06:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('13ed0d60-f221-4010-9ac9-1129f4026904', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03802, 105.7723, '2021-04-19 06:06:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e35ef82b-acef-419f-8355-921014a4e563', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03804, 105.77244, '2021-04-19 06:06:13');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8cb7154b-e926-43aa-bd19-b13edfe2e2d2', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03806, 105.77254, '2021-04-19 06:11:14');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9bc07dcd-084c-4f84-854e-106eda70b184', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03774, 105.77381, '2021-04-19 06:11:15');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d07ffcfe-2821-4c9b-96f0-abbeaa87b058', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03742, 105.77491, '2021-04-19 06:16:16');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e1f611bb-8ee8-4bbc-9e21-a1ba038b468e', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03699, 105.77631, '2021-04-19 06:21:17');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('209e9a11-085d-4ff5-adfa-2f1aef610ad4', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03676, 105.77707, '2021-04-19 06:21:18');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2e2110f9-3a98-4116-a7c7-38e8198979af', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03666, 105.77743, '2021-04-19 06:21:19');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('21d8364a-7a97-4772-b324-0191420d48d1', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03656, 105.77783, '2021-04-19 06:26:20');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f21249b1-5588-4e87-bbd2-3aa762851272', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03651, 105.77832, '2021-04-19 06:26:21');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8e9bb51c-422b-49fb-89ed-722f28bc5048', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03649, 105.7792, '2021-04-19 06:26:22');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('27a6c74e-50ca-4c10-9a95-5deeecb78e46', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03648, 105.77956, '2021-04-19 06:26:23');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('09c7a835-1542-4d54-8e5a-9d8aa80b9786', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03645, 105.78023, '2021-04-19 06:31:24');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('aeabecff-ba4d-4717-9944-48131562f640', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03637, 105.78086, '2021-04-19 06:31:25');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('cae8e41c-78d6-4237-9042-8d12aec08b88', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03651, 105.78124, '2021-04-19 06:31:26');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9ac26e0f-bd89-4326-9b4a-7562ec38fb07', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03659, 105.78161, '2021-04-19 06:31:27');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a40215c8-3221-48f3-8632-3616d43c57a7', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03659, 105.78179, '2021-04-19 06:31:28');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3dc97067-f075-4f14-ac6a-d386230e51b9', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03656, 105.78247, '2021-04-19 06:31:29');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('87b52405-315a-4f60-8689-7e7b047ae8ec', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03651, 105.7848, '2021-04-19 06:36:30');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d0bc8c56-134c-40dc-9ee7-c6e5249bcf13', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03649, 105.78595, '2021-04-19 06:41:31');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4e7afe15-b136-40c4-9465-3eb4e3b4d9f5', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03641, 105.78712, '2021-04-19 06:41:32');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('da205b8f-9771-450d-8ca5-8a0614d6c948', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03639, 105.78791, '2021-04-19 06:46:33');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('fa1d47b8-49a3-487c-acdb-54fc305e272e', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03635, 105.7892, '2021-04-19 06:46:34');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('11c0455f-e65f-4dd4-a516-116c6993391d', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03627, 105.78978, '2021-04-19 06:46:35');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('49e226ae-fc64-42d8-bad1-cc9b5bbc271b', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03616, 105.79029, '2021-04-19 06:51:36');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d1e65931-f583-46ac-8a02-edd7647c3dcb', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03576, 105.79162, '2021-04-19 06:51:37');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('26d25f47-a678-4794-9a28-879a58596d5c', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03514, 105.79344, '2021-04-19 06:56:38');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('fc4df436-324d-4ed6-82eb-105998c91bde', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03499, 105.7938, '2021-04-19 07:01:39');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('dd1ef0c3-91e8-47a7-9a20-9dd8ec9047cf', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03474, 105.79462, '2021-04-19 07:01:40');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b3bdbfa1-cd33-4fb9-956a-e9545eed9dfb', '0bac2659-deee-4c37-b989-0fb837349e95', 21.0343, 105.796, '2021-04-19 07:06:41');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('501db8ea-c080-4449-aa7e-4f0c7eca9e4e', '0bac2659-deee-4c37-b989-0fb837349e95', 21.034, 105.79696, '2021-04-19 07:06:42');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e37a8151-b183-4f1e-91ef-a91fb757a85c', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03388, 105.79724, '2021-04-19 07:06:43');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('412c0aaf-f69f-4101-b51d-82434030540d', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03378, 105.79737, '2021-04-19 07:06:44');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3e14bdd4-7e71-4f47-a985-cdc414c110ef', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03339, 105.79777, '2021-04-19 07:11:45');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a48459f2-0caf-4521-b157-1c38f1744a46', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03265, 105.79856, '2021-04-19 07:11:46');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8ddfc3b9-dc82-4a26-8b4c-59894f019709', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03182, 105.79944, '2021-04-19 07:16:47');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b519adce-d6c3-4b36-acb4-fea7a7d7bed3', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03108, 105.80021, '2021-04-19 07:21:48');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('91217a00-393b-470c-b9ad-3b22fa7f19dd', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03035, 105.80102, '2021-04-19 07:21:49');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('50dc2a34-96b9-40da-8d4f-926315018dc6', '0bac2659-deee-4c37-b989-0fb837349e95', 21.03028, 105.80111, '2021-04-19 07:21:50');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ab497436-40a9-4105-9f9b-f0e671557cce', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03027, 105.7692, '2021-04-19 05:46:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3bcd3a4a-16f5-43e3-8002-606ef51a922c', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03104, 105.76935, '2021-04-19 05:46:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9721e1d0-95f7-4569-8eee-dab9a140b366', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03213, 105.76959, '2021-04-19 05:46:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bca8acdc-f4bd-43e6-a423-ff2a15a39451', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03335, 105.76985, '2021-04-19 05:51:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('43a37d37-a89a-48eb-9bfb-b3d379e19b28', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03355, 105.76988, '2021-04-19 05:51:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('71a37566-e5c2-4710-a1ba-d5239bea7ae8', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03448, 105.77015, '2021-04-19 05:56:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2a7ed347-f4c0-4569-a7e2-a4315e28b4c9', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03507, 105.77037, '2021-04-19 06:01:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('07e7ef58-ff33-4bc3-b3d2-c18639fbd08c', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03548, 105.77057, '2021-04-19 06:01:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('94200c54-ca15-4c51-bf1a-978c60efb99a', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03667, 105.77128, '2021-04-19 06:01:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('fba6b437-1d36-4bcc-8f1e-80c18a8df02b', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03784, 105.77194, '2021-04-19 06:06:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('422d461f-8131-44ee-93ed-60bdfdfba4a6', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03786, 105.77201, '2021-04-19 06:06:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('008015d6-df29-4893-9e3f-0574e79b4126', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03802, 105.7723, '2021-04-19 06:06:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('99e597e3-53e2-4b50-ae13-3ac66c8f2a9c', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03804, 105.77244, '2021-04-19 06:06:13');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0a73c7a7-5a89-45d7-bc80-c27b53ef1887', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03806, 105.77254, '2021-04-19 06:11:14');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0f408c63-b36f-4f46-8c95-bf2c6410bf57', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03774, 105.77381, '2021-04-19 06:11:15');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bcfa0979-0338-4d0a-83aa-1f6a5457624c', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03742, 105.77491, '2021-04-19 06:16:16');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('78778a2f-9107-40ca-acea-c41572cbe175', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03699, 105.77631, '2021-04-19 06:21:17');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7909a5db-4c93-4154-ad82-9a1342882163', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03676, 105.77707, '2021-04-19 06:21:18');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('47252e4b-8bed-42a5-a704-526330991e7b', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03666, 105.77743, '2021-04-19 06:21:19');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a5ba1899-37a7-4151-9ded-263d7e9abf12', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03656, 105.77783, '2021-04-19 06:26:20');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2c619f7b-6f7e-4f4e-aa4a-2ebe164f647f', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03651, 105.77832, '2021-04-19 06:26:21');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('37ca6fdd-815f-4679-aafa-dd0fb9e559d4', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03649, 105.7792, '2021-04-19 06:26:22');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ecf44d86-4eef-43cc-8a31-4ddca45f884b', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03648, 105.77956, '2021-04-19 06:26:23');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('88fad848-eaa9-4e61-b6b4-95c36e8c8330', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03645, 105.78023, '2021-04-19 06:31:24');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ce0aca8f-9ed6-4fd3-a2d4-63817667672f', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03637, 105.78086, '2021-04-19 06:31:25');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3aa21107-b656-483e-8678-b99916ca1385', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03651, 105.78124, '2021-04-19 06:31:26');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('40bc43c6-460b-41b5-8180-31bd970a1c0b', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03659, 105.78161, '2021-04-19 06:31:27');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e41d52c3-0821-4b38-b1cc-b920c86adb15', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03659, 105.78179, '2021-04-19 06:31:28');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c2aa6d8d-12de-4004-80e7-bdc01689a804', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03656, 105.78247, '2021-04-19 06:31:29');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('42e7428d-7059-4d70-8d31-33b9ea1bd015', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03651, 105.7848, '2021-04-19 06:36:30');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('74ce6640-0504-4c28-b785-496fd074e794', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03649, 105.78595, '2021-04-19 06:41:31');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d08bd260-7768-43ef-a79e-e2c1634821da', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03641, 105.78712, '2021-04-19 06:41:32');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('10e14985-eb9d-45f8-9ce6-ed37250c8bf7', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03639, 105.78791, '2021-04-19 06:46:33');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('fb34d8fa-330d-43c6-a4f5-9705845cdfaa', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03635, 105.7892, '2021-04-19 06:46:34');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1859205c-7f34-4ff4-bd8f-d1261f661e1b', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03627, 105.78978, '2021-04-19 06:46:35');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('11abb902-4f31-4641-bdc4-c8e128747f67', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03616, 105.79029, '2021-04-19 06:51:36');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d04ed08e-27d7-4311-be20-094def907448', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03576, 105.79162, '2021-04-19 06:51:37');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('efc20be5-04e0-4668-946c-84f71b51e5d8', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03514, 105.79344, '2021-04-19 06:56:38');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e715ceda-a3a3-4f4a-89eb-5175577d3297', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03499, 105.7938, '2021-04-19 07:01:39');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('873296a4-1b49-4f76-8138-3dcd6397024b', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03474, 105.79462, '2021-04-19 07:01:40');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('33fa6368-4ff4-428c-9471-3fc90e827aa7', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.0343, 105.796, '2021-04-19 07:06:41');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f66c860c-543b-426b-8bae-2aa7af34930b', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.034, 105.79696, '2021-04-19 07:06:42');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('100c99eb-855f-45b1-8874-84222ccbf0a8', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03388, 105.79724, '2021-04-19 07:06:43');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c65941f8-2f66-4b36-899a-69a87da633e1', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03378, 105.79737, '2021-04-19 07:06:44');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('698ca8fa-d550-4acf-a6ba-7d2183e69d4d', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03339, 105.79777, '2021-04-19 07:11:45');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1f507b3b-2ab6-4bc2-8687-e70924d3a529', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03265, 105.79856, '2021-04-19 07:11:46');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e8356b4a-0202-458e-8ae5-38ee141b0645', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03182, 105.79944, '2021-04-19 07:16:47');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('941518d4-9ba2-41ac-946d-65bd43728355', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03108, 105.80021, '2021-04-19 07:21:48');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('040c9b0e-7dfd-4839-b5fa-927ec6dfe528', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03035, 105.80102, '2021-04-19 07:21:49');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('603bc9cf-2b4b-4fab-9bde-97d740a7bb6b', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.03001, 105.80149, '2021-04-19 07:21:50');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5da9f5d5-fb3e-4a37-836e-2c36beef014e', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.02998, 105.80149, '2021-04-19 07:26:51');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8d866ecd-627d-4065-b8ee-b3c3c33dec4d', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.02987, 105.80151, '2021-04-19 07:26:52');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c02f77bf-d9a4-4a47-acde-0cecb1d22a1f', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.02972, 105.80165, '2021-04-19 07:26:53');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('df5f7b12-35e5-4f6c-b26d-dea375ad9749', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.02966, 105.80177, '2021-04-19 07:26:54');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2b31ba11-8877-4000-96a7-28f7157ce603', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.02964, 105.80189, '2021-04-19 07:26:55');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d5c35998-d549-4c8a-a190-62d29221d1ba', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.02935, 105.80236, '2021-04-19 07:26:56');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e6c3f938-d797-428c-bea9-622fd4d371f4', '65b5f9c9-e29f-4e54-9878-7262eeaa1277', 21.02916, 105.80277, '2021-04-19 07:31:57');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1f9a8d05-5362-411b-913c-6c9b8fc61327', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03027, 105.7692, '2021-04-19 05:46:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a1c6eff0-6fd2-4435-bf75-c10f58655617', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03104, 105.76935, '2021-04-19 05:46:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ad4a7404-29f0-47ce-8b43-4d51c031d7c9', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03213, 105.76959, '2021-04-19 05:46:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('af260d9a-aa62-4049-8cd3-c13ff14f2ec5', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03335, 105.76985, '2021-04-19 05:51:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('32097417-641e-48b2-b2b4-2d3879604bed', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03355, 105.76988, '2021-04-19 05:51:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ea0176de-7774-48d4-a79b-eb52203bdcab', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03448, 105.77015, '2021-04-19 05:56:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('12265643-c5ec-4d72-88b3-7a0c53098776', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03507, 105.77037, '2021-04-19 06:01:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3887fc28-0b73-4eb2-9d10-24d990b7d593', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03548, 105.77057, '2021-04-19 06:01:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3e177b4a-496a-402c-90fb-5752b66f96ad', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03667, 105.77128, '2021-04-19 06:01:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4233c27a-c2b5-4b40-8b22-0f08033a28a2', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03784, 105.77194, '2021-04-19 06:06:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('28dc5ac3-3b15-402c-a8ba-952fe96e809c', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03786, 105.77201, '2021-04-19 06:06:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9eeb5cb4-3b09-48bb-84fa-a1c2db00766c', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03802, 105.7723, '2021-04-19 06:06:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8d6394b9-f759-4c08-b0b1-69efa76666eb', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03804, 105.77244, '2021-04-19 06:06:13');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b792dd19-504a-4a4b-b528-44d5be8ff04e', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03806, 105.77254, '2021-04-19 06:11:14');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('019907a7-f3c2-4e28-9785-a00f5fa77a4c', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03774, 105.77381, '2021-04-19 06:11:15');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e21fc35f-2631-414f-b207-dc5052b8e3f6', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03742, 105.77491, '2021-04-19 06:16:16');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8687e8d8-98d0-4cb0-8038-e9c3603fa0e5', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03699, 105.77631, '2021-04-19 06:21:17');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('cad42032-8dfa-41c4-817d-0c699fcea2d3', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03676, 105.77707, '2021-04-19 06:21:18');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('53fa918b-0241-4a7f-8ac7-5169ec6f181a', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03666, 105.77743, '2021-04-19 06:21:19');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('234680a8-d6f2-4dd8-a34c-823521938be7', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03656, 105.77783, '2021-04-19 06:26:20');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('756db715-e1e7-420a-a290-e8ba0f098a90', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03651, 105.77832, '2021-04-19 06:26:21');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8b984116-0efd-40c8-8862-5cb8e3d268e9', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03649, 105.7792, '2021-04-19 06:26:22');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('95c0083f-9230-4bb4-b15a-dc67d2fde3ba', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03648, 105.77956, '2021-04-19 06:26:23');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('461202fa-391a-4403-a750-6763bc81d13b', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03645, 105.78023, '2021-04-19 06:31:24');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9338d079-87f4-4dda-8878-e768681a916c', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03637, 105.78086, '2021-04-19 06:31:25');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ae0abfdb-a4b3-425d-8431-6adce61f9543', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03651, 105.78124, '2021-04-19 06:31:26');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9d1835e5-d0eb-490c-aaf3-e1fca972d5e2', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03659, 105.78161, '2021-04-19 06:31:27');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c574ed12-88ff-4ce6-8524-225ea9a5ff9f', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03659, 105.78179, '2021-04-19 06:31:28');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4fb2d666-8114-4392-912d-b3a51f2d97ad', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03656, 105.78247, '2021-04-19 06:31:29');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bd6a2f39-d0e7-4d40-aa7d-1f141c4d7e6b', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03651, 105.7848, '2021-04-19 06:36:30');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1402cabf-4e66-4fcd-832e-c7c5bc0ff071', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03649, 105.78595, '2021-04-19 06:41:31');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c14a2b9d-cfc4-4f5b-977e-a66b7d7a5f8c', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03641, 105.78712, '2021-04-19 06:41:32');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('73e19640-7b68-4753-9732-3f36ae4bc84c', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03639, 105.78791, '2021-04-19 06:46:33');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('22b79469-78ca-4c02-b762-06ba67f8023f', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03635, 105.7892, '2021-04-19 06:46:34');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b14de3d9-133b-4403-bc91-acf6fc5fe720', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03627, 105.78978, '2021-04-19 06:46:35');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b04b6bef-3e8e-4cd1-9220-85e4b5c5f470', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03616, 105.79029, '2021-04-19 06:51:36');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e446a6da-6e05-4d0f-b4e0-c7b21b428274', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03576, 105.79162, '2021-04-19 06:51:37');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6db1021e-5e6e-4b0a-a3cf-d9109e0bc1a7', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03514, 105.79344, '2021-04-19 06:56:38');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d97ee85a-09ca-446a-9f2b-4a001a9b1584', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03499, 105.7938, '2021-04-19 07:01:39');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('fae16596-c82d-4ea5-a0eb-529a3414314c', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03474, 105.79462, '2021-04-19 07:01:40');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('cfdf3ce4-b2aa-4e43-9ec8-47e4477d5e9c', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.0343, 105.796, '2021-04-19 07:06:41');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('93077c3a-0bd2-43d0-9edd-a98926714aed', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.034, 105.79696, '2021-04-19 07:06:42');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3de49673-9d05-43c1-befe-00c1216f6cfe', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03388, 105.79724, '2021-04-19 07:06:43');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ad10bbed-7105-46cc-b74b-45414f2dc558', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03378, 105.79737, '2021-04-19 07:06:44');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e0454689-e2df-4691-b118-e7757a64f60f', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03339, 105.79777, '2021-04-19 07:11:45');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f0076c11-af15-4810-a312-ecd2a93f975c', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03265, 105.79856, '2021-04-19 07:11:46');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('68c6c13b-9171-41d9-843f-b7c0fa86f5ba', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03182, 105.79944, '2021-04-19 07:16:47');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7645b96a-c9ae-4228-a8a1-dc28aadc32b2', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03108, 105.80021, '2021-04-19 07:21:48');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1e0bc5eb-6c8f-4059-a2d9-760da321d81e', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03035, 105.80102, '2021-04-19 07:21:49');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('dd1868fd-49ec-4de8-a388-036cfa07f0de', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03001, 105.80149, '2021-04-19 07:21:50');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0484c602-edad-4242-9230-d26e868dcfb0', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.02998, 105.80149, '2021-04-19 07:26:51');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c83374c4-aa40-4830-ad54-bf6d25416263', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.02987, 105.80151, '2021-04-19 07:26:52');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d72712df-9ed5-4ee7-ad22-c2d49f4d03e4', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.02972, 105.80165, '2021-04-19 07:26:53');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('02237804-0d63-4115-8d72-fe4cfe05a29d', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.02966, 105.80177, '2021-04-19 07:26:54');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1a33031b-778e-43d4-b244-d27689bd383e', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.02964, 105.80189, '2021-04-19 07:26:55');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1db2db77-b9b3-40be-a452-748ccf90ce0f', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.02969, 105.80202, '2021-04-19 07:26:56');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('797d1466-f1ec-44aa-8f62-2502ee41ad87', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.02978, 105.8021, '2021-04-19 07:26:57');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e96d0d31-8c13-41f0-9762-d994b3118759', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.02991, 105.80216, '2021-04-19 07:26:58');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a64c28ed-ce17-44ad-9890-e0c9eb016f48', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.02999, 105.80217, '2021-04-19 07:26:59');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7a298ce5-67b7-47e0-ae81-1ddadba281d5', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03004, 105.80215, '2021-04-19 07:32:00');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('689a3c35-4c7d-4152-9ed4-127e0c712e93', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03033, 105.80229, '2021-04-19 07:32:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3287e497-c465-4fb1-bdb9-e6d381fc740b', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03077, 105.80264, '2021-04-19 07:37:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('169c21c0-a4fa-4736-a40f-42ea69003589', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03105, 105.80303, '2021-04-19 07:37:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('395e28bf-e97f-4296-b637-4ba27a0ce994', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03177, 105.80355, '2021-04-19 07:37:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('fd4fd371-7ea2-4a12-afb6-79c4df52643d', '83bf9927-6695-4aab-84e8-162c26fdaf9e', 21.03224, 105.80386, '2021-04-19 07:37:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('64f269e2-8673-47f1-9093-92105731e64c', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03027, 105.7692, '2021-04-19 05:46:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('498a8c53-b09f-48a9-bd46-84e78eb9f35b', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03104, 105.76935, '2021-04-19 05:46:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('036fdfd5-c4f7-42d7-b45c-709d6400efb5', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03213, 105.76959, '2021-04-19 05:46:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f3a03ba8-7a1f-4d66-9588-bb131d0c5c8a', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03335, 105.76985, '2021-04-19 05:51:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5d7fa530-9358-49d2-aa6a-d37248f6a377', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03355, 105.76988, '2021-04-19 05:51:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ea9494c9-7501-4911-99fb-5f8c9b830d51', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03448, 105.77015, '2021-04-19 05:56:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a8a1f709-cea4-4b58-bce9-70d840bbb6e2', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03507, 105.77037, '2021-04-19 06:01:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2813c9cb-27b5-4246-946f-5782ec91796b', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03548, 105.77057, '2021-04-19 06:01:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1e3ee243-9902-490f-b8eb-e2f1a03323d5', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03667, 105.77128, '2021-04-19 06:01:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('91436ba2-5b42-43be-bf36-268921d1f016', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03784, 105.77194, '2021-04-19 06:06:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ddfaddb9-a477-4cf7-91f7-3b1c40481e61', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03786, 105.77201, '2021-04-19 06:06:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8fc02043-5fa6-40cf-a5f6-508bae2ae1cb', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03802, 105.7723, '2021-04-19 06:06:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('56833932-bde3-40a6-acc2-5bf3f979c0bd', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03804, 105.77244, '2021-04-19 06:06:13');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c61edd1e-7039-46da-b68f-6a892e5d7b02', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03806, 105.77254, '2021-04-19 06:11:14');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('54fe81da-1ba1-496c-bc7a-582e4135c35e', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03774, 105.77381, '2021-04-19 06:11:15');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f699cbf8-ca7c-49e7-bbaf-2cf6a87117cf', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03742, 105.77491, '2021-04-19 06:16:16');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('796df428-8dba-4e39-859c-37a1f381b371', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03699, 105.77631, '2021-04-19 06:21:17');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('fe60c55a-2066-412d-9fb4-6f6bd512ab05', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03676, 105.77707, '2021-04-19 06:21:18');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('359c56f0-b907-4518-aeed-fb261b6b0f5d', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03666, 105.77743, '2021-04-19 06:21:19');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('85f33f25-2ce2-4afd-b029-dd0b50ed5b48', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03656, 105.77783, '2021-04-19 06:26:20');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a73b936e-70cc-4b5c-bbe2-dcaaf6aad07c', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03651, 105.77832, '2021-04-19 06:26:21');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('93b026f3-f149-45b4-9c7f-ae01ab44b098', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03649, 105.7792, '2021-04-19 06:26:22');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b04de799-4e68-47e7-a4c0-515bbff42554', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03648, 105.77956, '2021-04-19 06:26:23');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3a6f94cf-dc44-4aac-bc51-b3402594aef5', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03645, 105.78023, '2021-04-19 06:31:24');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('832a2901-564f-421b-b340-9cc170241892', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03637, 105.78086, '2021-04-19 06:31:25');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('cebcaa98-5924-48ce-b180-c6e5b54bc58a', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03651, 105.78124, '2021-04-19 06:31:26');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e88edbb4-22bb-4b5a-97a4-3662c134ca4a', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03659, 105.78161, '2021-04-19 06:31:27');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bf8f6ed7-d646-411d-b54e-fad930415fdb', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03659, 105.78179, '2021-04-19 06:31:28');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2187f29b-9061-42d6-9de0-a2977d09631e', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03656, 105.78247, '2021-04-19 06:31:29');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9495d843-f154-4f29-9d41-90ca5b569d22', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03651, 105.7848, '2021-04-19 06:36:30');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('09f5dda3-0787-4180-85e8-6556758ede09', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03649, 105.78595, '2021-04-19 06:41:31');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6ac153af-d57c-4f22-bb16-9ad9a0c559de', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03641, 105.78712, '2021-04-19 06:41:32');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('665a2b3d-6e50-4aea-9e3c-3c1d9479e684', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03639, 105.78791, '2021-04-19 06:46:33');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a2af0e10-1307-4f79-b5f6-a8a49f5e40e5', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03635, 105.7892, '2021-04-19 06:46:34');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('443b39e6-916d-437d-b369-3120fff1e3dc', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03627, 105.78978, '2021-04-19 06:46:35');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('84a05534-8339-4a3a-afe7-077974b3d7c1', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03616, 105.79029, '2021-04-19 06:51:36');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('67756fae-3e53-491f-984c-55b8c2eb6d87', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03576, 105.79162, '2021-04-19 06:51:37');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('88ec7593-9194-4de5-af13-0a64f9c515a7', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03514, 105.79344, '2021-04-19 06:56:38');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0f1e63fd-096c-472f-b8e5-f5df22d00724', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03499, 105.7938, '2021-04-19 07:01:39');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e1024a91-72e9-4414-81ff-099181e7a64c', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03474, 105.79462, '2021-04-19 07:01:40');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e4e19303-0c55-49f0-a9e1-bff5e31167b0', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.0343, 105.796, '2021-04-19 07:06:41');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2817a2bd-0fcd-4eeb-a7a5-48b44b6754e1', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.034, 105.79696, '2021-04-19 07:06:42');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8b5b4805-a72b-4fb1-9720-5f47a1eab990', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03388, 105.79724, '2021-04-19 07:06:43');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('711f8b20-c10a-44ef-8c9b-ddf8affba871', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03378, 105.79737, '2021-04-19 07:06:44');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d6998551-2eba-4e91-b3d1-cf35d79158e8', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03339, 105.79777, '2021-04-19 07:11:45');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('98556466-522e-467c-bfe1-311e987ff6e5', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03265, 105.79856, '2021-04-19 07:11:46');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e1a795ca-2cbc-4990-b3af-072a3d9c69b1', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03182, 105.79944, '2021-04-19 07:16:47');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f31c0d9d-ca89-445b-8098-5f95aac7be44', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03108, 105.80021, '2021-04-19 07:21:48');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('282f273c-8e96-4a48-95d4-2b14897e2841', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03081, 105.79999, '2021-04-19 07:26:49');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('356c3cc8-51cf-4a08-b168-7b2a20b563c8', '1d453c85-77a7-4531-ac37-1d13a6f9f334', 21.03079, 105.79993, '2021-04-19 07:26:50');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2136e424-77fb-436d-b0bf-73df6794f7cf', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03027, 105.7692, '2021-04-19 05:46:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('76aa89b4-ef3b-4ed5-a3dd-f68278cefa22', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03104, 105.76935, '2021-04-19 05:46:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7c25239a-3afb-4ecc-9f52-807052c3c471', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03213, 105.76959, '2021-04-19 05:46:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c0855948-fdd2-45a5-8f3c-356ebce5d983', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03335, 105.76985, '2021-04-19 05:51:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b518d23a-7fee-4baf-b9e2-6dff0fa92db7', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03355, 105.76988, '2021-04-19 05:51:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d0b39316-6d2d-45c2-bb38-e0aa4ffcb7ee', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03448, 105.77015, '2021-04-19 05:56:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9cec67ed-8fdd-4acc-89fe-63b337d419c2', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03507, 105.77037, '2021-04-19 06:01:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f9a96d05-e3a5-479e-bffb-89a7a872128c', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03548, 105.77057, '2021-04-19 06:01:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('17041eaf-7fee-473b-acf5-987e6c5d866f', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03667, 105.77128, '2021-04-19 06:01:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('23765644-260c-488f-b434-386e08ddd84d', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03784, 105.77194, '2021-04-19 06:06:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d47c7833-3ee8-4071-9698-98cc361b6120', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03786, 105.77201, '2021-04-19 06:06:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('98fb46c0-221f-4c1a-9995-83396390eaf9', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03802, 105.7723, '2021-04-19 06:06:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e81812d6-0e56-43e1-8a00-489384e02fed', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03804, 105.77244, '2021-04-19 06:06:13');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('39f18df5-2a83-48a7-89f4-3503eac5ee26', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03806, 105.77254, '2021-04-19 06:11:14');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('479b6451-0661-4d5f-8e35-b3ca6a1b85d1', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03774, 105.77381, '2021-04-19 06:11:15');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0426ee63-16b3-4b57-8141-905cc25ec7ff', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03742, 105.77491, '2021-04-19 06:16:16');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a6895e59-9077-4aa1-987d-72507157ed48', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03699, 105.77631, '2021-04-19 06:21:17');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b7ba09f1-59dd-41de-9f57-d1c375b59951', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03676, 105.77707, '2021-04-19 06:21:18');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1df7f989-d5db-4b54-9861-ea83e23d40d1', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03666, 105.77743, '2021-04-19 06:21:19');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('88da81f3-94bb-4cc1-9b1a-9742805f8dab', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03656, 105.77783, '2021-04-19 06:26:20');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f98c89f6-3f26-48fe-b26b-499d11be8eb5', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03651, 105.77832, '2021-04-19 06:26:21');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('acbe7fc0-d637-43d8-a693-719f5dcec692', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03649, 105.7792, '2021-04-19 06:26:22');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a9f7b4b9-ee79-4f97-9221-c9588ad301c5', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03648, 105.77956, '2021-04-19 06:26:23');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b11a7da9-2886-4a51-a46d-251fcb353468', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03645, 105.78023, '2021-04-19 06:31:24');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bc99c824-10f5-4784-80cd-5722e29d8dd3', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03637, 105.78086, '2021-04-19 06:31:25');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('015f82fb-e253-42a0-9242-d26d0ba2a9d8', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03651, 105.78124, '2021-04-19 06:31:26');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7c62086b-c285-47d4-b6c5-9870371608ab', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03659, 105.78161, '2021-04-19 06:31:27');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ad22e4ca-7aef-4165-a57d-d885b9c4584b', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03659, 105.78179, '2021-04-19 06:31:28');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('33576bd5-f318-44a5-aade-c3429c13cda1', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03656, 105.78247, '2021-04-19 06:31:29');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('934d9fe9-68f1-42ff-805d-a59c0012717e', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03651, 105.7848, '2021-04-19 06:36:30');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d9425d61-1889-4fe3-8a48-e68f45dee319', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03649, 105.78595, '2021-04-19 06:41:31');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('dd9efa04-c7f6-4ad1-bb3e-c4e5578d8d8b', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03641, 105.78712, '2021-04-19 06:41:32');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0ec0cc0c-4945-42cc-ada8-37591fcd6b45', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03639, 105.78791, '2021-04-19 06:46:33');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b9fdc414-b482-4ef5-8ca8-461f3b8ece86', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03635, 105.7892, '2021-04-19 06:46:34');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9a422231-8d28-49ae-b0b8-159c0eecd7ee', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03627, 105.78978, '2021-04-19 06:46:35');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4148f205-e39a-4ec2-b54d-48804a88559b', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03616, 105.79029, '2021-04-19 06:51:36');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('647cc5ab-f65b-45e1-83c8-b5c846597134', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03576, 105.79162, '2021-04-19 06:51:37');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9830512d-0523-476b-94c1-359daa92fc4f', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03514, 105.79344, '2021-04-19 06:56:38');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('10285303-4534-48b8-a863-b2e12abf8d0f', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03499, 105.7938, '2021-04-19 07:01:39');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1c982b87-e813-443b-b5fc-52ece7892e09', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03474, 105.79462, '2021-04-19 07:01:40');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4a3ed53c-3a77-4912-818e-f412e7069cee', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.0343, 105.796, '2021-04-19 07:06:41');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ec72fa1e-1895-4c1a-a55b-30fb96dac344', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.034, 105.79696, '2021-04-19 07:06:42');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b9bff027-896f-4ed3-8351-a06a0f09937c', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03388, 105.79724, '2021-04-19 07:06:43');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d18b58cb-e0ae-441e-86bc-43644bfd08f4', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03378, 105.79737, '2021-04-19 07:06:44');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8880fa86-0761-450a-8ef1-4029a62fdd27', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03339, 105.79777, '2021-04-19 07:11:45');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('057dd762-395c-4d42-9576-4013592f38dc', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03265, 105.79856, '2021-04-19 07:11:46');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8a125a70-dbb3-4d25-8bc8-eb94e6e3b4fe', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03182, 105.79944, '2021-04-19 07:16:47');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6e8483e7-1c72-433c-837d-6090740d941f', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03108, 105.80021, '2021-04-19 07:21:48');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8902de46-ea60-4a15-abe4-ec37961e3bd5', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03035, 105.80102, '2021-04-19 07:21:49');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ab34d6b9-f55e-4ab7-8e40-ae19b720a06b', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.03001, 105.80149, '2021-04-19 07:21:50');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7d32224d-3e48-48b5-90f4-8186797f08cb', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.02998, 105.80149, '2021-04-19 07:26:51');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('44203d8b-133b-4b94-aa56-cdc91ddfb074', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.02987, 105.80151, '2021-04-19 07:26:52');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7511bdad-844c-4084-9f90-c8355b0f3944', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.02972, 105.80165, '2021-04-19 07:26:53');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4e3b4d51-039f-472e-9967-293f2cf60413', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.02966, 105.80177, '2021-04-19 07:26:54');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d821c79e-8ddd-47b1-8b13-fb04a9b7de27', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.02964, 105.80189, '2021-04-19 07:26:55');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('95a98da5-2a8b-4323-b8bb-f481d2ff3f91', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.02935, 105.80236, '2021-04-19 07:26:56');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d463c61f-0aae-4cb9-b02e-9c9fc2cda273', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.029, 105.80312, '2021-04-19 07:31:57');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2cb2825e-f539-42ba-a2f7-cefecc4087d3', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.02822, 105.80471, '2021-04-19 07:31:58');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('af371ecb-194e-4201-983a-fb4d067e1c77', '853087e2-6953-41a2-932c-3179a1e1fbff', 21.02818, 105.80489, '2021-04-19 07:31:59');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a1bda59e-df36-4edc-b023-8df15d06d7de', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03027, 105.7692, '2021-04-19 05:46:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('47956fe2-efe7-4afe-aa22-22ee72230beb', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03104, 105.76935, '2021-04-19 05:46:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1ba72ca1-3345-4027-b474-59b3bd2b9ea7', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03213, 105.76959, '2021-04-19 05:46:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('872541c7-33a2-4591-b130-500a4b3161dc', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03335, 105.76985, '2021-04-19 05:51:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9cff65e5-00e1-418d-890a-3de6963c5aeb', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03355, 105.76988, '2021-04-19 05:51:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f2a62546-6795-4a39-8ec9-7274d8ced78e', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03448, 105.77015, '2021-04-19 05:56:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('95d2109c-c246-49d2-aba8-ca2fcb552cda', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03507, 105.77037, '2021-04-19 06:01:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3eeaa3b5-ffc8-4ef2-9488-3a2d03ee167c', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03548, 105.77057, '2021-04-19 06:01:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1f8b28d8-4487-43a3-b8a6-9e0694cac73b', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03667, 105.77128, '2021-04-19 06:01:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2b2d0c2f-7505-441d-b497-c8d063cdecf5', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03784, 105.77194, '2021-04-19 06:06:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('929d6d64-9d88-462d-9f92-a48b07b6f822', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03786, 105.77201, '2021-04-19 06:06:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b36588ef-4f50-4991-a346-eca19ac08f32', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03802, 105.7723, '2021-04-19 06:06:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0782baad-33b1-4218-b303-263ca4c133a0', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03804, 105.77244, '2021-04-19 06:06:13');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('be28c9e9-2711-45e9-afb0-a8d558705403', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03806, 105.77254, '2021-04-19 06:11:14');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8c6c2db4-a2ca-42ad-8c3a-287738199051', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03774, 105.77381, '2021-04-19 06:11:15');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('91dbce52-8b6f-4406-8d0d-52e8da1759de', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03742, 105.77491, '2021-04-19 06:16:16');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('492df3d2-0028-4b82-84b9-e6b03e0ef29a', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03699, 105.77631, '2021-04-19 06:21:17');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3f66728b-64e4-460e-8262-6a20d396e573', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03676, 105.77707, '2021-04-19 06:21:18');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c9c916dc-49d1-4cc1-81bd-ee004ea6fdad', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03666, 105.77743, '2021-04-19 06:21:19');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7cd39f76-2ad7-4e73-9cce-3bc0c965c195', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03656, 105.77783, '2021-04-19 06:26:20');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('62d09c45-b74d-4ea2-8f86-5e6968d90d38', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03651, 105.77832, '2021-04-19 06:26:21');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0b465e05-fe1a-49e4-bda9-cb2a289e1329', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03649, 105.7792, '2021-04-19 06:26:22');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('cc70a380-4e5b-4734-8ac9-5709f5e68d5c', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03648, 105.77956, '2021-04-19 06:26:23');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('52c1e752-e2dc-403e-813b-4942d8f43c52', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03645, 105.78023, '2021-04-19 06:31:24');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1b505596-d892-4fad-ad03-c4470c21ba65', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03637, 105.78086, '2021-04-19 06:31:25');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8dedcb62-2143-400f-be81-b79d4c699b4a', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03651, 105.78124, '2021-04-19 06:31:26');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f3d444d6-4125-435b-aa0b-3a4e3a83337d', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03659, 105.78161, '2021-04-19 06:31:27');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b5ae1068-8a29-488b-a14a-43296676e262', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03659, 105.78179, '2021-04-19 06:31:28');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d7da50a2-f814-42e1-a1c1-aa159bfbfbfe', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03656, 105.78247, '2021-04-19 06:31:29');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('65f61e29-516d-4146-be5c-bb7f94441bea', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03651, 105.7848, '2021-04-19 06:36:30');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('46aa9b42-30fa-4aa3-9d45-62e383192ad4', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03649, 105.78595, '2021-04-19 06:41:31');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('13fea199-ecff-4a60-8bac-026f829e64b7', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03641, 105.78712, '2021-04-19 06:41:32');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e82e59aa-8135-425e-8b19-61eb1420bc78', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03639, 105.78791, '2021-04-19 06:46:33');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6a0e0d38-6810-486c-8e49-d7997aa9f087', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03635, 105.7892, '2021-04-19 06:46:34');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b0c06bdf-b0c5-49f4-9137-5437ff0764eb', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03627, 105.78978, '2021-04-19 06:46:35');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('12f9d4eb-3f90-42ba-9e84-71c6030d79cf', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03616, 105.79029, '2021-04-19 06:51:36');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7376e8b9-64c1-4c68-8afd-b016a23e112e', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03576, 105.79162, '2021-04-19 06:51:37');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7cf8e077-4a0f-4f53-bf1e-7b1f8e694574', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03514, 105.79344, '2021-04-19 06:56:38');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('19753956-9840-4a1d-9352-34911a5facc0', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03499, 105.7938, '2021-04-19 07:01:39');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a6e42c88-fa56-4e23-9b99-1c79f8f69019', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03474, 105.79462, '2021-04-19 07:01:40');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1ecb076c-f39f-4222-8e55-90074f9e6bd0', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.0343, 105.796, '2021-04-19 07:06:41');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('837242dc-bf62-4e76-aed1-23acc969c645', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.034, 105.79696, '2021-04-19 07:06:42');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('22b1651c-a7dc-48b8-bd3f-3ee53cd6ed15', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03388, 105.79724, '2021-04-19 07:06:43');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c74cd227-e7c0-4251-9c8f-ee34046234f5', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03378, 105.79737, '2021-04-19 07:06:44');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('66cdb2da-bc3f-403b-8ca8-5fae25ff05d3', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03339, 105.79777, '2021-04-19 07:11:45');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a5a14da9-bb74-4054-8c81-2c7b35d98582', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03265, 105.79856, '2021-04-19 07:11:46');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('388ab4b8-37e0-4a43-b371-8821c8038100', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03182, 105.79944, '2021-04-19 07:16:47');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5a50d1e8-7806-42b9-bcc1-2dce9922b402', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03108, 105.80021, '2021-04-19 07:21:48');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5aceed75-1e8b-45d5-9b66-80d240857b83', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.03035, 105.80102, '2021-04-19 07:21:49');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d49a89e5-9240-48c8-9652-521d8aa9d257', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.0299, 105.8007, '2021-04-19 07:26:50');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e769fbf6-2234-4a40-96ec-61521354bfc0', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.02967, 105.80052, '2021-04-19 07:26:51');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('70702684-a874-4495-ac84-a931094d8298', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.02939, 105.80024, '2021-04-19 07:26:52');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5bc9dd2c-8dff-4f62-873d-a8b99d2a09c5', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.02919, 105.8001, '2021-04-19 07:26:53');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('eccfcb30-7424-45ed-ab71-de34e9898997', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.02905, 105.79999, '2021-04-19 07:31:54');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('146e371e-cfa2-45da-a21c-e4b308d896d0', '05cad89c-d422-441d-b86a-d08b2ba30102', 21.02885, 105.79979, '2021-04-19 07:31:55');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e6524031-eb25-4334-9e70-b27d4acc22eb', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03027, 105.7692, '2021-04-19 05:46:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('95398631-47ba-4c40-a7fa-d32caebf95c9', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03104, 105.76935, '2021-04-19 05:46:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d333942f-2f0a-4b4e-9858-aefac76918ca', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03213, 105.76959, '2021-04-19 05:46:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7cd65660-8c13-48eb-bda2-db7942169bd0', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03335, 105.76985, '2021-04-19 05:51:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('72d3af0a-6af1-428a-9860-2212913a77b8', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03355, 105.76988, '2021-04-19 05:51:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('991a1ea2-62b2-47cd-b2ef-0d21a7c9b08d', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03448, 105.77015, '2021-04-19 05:56:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5be8e7ea-0c6c-4a31-810e-9cb0c9d9d712', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03507, 105.77037, '2021-04-19 06:01:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('aa70ae19-74a3-4271-aa64-89ee37d976b1', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03548, 105.77057, '2021-04-19 06:01:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8243411a-5d33-492a-82d3-1fde5031e521', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03667, 105.77128, '2021-04-19 06:01:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('47e82a8b-fe40-4424-bc11-21992dadfb26', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03784, 105.77194, '2021-04-19 06:06:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e2378283-c055-483e-a7e7-bb64e41c1309', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03786, 105.77201, '2021-04-19 06:06:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b65386a4-eb0f-48d9-a9b5-46815801a497', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03802, 105.7723, '2021-04-19 06:06:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b07bc57a-992f-403d-aa4b-80be4cd2faf5', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03804, 105.77244, '2021-04-19 06:06:13');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('02496706-3dfd-4890-9a2a-5f1da3fdbe42', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03806, 105.77254, '2021-04-19 06:11:14');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('82403df4-9f49-4cb0-9c98-8d201a6664e6', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03774, 105.77381, '2021-04-19 06:11:15');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('953e8c6e-fd89-48d8-9338-9b24bebfc0bc', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03742, 105.77491, '2021-04-19 06:16:16');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b2f5f22d-6ff7-411e-b22b-7a5be252fee8', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03699, 105.77631, '2021-04-19 06:21:17');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5e49b529-a95b-4fa6-90b1-788583838292', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03676, 105.77707, '2021-04-19 06:21:18');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ac4c6696-0f9b-465b-8a5a-02008afe1ff9', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03666, 105.77743, '2021-04-19 06:21:19');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5f4cf88a-f046-4f82-85f1-36f8a0c18b65', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03656, 105.77783, '2021-04-19 06:26:20');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d8a4ca52-fed2-4914-b461-c0f5b76ada07', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03651, 105.77832, '2021-04-19 06:26:21');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a8e7f5e6-848a-44aa-949b-f7363978dbb0', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03649, 105.7792, '2021-04-19 06:26:22');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0f04b8c1-84d6-4b6d-9e46-7239e078c712', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03648, 105.77956, '2021-04-19 06:26:23');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6fbb6884-480f-4a30-a09a-bc02a8c36c3e', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03645, 105.78023, '2021-04-19 06:31:24');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e1a50066-08ae-4a27-a471-1e0baeec5d21', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03637, 105.78086, '2021-04-19 06:31:25');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('cd1fc277-cd73-4f2d-b5e5-702a3ab4b32a', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03651, 105.78124, '2021-04-19 06:31:26');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e632bcbe-2898-478b-acad-4049903995a9', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03659, 105.78161, '2021-04-19 06:31:27');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3dbabd8a-7a1a-4ea5-afb6-44ecc04fdd30', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03659, 105.78179, '2021-04-19 06:31:28');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('303930b8-ab55-4d06-89d1-9643eb44103a', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03656, 105.78247, '2021-04-19 06:31:29');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b4f82337-a99b-42c4-a6aa-eed794f33bcf', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03651, 105.7848, '2021-04-19 06:36:30');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('814202c0-0bf3-46f4-a884-c7a556c35bfa', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03649, 105.78595, '2021-04-19 06:41:31');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b4460cb9-f02c-44d3-adab-d3cc1ce0a148', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03641, 105.78712, '2021-04-19 06:41:32');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('72553637-865d-46c2-ae29-d6b6231a7586', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03639, 105.78791, '2021-04-19 06:46:33');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e1defda2-0726-463e-872c-9939650896ae', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03635, 105.7892, '2021-04-19 06:46:34');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('70472917-e3a3-40f2-9b39-9dba1e40bd23', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03627, 105.78978, '2021-04-19 06:46:35');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9ad0076c-49ed-45a8-8606-a5bf8470f7e2', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03616, 105.79029, '2021-04-19 06:51:36');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ea31e4d8-8532-4244-8b86-408d37eb64ae', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03576, 105.79162, '2021-04-19 06:51:37');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3ffee295-85d4-487d-b6c0-c4fbd82f24bd', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03514, 105.79344, '2021-04-19 06:56:38');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8eb48947-46cd-4507-bdc3-7d7fa2d723fe', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03499, 105.7938, '2021-04-19 07:01:39');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1427868f-7ce3-43fc-ad5c-06cd9dbdb875', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03474, 105.79462, '2021-04-19 07:01:40');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4867861e-ca35-4c36-8dfb-1eb90b82d547', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.0343, 105.796, '2021-04-19 07:06:41');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('75f2971d-f708-4a96-99c9-9c1aa7203f3b', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.034, 105.79696, '2021-04-19 07:06:42');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c544d564-506a-479c-bbe2-4b33254c9e1c', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03388, 105.79724, '2021-04-19 07:06:43');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2af49d23-cae3-451c-9f94-f1f5b644d1b4', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03378, 105.79737, '2021-04-19 07:06:44');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a2eb09ec-45ba-453b-a2aa-5505c3b21782', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03339, 105.79777, '2021-04-19 07:11:45');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b9539689-293a-4a2f-84cb-177ff1da0164', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03265, 105.79856, '2021-04-19 07:11:46');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8d3b16f9-f9c0-40c9-848d-121825617355', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03182, 105.79944, '2021-04-19 07:16:47');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2ad203d4-d37a-474a-8fbf-2ac60cdde235', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03108, 105.80021, '2021-04-19 07:21:48');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3ed137b4-80d4-4a68-b38b-c08ed49977d3', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03035, 105.80102, '2021-04-19 07:21:49');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2192d5a7-af33-4ba4-9ad3-21f02fba5b77', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03001, 105.80149, '2021-04-19 07:21:50');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('19443f67-bbf3-41bd-95d6-fdfd61f4ff69', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.02998, 105.80149, '2021-04-19 07:26:51');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1c9bd4d1-6c6a-40a1-a4a4-bdb563b63c67', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.02987, 105.80151, '2021-04-19 07:26:52');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2ad9d10c-afae-4fe5-9fcb-f36bda9f4928', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.02972, 105.80165, '2021-04-19 07:26:53');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9765a212-b1f8-4b0c-a210-e671cf85e70f', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.02966, 105.80177, '2021-04-19 07:26:54');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5ed86551-7225-4d65-99dd-f0cc3d89bae0', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.02964, 105.80189, '2021-04-19 07:26:55');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9f725dea-a8bb-4969-9527-35d243c56c12', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.02969, 105.80202, '2021-04-19 07:26:56');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e0878946-cf4a-442f-ba42-09ed294942f9', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.02978, 105.8021, '2021-04-19 07:26:57');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a8caa091-9615-4dd9-b253-e416157f40b5', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.02991, 105.80216, '2021-04-19 07:26:58');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f3f9e394-6539-4a80-947f-ba5e95c79aa1', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.02999, 105.80217, '2021-04-19 07:26:59');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('dd1bea89-4101-446a-b7bd-51edc2215597', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03004, 105.80215, '2021-04-19 07:32:00');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('81faf82c-e7ef-4181-844c-553068cf5084', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03016, 105.80202, '2021-04-19 07:32:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9b3c4972-4827-44a2-a56a-3cd3c2246021', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03019, 105.80195, '2021-04-19 07:32:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ea211a63-876d-4a23-9514-7fb4ad7448c4', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03022, 105.80183, '2021-04-19 07:32:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('281c6a7b-9a93-4952-a6b1-ced939c7cf4b', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03022, 105.80172, '2021-04-19 07:32:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('32b0da99-5066-4776-95c7-a25033a4ef0c', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.0302, 105.80166, '2021-04-19 07:32:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('864355cc-60bf-4fe6-87dc-0a228819d1ac', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03018, 105.80161, '2021-04-19 07:32:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c153f081-23ca-4f6f-acf2-12558a2b81b7', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03048, 105.80114, '2021-04-19 07:32:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7cda432e-7314-4c8e-9de8-19178c61b3cb', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03076, 105.80138, '2021-04-19 07:32:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e1fc5179-45f0-4e6e-ab40-0e7e98c32e42', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.0311, 105.80168, '2021-04-19 07:32:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('dd99b5ac-6935-4b2a-9915-56ea6374194d', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03136, 105.80195, '2021-04-19 07:32:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9558bdc2-2082-4770-8726-5f6f9c7d3490', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03159, 105.80217, '2021-04-19 07:32:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1f078c2f-d1c5-46d7-b6b6-52dc041013b2', 'fc261d8f-edec-4987-96c5-d80f61dcaeb4', 21.03234, 105.80284, '2021-04-19 07:37:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('89c2a2ae-f0b0-4197-9b74-94bc52c1aa4f', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03027, 105.7692, '2021-04-19 05:46:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2bcaa184-0068-4667-b894-4279a154d8a7', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03104, 105.76935, '2021-04-19 05:46:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('42c2163c-4e04-4981-8a9b-80a5d8e31a40', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03213, 105.76959, '2021-04-19 05:46:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('caa8159d-7c45-43db-9b1a-319b79105848', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03335, 105.76985, '2021-04-19 05:51:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f5e06d2a-16ae-44b4-9ecd-77b69389472f', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03355, 105.76988, '2021-04-19 05:51:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('787f010d-42fc-4d5a-b399-28db42684336', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03448, 105.77015, '2021-04-19 05:56:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('154ab934-e63e-4a0c-8ebc-1222bbfc7076', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03507, 105.77037, '2021-04-19 06:01:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6a4ef395-a12b-4000-b30f-6cd85edce1cb', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03548, 105.77057, '2021-04-19 06:01:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4c2a1352-a27f-44fa-87c7-d392cafe1420', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03667, 105.77128, '2021-04-19 06:01:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2d56ca98-2429-4a24-8d8e-8bf91f935868', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03784, 105.77194, '2021-04-19 06:06:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9fc72be7-9971-4c46-a6c8-07e16377e2d9', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03786, 105.77201, '2021-04-19 06:06:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9570dabc-2b3b-4678-b043-a1220c03c521', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03802, 105.7723, '2021-04-19 06:06:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('799d068f-e797-4c3b-aec0-326ebc38a35d', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03804, 105.77244, '2021-04-19 06:06:13');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('11b4092e-4972-4d93-b29f-d93fda792ef4', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03806, 105.77254, '2021-04-19 06:11:14');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('306c15e2-12d9-4dec-996c-2bb58211e5dc', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03774, 105.77381, '2021-04-19 06:11:15');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8489fb1e-4fae-4318-8418-e8e9ee7a4f09', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03742, 105.77491, '2021-04-19 06:16:16');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4e6abd37-04a8-4340-a543-e6db2bcaa324', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03699, 105.77631, '2021-04-19 06:21:17');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a955f0aa-0f5a-4daf-b007-8baa3a80ba5a', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03676, 105.77707, '2021-04-19 06:21:18');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('87b3516c-6060-4b1e-baa8-1954b3b9837a', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03666, 105.77743, '2021-04-19 06:21:19');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b9180d48-34db-44ae-8708-31b4b26c2060', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03656, 105.77783, '2021-04-19 06:26:20');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('083d39df-4f93-4110-aa88-559e82bc60cd', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03651, 105.77832, '2021-04-19 06:26:21');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f80d8da4-103a-4388-b7d4-5ddd5b20d8e2', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03649, 105.7792, '2021-04-19 06:26:22');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7eab3d1a-f655-47c3-92aa-833eb6ff313a', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03648, 105.77956, '2021-04-19 06:26:23');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('402f3455-2ee3-4daf-bbb4-c38cf6ece11b', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03645, 105.78023, '2021-04-19 06:31:24');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('57842fde-e6f8-490a-8e37-729c6251b081', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03637, 105.78086, '2021-04-19 06:31:25');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5616784e-e762-4181-bc7d-ba0f5ea01926', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03651, 105.78124, '2021-04-19 06:31:26');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ee310250-8a80-4596-ae23-0e6d2021ef52', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03659, 105.78161, '2021-04-19 06:31:27');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e01cf8ed-30ae-42f7-8be5-6091e1538f27', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03659, 105.78179, '2021-04-19 06:31:28');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f4f82e07-8cc1-49dd-859d-8b7de18e1ee3', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03656, 105.78247, '2021-04-19 06:31:29');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bdb528bb-6e99-4563-8161-37db0714f804', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03651, 105.7848, '2021-04-19 06:36:30');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8405dc55-aa85-4a38-965b-9fd0e6849292', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03649, 105.78595, '2021-04-19 06:41:31');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6ebd6c56-ef96-4e11-b26a-ca7e7d1d5c5b', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03641, 105.78712, '2021-04-19 06:41:32');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('60dd858e-0ff5-4727-9f87-66a0b977cd02', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03639, 105.78791, '2021-04-19 06:46:33');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1c0810e2-8a21-4537-9711-d89d7e54aae3', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03635, 105.7892, '2021-04-19 06:46:34');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c6448017-2795-4944-abd3-1632aa9b54ff', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03627, 105.78978, '2021-04-19 06:46:35');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0d1ba1f9-2099-4dad-bf27-2525c3f36758', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03616, 105.79029, '2021-04-19 06:51:36');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4f9e109d-b18f-45a4-8ec7-115c1f8cf94c', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03576, 105.79162, '2021-04-19 06:51:37');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0f5ca181-4c61-4986-ad52-e95bd5c89ea1', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03514, 105.79344, '2021-04-19 06:56:38');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('806c34bd-3602-46d2-8a66-ff642be17a7e', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03499, 105.7938, '2021-04-19 07:01:39');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e2bd35cc-537b-4714-93b7-365dfda1967d', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03474, 105.79462, '2021-04-19 07:01:40');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7b496739-99d0-4d33-a37e-f9b689df9c0f', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.0343, 105.796, '2021-04-19 07:06:41');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bfa7e70f-6bb0-459b-9504-19289ed0a59e', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.034, 105.79696, '2021-04-19 07:06:42');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3f407d99-e67c-4713-95b5-7826451a5898', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03388, 105.79724, '2021-04-19 07:06:43');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('aa47c570-79b9-4c58-8c1f-2294a11929ee', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03378, 105.79737, '2021-04-19 07:06:44');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ad91ab54-145c-488b-9df6-9dcd6146151c', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03339, 105.79777, '2021-04-19 07:11:45');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d2eec4d0-2a0b-41bb-b191-75cf02aec983', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03272, 105.79848, '2021-04-19 07:11:46');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bcf5cde6-8266-4e84-af2b-4c7f409ef75a', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03264, 105.79825, '2021-04-19 07:11:47');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8503ebc6-7e22-4ff3-8129-4a1ef329b899', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03257, 105.7981, '2021-04-19 07:11:48');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8ebd1c09-085f-4d1c-a2b3-15859d610b52', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03238, 105.79785, '2021-04-19 07:16:49');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3d2aa7a1-174c-4167-8b92-5cbd1e0e687d', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03219, 105.7976, '2021-04-19 07:16:50');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e76e32a5-244a-4200-a24a-1519fb3163d4', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03216, 105.79748, '2021-04-19 07:21:51');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('cade54a8-b2ed-4827-99b1-0590de02ca40', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03221, 105.79733, '2021-04-19 07:21:52');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bc4497ae-5591-4a63-9658-4a743314d910', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03227, 105.79722, '2021-04-19 07:21:53');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('342fe6e4-d25a-4229-8e26-01e841d5468a', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03227, 105.79719, '2021-04-19 07:21:54');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('416bd60d-d5dc-4a43-ab7e-e55356d996d2', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03224, 105.79715, '2021-04-19 07:21:55');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e1053feb-ac52-4e2a-8533-fcd259c41773', 'e1f621a2-c361-42e3-a965-b60beb80cc73', 21.03183, 105.7968, '2021-04-19 07:21:56');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0b46e593-844e-4679-95b7-f3efe8765da0', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03027, 105.7692, '2021-04-19 05:46:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4ec1d7f8-4840-4ed8-ad06-23479c003f06', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03104, 105.76935, '2021-04-19 05:46:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('eb7928de-e5e8-427f-b3a6-da3d7053f5a0', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03213, 105.76959, '2021-04-19 05:46:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bde2a2d6-07a0-439b-acaa-a2c8eeefa3ff', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03335, 105.76985, '2021-04-19 05:51:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('cec39e01-a9c6-47bc-8f08-44fb187a7d22', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03355, 105.76988, '2021-04-19 05:51:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('995b0879-6a5d-4d05-90ec-58af7deecf3a', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03448, 105.77015, '2021-04-19 05:56:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a1751bc8-5755-4ee1-90a1-20792a7e9ace', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03507, 105.77037, '2021-04-19 06:01:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('af44e4d1-a95c-4081-b83f-d8edb3ef33c6', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03548, 105.77057, '2021-04-19 06:01:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('862d651b-b8dc-45e2-a5ba-e9cd0071e136', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03667, 105.77128, '2021-04-19 06:01:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b1fb1f09-60d6-4917-b8b3-0d939e97a31b', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03784, 105.77194, '2021-04-19 06:06:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ad984b8d-7f90-4403-91ff-0ab729bb5dbe', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03786, 105.77201, '2021-04-19 06:06:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('626eb2a9-7cfb-4ad7-86ae-71e2f6ac1cd3', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03802, 105.7723, '2021-04-19 06:06:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('cc0040ad-2bd0-41f7-a229-818ecd30d9e4', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03804, 105.77244, '2021-04-19 06:06:13');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('065f1c86-0175-440f-871e-33feaba1c517', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03806, 105.77254, '2021-04-19 06:11:14');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2c03067e-7209-4da0-a413-96148798228b', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03774, 105.77381, '2021-04-19 06:11:15');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('25ca55f5-cfec-4b75-a903-989f6433d8a2', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03742, 105.77491, '2021-04-19 06:16:16');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e7ecc677-47a9-4a35-9c29-dd6b73f57b16', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03699, 105.77631, '2021-04-19 06:21:17');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3e7d4c5e-ccce-4678-af82-b9f70536b9e0', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03676, 105.77707, '2021-04-19 06:21:18');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('74ad455f-7c5b-4e3f-abd2-c3c41c30f62b', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03666, 105.77743, '2021-04-19 06:21:19');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e2dbe6f3-fe7a-40fb-9ab9-4fe32c554f26', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03656, 105.77783, '2021-04-19 06:26:20');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4c3b4b88-ce96-43e1-8cf3-6d0e2a78785b', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03651, 105.77832, '2021-04-19 06:26:21');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ab22a30f-4ae1-498d-9104-362603ae82f9', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03649, 105.7792, '2021-04-19 06:26:22');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b30634c5-73a8-4002-aae4-5d20991d6622', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03648, 105.77956, '2021-04-19 06:26:23');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('07375fde-d78a-4c4c-bfe1-df68f00cb08e', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03645, 105.78023, '2021-04-19 06:31:24');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('208cf602-6739-49ba-8b50-fc3fce86233f', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03637, 105.78086, '2021-04-19 06:31:25');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('29b6c850-8232-48a4-9040-486f06d1d2d5', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03651, 105.78124, '2021-04-19 06:31:26');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8c999fbc-d67f-4177-9d43-ef2efb7b270c', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03659, 105.78161, '2021-04-19 06:31:27');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b446f488-c2a2-4e7b-b58c-2d30651cd67b', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03659, 105.78179, '2021-04-19 06:31:28');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b0fe144c-493e-4aa5-a00d-ce739d548e5f', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03656, 105.78247, '2021-04-19 06:31:29');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1bb93c1f-527f-499f-a871-8e830eaee893', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03651, 105.7848, '2021-04-19 06:36:30');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7919541e-d8ad-4bf5-a1c7-9f342c6ef7bc', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03649, 105.78595, '2021-04-19 06:41:31');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('af029cfe-2079-48bc-bdf2-515f69d9eb1e', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03641, 105.78712, '2021-04-19 06:41:32');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3f7e1ac9-88f9-4b4d-b0d5-2cee7f480f4d', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03639, 105.78791, '2021-04-19 06:46:33');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6708d380-51fe-48fa-b19c-671912768fd1', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03635, 105.7892, '2021-04-19 06:46:34');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('38f1dede-723a-4efd-9ea9-c10c341f3a93', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03627, 105.78978, '2021-04-19 06:46:35');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2a50aa91-71ea-4df8-b3e9-703feaedca76', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03616, 105.79029, '2021-04-19 06:51:36');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('69affb9b-1640-4b7c-915d-f2b09982477f', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03576, 105.79162, '2021-04-19 06:51:37');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d3f43ff9-45ed-4c60-82ea-6b74e4dba04b', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03514, 105.79344, '2021-04-19 06:56:38');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bf2803c5-53b0-4e49-b1fb-12fc92ed1f38', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03499, 105.7938, '2021-04-19 07:01:39');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e41d1efc-33b4-4933-b719-04f685d9271b', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03474, 105.79462, '2021-04-19 07:01:40');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7c9d495d-e2d6-40ab-9245-254b80a1b040', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.0343, 105.796, '2021-04-19 07:06:41');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3e3b1de6-b66d-4cb8-9680-faedb1fa1ee6', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.034, 105.79696, '2021-04-19 07:06:42');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e168c2f4-83d5-4987-9cb9-58f8598cd685', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03388, 105.79724, '2021-04-19 07:06:43');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('61c19c36-5253-4d1b-8e1b-8d8373f1ee59', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03378, 105.79737, '2021-04-19 07:06:44');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e875b4b2-fab4-45a4-ab19-bbdc31a485f4', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03339, 105.79777, '2021-04-19 07:11:45');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('256f6e0e-7814-438b-8ad3-25283f088c25', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03265, 105.79856, '2021-04-19 07:11:46');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('10d0b4b4-10e3-45b5-b875-db9cc21e9722', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03182, 105.79944, '2021-04-19 07:16:47');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8836ede8-0cc1-4231-8f52-23a0fe14c0e4', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03108, 105.80021, '2021-04-19 07:21:48');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7dd65a31-d618-41cb-8b1a-9d242f546cf8', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03035, 105.80102, '2021-04-19 07:21:49');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d261cd16-f1e7-49a1-b85b-2be40ce21dcb', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.03001, 105.80149, '2021-04-19 07:21:50');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e96b7ced-0621-406a-9adf-615d6fd83219', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.02998, 105.80149, '2021-04-19 07:26:51');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8dec3c2a-3930-4677-8265-39ebfd8202bc', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.02987, 105.80151, '2021-04-19 07:26:52');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('15f0c9e2-951f-40c3-aa02-c1bd4f837a8a', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.02972, 105.80165, '2021-04-19 07:26:53');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8a6b5fc0-1a3d-4b26-9d58-30498099f606', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.02966, 105.80177, '2021-04-19 07:26:54');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c7fe925b-3eab-4509-93e2-ea13d29d5cb1', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.02964, 105.80189, '2021-04-19 07:26:55');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0e2da898-54d1-459d-930b-d405cbef1367', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.02935, 105.80236, '2021-04-19 07:26:56');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b2c741d5-50c4-4b26-9915-216cf2e93089', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.029, 105.80312, '2021-04-19 07:31:57');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5e7f9787-2d11-4270-997c-a2af29ca8b20', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.02822, 105.80471, '2021-04-19 07:31:58');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2bc648d1-287c-411e-b88c-97b886992428', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.02818, 105.80489, '2021-04-19 07:31:59');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('080707e2-3113-41ac-baa3-d5c3df32df14', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.02818, 105.80506, '2021-04-19 07:37:00');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8654a411-8411-4a45-8a79-6708ce275ed6', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.0284, 105.8055, '2021-04-19 07:37:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0c33cce9-b121-4e00-9d5a-620961c7b10b', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.02843, 105.80577, '2021-04-19 07:37:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ee9b8c2f-5e81-4ec1-8d76-3b4a140a84f8', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.02838, 105.80608, '2021-04-19 07:37:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7dd556b7-9149-4b07-ae9a-cdfe9223614b', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.02817, 105.807, '2021-04-19 07:37:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6a4a1aed-90f4-4d7e-88a0-d267d203b983', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.02801, 105.80783, '2021-04-19 07:42:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('71915b94-ecab-46ea-a6a3-f0740bb2f7f1', '24d5a46c-92c7-4603-a5dc-43cb83869cc4', 21.02796, 105.80804, '2021-04-19 07:42:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('18a31bf3-9156-466e-b153-9ac76416a75a', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03027, 105.7692, '2021-04-19 05:46:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6a7907ab-7fd4-4bd5-bac2-0a0708ad80d2', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03104, 105.76935, '2021-04-19 05:46:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1c781f7e-325f-4682-911b-9116d6d64c70', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03213, 105.76959, '2021-04-19 05:46:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('db301ecc-bbf9-4c3c-af56-1c1b5dff9085', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03335, 105.76985, '2021-04-19 05:51:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6e58e751-9012-45a9-9871-4319e022e759', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03355, 105.76988, '2021-04-19 05:51:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6673c2bc-b043-47ed-95ec-29c0e2fb6939', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03448, 105.77015, '2021-04-19 05:56:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('80d7e5ff-0c51-4652-b95b-589154d2f61a', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03507, 105.77037, '2021-04-19 06:01:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a35ed1a6-1d4c-4991-8b05-fa73019285cb', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03548, 105.77057, '2021-04-19 06:01:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ff2377b3-fef7-4e7c-a314-281191e3c6a0', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03667, 105.77128, '2021-04-19 06:01:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('edff3928-732c-406f-b444-2cb20c5eacd4', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03784, 105.77194, '2021-04-19 06:06:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('254b5be2-b82f-47d5-9b1d-1039a1a6fd7b', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03786, 105.77201, '2021-04-19 06:06:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('85157cbc-50f6-4ef7-b087-cc3b4173528b', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03802, 105.7723, '2021-04-19 06:06:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a1f95c7f-2927-42db-92a5-c16c5733916a', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03804, 105.77244, '2021-04-19 06:06:13');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3e690fbe-66c7-420a-b840-e107516ccb8b', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03806, 105.77254, '2021-04-19 06:11:14');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bc6cb891-ca79-473f-b93f-2819bdc0b178', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03774, 105.77381, '2021-04-19 06:11:15');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b0d757c5-3d8f-4ab2-8205-8bf5c5e606a2', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03742, 105.77491, '2021-04-19 06:16:16');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b9f50d4f-4865-459d-8ddc-c6505fb6e266', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03699, 105.77631, '2021-04-19 06:21:17');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7b3e0eb2-7bbf-456e-9c7e-6b450166801a', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03676, 105.77707, '2021-04-19 06:21:18');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('35a1025a-412b-424f-8d7d-197f6d743496', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03666, 105.77743, '2021-04-19 06:21:19');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b756f810-0f2e-4da1-97a5-dfa0e696ce05', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03656, 105.77783, '2021-04-19 06:26:20');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8ac533fd-9663-4f15-98bb-758548103b7c', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03651, 105.77832, '2021-04-19 06:26:21');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6ef2c03b-15d1-457b-a1ed-5a192bfe2553', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03649, 105.7792, '2021-04-19 06:26:22');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e99cf8a8-5d6e-468a-89a4-e572c8a26727', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03648, 105.77956, '2021-04-19 06:26:23');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3ee24645-a92f-4581-9723-525b03ce80b9', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03645, 105.78023, '2021-04-19 06:31:24');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ebfeb876-ae71-449f-be55-c3743b0f1a3f', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03637, 105.78086, '2021-04-19 06:31:25');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('eb6cac0a-4ba6-4157-a496-8f1a77d39c4e', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03651, 105.78124, '2021-04-19 06:31:26');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0a31d8c9-f2bc-48e9-879b-a03d0f91bda4', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03659, 105.78161, '2021-04-19 06:31:27');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1ffd3c82-8412-434e-b7fd-24310385f11d', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03659, 105.78179, '2021-04-19 06:31:28');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('982b8d32-b575-455d-958a-cfe85c14ebd1', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03656, 105.78247, '2021-04-19 06:31:29');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('591166f3-88c6-4a46-910b-4142396a30e8', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03651, 105.7848, '2021-04-19 06:36:30');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('da9736b4-7f74-4e16-95fc-fe22f5ed77e4', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03649, 105.78595, '2021-04-19 06:41:31');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('42bc4c5c-aed1-4059-946c-360b3d0d3f7e', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03641, 105.78712, '2021-04-19 06:41:32');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('58a43529-5ae9-42fc-8721-3e993bdf0623', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03639, 105.78791, '2021-04-19 06:46:33');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('049d14bb-5120-4428-b8b7-b32f600d363b', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03635, 105.7892, '2021-04-19 06:46:34');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('09346455-543b-4e41-bd96-f1ed9fdeef9a', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03627, 105.78978, '2021-04-19 06:46:35');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('aabfbdde-5739-4e92-ab35-ffcb8de36f05', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03616, 105.79029, '2021-04-19 06:51:36');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('690c613c-308d-4700-995a-037fef56f1a4', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03576, 105.79162, '2021-04-19 06:51:37');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c4cd1bf8-be54-448d-8093-c884ef429ae9', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03514, 105.79344, '2021-04-19 06:56:38');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bf2bcd5d-c230-416c-8aea-6a37ff77a1fa', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03499, 105.7938, '2021-04-19 07:01:39');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4507d903-5c97-47d6-98e3-234e6df99c14', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03474, 105.79462, '2021-04-19 07:01:40');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('dcf53c8a-b1da-45d0-ac2d-9e5de1e14b3c', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.0343, 105.796, '2021-04-19 07:06:41');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4e8b37ee-e95e-4138-96b8-9fb8abf62cff', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.034, 105.79696, '2021-04-19 07:06:42');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2ea6fda6-be24-4ea0-bc15-cb63baec314c', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03388, 105.79724, '2021-04-19 07:06:43');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4d058671-5a3a-4a43-8fd4-2e69db0e78b9', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03378, 105.79737, '2021-04-19 07:06:44');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('15431b9c-d56f-49f5-a9a0-67cbbab4c0e1', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03339, 105.79777, '2021-04-19 07:11:45');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('82ffe08a-202f-4dc5-a46e-5ec0cd77ded8', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03265, 105.79856, '2021-04-19 07:11:46');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1dc5a34f-bd42-4489-b213-aa47f823f987', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03182, 105.79944, '2021-04-19 07:16:47');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b3fe51d1-2121-44ef-84e7-e882cfa7db3c', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03108, 105.80021, '2021-04-19 07:21:48');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('224fd44d-583b-42f4-9f2a-4f5efaf82a7c', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03035, 105.80102, '2021-04-19 07:21:49');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b2c37ada-e38d-4752-aba0-30b9de4c3c3b', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.03001, 105.80149, '2021-04-19 07:21:50');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('947a044b-701b-47dc-ae15-4ae3c2d5d8fa', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.02998, 105.80149, '2021-04-19 07:26:51');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('770dfeb2-92ff-4b0c-a15c-3b79e6201e01', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.02987, 105.80151, '2021-04-19 07:26:52');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ba254bf7-1ca8-443a-9af7-3375ea241089', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.02972, 105.80165, '2021-04-19 07:26:53');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ba5e2922-6905-4162-acaf-f1c33978db21', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.02966, 105.80177, '2021-04-19 07:26:54');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('70486c82-e0ca-43a3-b183-d85fd1bd14f9', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.02964, 105.80189, '2021-04-19 07:26:55');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('310cf537-9e6f-457d-9b17-cd589c869618', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.02935, 105.80236, '2021-04-19 07:26:56');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c66d387a-37a2-4d9f-8a52-921025fdd534', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.029, 105.80312, '2021-04-19 07:31:57');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('349fd476-2d12-484f-ae07-07cf0b95c7c6', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.02822, 105.80471, '2021-04-19 07:31:58');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('fe0a98a1-94e3-48f6-a47d-0e2e59637324', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.02818, 105.80489, '2021-04-19 07:31:59');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b1940dd4-dd0b-4ef4-9e96-2bb20c0801be', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.02818, 105.80506, '2021-04-19 07:37:00');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('27507886-635d-4f37-ac1b-a40f8dade81c', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.02828, 105.80528, '2021-04-19 07:37:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7e022f01-d5f6-4572-bad2-1bfba6bbcf42', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.02853, 105.80544, '2021-04-19 07:37:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f0ab80db-0f82-4f66-8d8d-7cef0439f65a', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.02877, 105.80564, '2021-04-19 07:37:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b6021cad-4b61-4340-807f-4af02b84be64', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.02884, 105.80576, '2021-04-19 07:37:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('996a876b-dcea-470b-a701-c39397ddf988', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.0291, 105.80647, '2021-04-19 07:37:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8de66f7e-b3dc-4e70-ab5f-9ff333753e7f', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.02921, 105.80683, '2021-04-19 07:37:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4c0ff407-c628-45d3-9cc2-20364f258e8b', 'bc2a5c33-fa53-46d9-9e86-bdbb0bff2b86', 21.02938, 105.80812, '2021-04-19 07:42:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('38327c22-f846-4733-9b31-6fe5d3623e18', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03027, 105.7692, '2021-04-19 05:46:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8e17d0f5-8f4b-440f-b95c-4635a449fa7c', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03104, 105.76935, '2021-04-19 05:46:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('cd84cbea-2740-4057-b723-ae7da78be51b', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03213, 105.76959, '2021-04-19 05:46:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4d5ab916-9aa6-4943-94df-6ac0431f5a72', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03335, 105.76985, '2021-04-19 05:51:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0a0bf205-e93b-473e-9213-7dfb89eee7bb', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03355, 105.76988, '2021-04-19 05:51:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('499b7262-f3e3-4fac-8121-ca1dea286873', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03448, 105.77015, '2021-04-19 05:56:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('52054bdb-4573-4426-8a06-13beb072775f', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03507, 105.77037, '2021-04-19 06:01:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('de84651c-e413-4988-9dd3-1d868cf1bcde', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03548, 105.77057, '2021-04-19 06:01:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ceb0e8fa-6bc5-4a51-b932-061005e77d98', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03667, 105.77128, '2021-04-19 06:01:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9a31441a-27cd-43ca-806a-3696b256cd3f', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03784, 105.77194, '2021-04-19 06:06:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('75743768-cedc-433c-88a9-87886f6b2d7f', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03786, 105.77201, '2021-04-19 06:06:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6f578817-cb23-43d7-9cf4-b741b7159412', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03802, 105.7723, '2021-04-19 06:06:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c1e76af0-17ed-4694-a700-55764fdf1c24', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03804, 105.77244, '2021-04-19 06:06:13');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('028bb62c-3d4c-4b8d-8008-1dc2cffc517d', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03806, 105.77254, '2021-04-19 06:11:14');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e3943477-4d00-4afa-9957-cf099f25b71a', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03774, 105.77381, '2021-04-19 06:11:15');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c852cbee-8a2c-42b6-b92a-f9d9a58832bc', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03742, 105.77491, '2021-04-19 06:16:16');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7074e030-1829-4512-9603-474e7a8612bf', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03699, 105.77631, '2021-04-19 06:21:17');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f879f52a-ac42-4f59-a2a9-9d07159028db', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03676, 105.77707, '2021-04-19 06:21:18');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('61240bba-e29e-4116-9e9a-03a8751226d1', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03666, 105.77743, '2021-04-19 06:21:19');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9884a5a8-4dbb-423d-be65-4fe5a5a054c7', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03656, 105.77783, '2021-04-19 06:26:20');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9d2a61c8-bbf0-4a3f-8e97-9bbc49cf6615', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03651, 105.77832, '2021-04-19 06:26:21');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ad2a681b-155c-4c03-a99f-5bd4e22f9e69', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03649, 105.7792, '2021-04-19 06:26:22');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('26d87e44-4b41-4f3c-9ded-ae4099fa8d93', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03648, 105.77956, '2021-04-19 06:26:23');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9a40f340-ea60-43f1-a19e-a0e94c0f04a4', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03645, 105.78023, '2021-04-19 06:31:24');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8ec88d94-ea51-4cca-aa9b-75ab2a87faed', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03637, 105.78086, '2021-04-19 06:31:25');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('194917f0-6795-4893-9174-4ec8bc8ead32', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03651, 105.78124, '2021-04-19 06:31:26');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b7c62ec6-8388-4ba0-96cc-ccbbb4643404', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03659, 105.78161, '2021-04-19 06:31:27');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0022bc1a-e956-4db1-a3f0-c21e01a8057e', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03659, 105.78179, '2021-04-19 06:31:28');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3e12cec8-d70b-4128-bc23-76b526bf122c', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03656, 105.78247, '2021-04-19 06:31:29');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('474af5ca-f68a-4b33-b0d1-59e6781ec32f', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03651, 105.7848, '2021-04-19 06:36:30');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('86bda742-de22-4bcd-81c7-edea6510e59d', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03649, 105.78595, '2021-04-19 06:41:31');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('815cb5fe-f077-45a7-9026-f1faa7fa60d1', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03641, 105.78712, '2021-04-19 06:41:32');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8964a248-a357-4c86-beef-d2250764b40d', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03639, 105.78791, '2021-04-19 06:46:33');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4add4ba8-c1ca-4c34-ba7c-fb770080452c', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03635, 105.7892, '2021-04-19 06:46:34');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('855e646f-dfcf-4fd1-9a79-f95aee82c114', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03627, 105.78978, '2021-04-19 06:46:35');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2e3df107-a9ff-493c-9ecc-9a37b8dc4a76', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03616, 105.79029, '2021-04-19 06:51:36');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ecaff943-7ddc-4a88-b99f-78deb07b5c57', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03576, 105.79162, '2021-04-19 06:51:37');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3d4d3b1d-b201-4288-b1c8-e90afbe5b639', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03514, 105.79344, '2021-04-19 06:56:38');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a8a06e62-4f8e-4b7d-a2a7-75c4135ed2be', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03499, 105.7938, '2021-04-19 07:01:39');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('86526123-600f-4bdf-b1ee-7b17900661d5', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03474, 105.79462, '2021-04-19 07:01:40');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5965b657-9e29-49ba-b09d-4b40d2df4f30', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.0343, 105.796, '2021-04-19 07:06:41');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7fc20e40-e48d-47e8-ba70-b568e0c0d874', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.034, 105.79696, '2021-04-19 07:06:42');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('008b9e2b-5091-4386-9144-e4f060fc7fc2', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03388, 105.79724, '2021-04-19 07:06:43');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('dc085109-a8e7-44a2-a0d4-b9f3eb88875c', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03378, 105.79737, '2021-04-19 07:06:44');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ce5b57f1-d024-46f8-9e70-40e644f9fb81', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03339, 105.79777, '2021-04-19 07:11:45');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('71bc30b1-fa5c-4103-b2b4-2b88a778cb63', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03265, 105.79856, '2021-04-19 07:11:46');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('124f5e3b-16a9-4581-88d4-5cd6205f29ed', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03182, 105.79944, '2021-04-19 07:16:47');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('972c3258-8d47-4ac5-90da-8d14c04f10d0', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03108, 105.80021, '2021-04-19 07:21:48');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5702a23b-84d4-46b1-a447-4f9685f761be', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03035, 105.80102, '2021-04-19 07:21:49');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('65ffdfcf-e9f3-4945-8cdb-07294d88eb42', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03001, 105.80149, '2021-04-19 07:21:50');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('be54bc9c-467f-4f7e-9dfe-b83bd82cdd59', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.02998, 105.80149, '2021-04-19 07:26:51');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f24c71f8-561e-47fb-b3fa-0faa887af8d0', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.02987, 105.80151, '2021-04-19 07:26:52');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f85ea244-e5cc-48f5-856a-9c48417cab09', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.02972, 105.80165, '2021-04-19 07:26:53');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ccd3ae71-587e-4236-87a1-48afe1aadfec', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.02966, 105.80177, '2021-04-19 07:26:54');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('200b6d1e-43fe-4041-98d5-8b359bcdd040', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.02964, 105.80189, '2021-04-19 07:26:55');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('af1b083a-6302-4cf1-8818-ea19aff797f2', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.02969, 105.80202, '2021-04-19 07:26:56');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('76b55b06-31fb-4d7c-b17b-44716c4c8475', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.02978, 105.8021, '2021-04-19 07:26:57');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1e4dee70-cf45-4f90-93db-d8b2d8c13220', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.02991, 105.80216, '2021-04-19 07:26:58');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0b34f266-f93f-4f15-848a-128ff7abb110', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.02999, 105.80217, '2021-04-19 07:26:59');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a5a43a2a-042e-4806-80b9-3badd1773a2a', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03004, 105.80215, '2021-04-19 07:32:00');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('99de302a-b9fb-4eb0-b6ed-e6d0ca2eeb7f', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03016, 105.80202, '2021-04-19 07:32:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0bbf471e-7b45-492f-98e5-f12f8c687de0', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03019, 105.80195, '2021-04-19 07:32:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('376df1b9-a692-47b5-9553-bd225ddf75c4', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03022, 105.80183, '2021-04-19 07:32:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ec325387-a6c6-49bf-aae1-44153bb3d9ee', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03022, 105.80172, '2021-04-19 07:32:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('958bff13-9b8d-43e0-a150-9916a9c3fc40', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.0302, 105.80166, '2021-04-19 07:32:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('df6d8912-a9c8-43a4-95b4-0b6d3a6812ad', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03018, 105.80161, '2021-04-19 07:32:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('defab0a9-10ea-4fd7-a1d9-d02ac0b6f6e8', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03048, 105.80114, '2021-04-19 07:32:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1aff00ca-9c58-45d4-bf6a-6c0fd0854e18', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03102, 105.80051, '2021-04-19 07:32:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a99bc531-8e62-482e-a29e-08ada1c0a9cc', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03124, 105.80071, '2021-04-19 07:32:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b39472df-1e60-4fc6-bc81-ace01c8cca60', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03147, 105.80097, '2021-04-19 07:32:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6a26a19b-dea1-417a-af02-c8740eb487f2', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03182, 105.80125, '2021-04-19 07:32:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6dd6dfb5-4905-4349-a1f0-9135d7b35262', 'eee166e8-274a-403e-95ba-067d3f47cc18', 21.03216, 105.80145, '2021-04-19 07:32:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f26907e1-b3a4-4926-8eac-8a63e0d33210', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03027, 105.7692, '2021-04-19 05:46:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('79ad8019-25c5-45a3-bc44-b33069f6d9d4', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03104, 105.76935, '2021-04-19 05:46:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a690b7bb-9c1e-41b3-abe1-3c487c25d5a8', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03213, 105.76959, '2021-04-19 05:46:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('db1e7e8e-f004-4b46-b810-4b2399901a8f', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03335, 105.76985, '2021-04-19 05:51:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('95490a7f-1c18-4fe7-849c-31625eb846a5', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03355, 105.76988, '2021-04-19 05:51:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('05aa474e-9104-4299-8aea-4b23b50abf25', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03448, 105.77015, '2021-04-19 05:56:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7039786e-037e-4b18-84d1-7da9a756852d', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03507, 105.77037, '2021-04-19 06:01:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('02a8824a-167a-479a-8fd4-b2b0786acac9', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03548, 105.77057, '2021-04-19 06:01:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c78c3d3c-260a-49d4-935b-f0de8a43761e', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03667, 105.77128, '2021-04-19 06:01:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ffddda5f-39c6-4d32-8623-90338aa6e81b', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03784, 105.77194, '2021-04-19 06:06:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f533b6fa-6190-49e2-bcaf-7f495db0b022', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03786, 105.77201, '2021-04-19 06:06:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('de94f7d5-6b7a-40c8-a3b2-2bc2ad8bc8e1', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03802, 105.7723, '2021-04-19 06:06:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a715557e-ef4f-4319-8469-6bc2e0cea459', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03804, 105.77244, '2021-04-19 06:06:13');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('dab78c0d-542a-418f-8bb5-5d12b0d140c8', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03806, 105.77254, '2021-04-19 06:11:14');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c3ff4f55-e417-4364-ab64-ddb037ad1953', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03774, 105.77381, '2021-04-19 06:11:15');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9e4c0566-fe77-4f72-a35c-b642224929fc', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03742, 105.77491, '2021-04-19 06:16:16');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d32fe227-9306-4156-ae16-cec900dc1a0e', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03699, 105.77631, '2021-04-19 06:21:17');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('16f5e2a5-8133-48f5-bca4-124ba8103a5d', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03676, 105.77707, '2021-04-19 06:21:18');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d6778e4b-d31d-4cbb-ad66-22434f8af3d5', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03666, 105.77743, '2021-04-19 06:21:19');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6842a96f-7c1a-467c-9236-d300a98ba4fb', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03656, 105.77783, '2021-04-19 06:26:20');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d4d8413d-c4f2-4e4f-b4ec-8ac93ece7dcd', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03651, 105.77832, '2021-04-19 06:26:21');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1580be9e-4dd9-44ae-9349-5883efb16641', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03649, 105.7792, '2021-04-19 06:26:22');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('040a6942-8f1b-417f-bcc8-2762a61b2088', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03648, 105.77956, '2021-04-19 06:26:23');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('970b07a1-1b1c-4bd1-8a15-cffd18ed2d04', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03645, 105.78023, '2021-04-19 06:31:24');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f3747781-75a4-4ab5-a52c-f5e9f082f044', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03637, 105.78086, '2021-04-19 06:31:25');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ed3f3eb5-08b2-40fe-b1ea-e432ebabf8bd', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03651, 105.78124, '2021-04-19 06:31:26');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e99f9d11-e639-4885-b85c-ae665615e7de', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03659, 105.78161, '2021-04-19 06:31:27');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('267d6d38-e887-4967-ac6f-c38f6a97d531', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03659, 105.78179, '2021-04-19 06:31:28');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('550b3cbc-0af1-4090-aaed-b9cd924d8a3b', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03656, 105.78247, '2021-04-19 06:31:29');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b37f7bf3-66cc-4e24-9e72-077592c02b63', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03651, 105.7848, '2021-04-19 06:36:30');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6e8367dc-50c6-4a41-81c4-0dcbf9795bd4', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03649, 105.78595, '2021-04-19 06:41:31');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('43e3186a-1d02-4979-ab6f-8abf284448fc', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03641, 105.78712, '2021-04-19 06:41:32');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7f9705c1-8439-4b9a-81e2-89138a6135c2', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03639, 105.78791, '2021-04-19 06:46:33');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('83f7d730-ee15-4391-ba62-c2f1eb2810af', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03635, 105.7892, '2021-04-19 06:46:34');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4f2c23f2-74e3-401e-864c-41921b1e3340', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03627, 105.78978, '2021-04-19 06:46:35');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5683fbcb-ecfa-4251-a2dc-c3f3e43bcd30', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03616, 105.79029, '2021-04-19 06:51:36');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c06adfa4-b193-409d-bc11-9ef5a9ef46ad', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03576, 105.79162, '2021-04-19 06:51:37');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f57008a2-80d9-4e3c-8c89-dc5e166addfd', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03514, 105.79344, '2021-04-19 06:56:38');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e01fa98a-10ba-4d8b-a556-2760fed3fcbc', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03499, 105.7938, '2021-04-19 07:01:39');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('26a8cb77-3bff-4c7b-aae5-b04338ca0f04', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03474, 105.79462, '2021-04-19 07:01:40');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('480c674e-072c-4781-ba6d-db6ce3f251bb', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.0343, 105.796, '2021-04-19 07:06:41');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('54445c69-b9c5-4c14-ab42-b1fd94702fa6', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.034, 105.79696, '2021-04-19 07:06:42');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6455cb21-b06a-470b-9e49-fe13c90efd4d', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03388, 105.79724, '2021-04-19 07:06:43');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0d9e2109-4010-4d45-bc52-72a7aedb2fcd', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03378, 105.79737, '2021-04-19 07:06:44');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e02dbff5-670e-41a0-b7f5-e00bf625ebb0', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03339, 105.79777, '2021-04-19 07:11:45');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b47f3869-aed9-430f-a030-a77222d96093', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03265, 105.79856, '2021-04-19 07:11:46');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c6a7f819-a5a6-43f9-9519-f62ced5e4fc7', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03182, 105.79944, '2021-04-19 07:16:47');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1401b95c-c028-42d0-aac1-ed22cc163b3b', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03108, 105.80021, '2021-04-19 07:21:48');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8f16f40f-41be-4405-8002-161661ba350d', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03035, 105.80102, '2021-04-19 07:21:49');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7e9ec653-92f1-48cc-8a64-24b1f7b1e7e4', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.03001, 105.80149, '2021-04-19 07:21:50');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b63c71dc-aab9-45bf-9d5b-e899fe16eea8', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.02998, 105.80149, '2021-04-19 07:26:51');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bad16955-748e-48c9-849f-26316737aff7', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.02987, 105.80151, '2021-04-19 07:26:52');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8bb13bed-e2e3-4c06-9202-0809bfedd1f0', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.02972, 105.80165, '2021-04-19 07:26:53');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f0917197-60be-42ff-9553-15ddcf78ad9d', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.02966, 105.80177, '2021-04-19 07:26:54');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('edff66c6-ec97-4a34-814d-9cbf5e757a1d', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.02964, 105.80189, '2021-04-19 07:26:55');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('facea85d-ef28-4f72-9312-ceb550366056', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.02935, 105.80236, '2021-04-19 07:26:56');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('97001b47-fc47-4e29-a4c0-aeffc8a581cb', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.029, 105.80312, '2021-04-19 07:31:57');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6f8abf6b-fa9c-4523-b394-0431afbd38bf', '3161a5f9-24d1-40da-a194-2d67895a67bc', 21.02882, 105.80347, '2021-04-19 07:31:58');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8aa7a686-56fc-40e0-a9c9-81b7b6798811', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03027, 105.7692, '2021-04-19 05:46:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5d54b2fe-824e-4eed-8573-7c0ab318cbe3', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03104, 105.76935, '2021-04-19 05:46:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('43be2637-19ad-41ea-861f-7426592350ab', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03213, 105.76959, '2021-04-19 05:46:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9a2655d3-c47f-4e55-8dad-1e8083791fcd', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03335, 105.76985, '2021-04-19 05:51:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4ef1cff0-f14f-44a6-9639-b6d5d6766cb2', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03355, 105.76988, '2021-04-19 05:51:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e7c1c8f5-f159-4f55-8c06-e9270f5ea437', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03448, 105.77015, '2021-04-19 05:56:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('55925bcb-7011-4f4c-81b7-200973df42a7', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03507, 105.77037, '2021-04-19 06:01:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('99e290e2-408a-4d59-a9d3-a1b33c0fd824', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03548, 105.77057, '2021-04-19 06:01:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('57f9b8e7-90f4-41fc-9c77-07c28c10f0a3', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03667, 105.77128, '2021-04-19 06:01:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ec669287-d8c8-44cb-ac33-3edcbfe6a6a7', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03784, 105.77194, '2021-04-19 06:06:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e637a2cf-3432-4207-83fa-07d5c6a137ef', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03786, 105.77201, '2021-04-19 06:06:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bbc89a93-4a30-4865-b8d9-bd85e8bd3b64', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03802, 105.7723, '2021-04-19 06:06:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b88f6926-f6c8-4ddb-891e-f060265b1804', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03804, 105.77244, '2021-04-19 06:06:13');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8a41d0e1-c4c8-454f-96cb-880bd74d68ae', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03806, 105.77254, '2021-04-19 06:11:14');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b2197015-a991-4e9d-8e2d-2376ca3c5ccd', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03774, 105.77381, '2021-04-19 06:11:15');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f91d4ae3-5f50-4a31-811c-612206625140', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03742, 105.77491, '2021-04-19 06:16:16');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('dc4c6c46-b1f2-4b08-9d46-2f5957fc4f92', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03699, 105.77631, '2021-04-19 06:21:17');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('aee91eea-b1aa-427d-83f6-8423bfd120a9', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03676, 105.77707, '2021-04-19 06:21:18');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('415a38a5-3ae8-4a5b-870e-942f7c8d5eb4', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03666, 105.77743, '2021-04-19 06:21:19');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7161a03d-464b-4237-83d0-52709da3c69a', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03656, 105.77783, '2021-04-19 06:26:20');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('fe0d005c-b345-4bdd-9315-315fbd370f0f', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03651, 105.77832, '2021-04-19 06:26:21');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d98c5842-90e1-4d61-8933-fe75b512a390', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03649, 105.7792, '2021-04-19 06:26:22');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5da6a64a-9753-4e98-80d3-8d1ff921a59f', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03648, 105.77956, '2021-04-19 06:26:23');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('c8ab6da3-8a57-4736-97bc-fdd4f7203b62', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03645, 105.78023, '2021-04-19 06:31:24');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('428fbb2e-7cf1-4706-8578-2b888ccebc79', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03637, 105.78086, '2021-04-19 06:31:25');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1cda21ca-011a-44c4-91c6-744f1bdfa8f9', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03651, 105.78124, '2021-04-19 06:31:26');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('abf9fe77-dceb-4cb5-b2bc-1cae6d6bdc8f', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03659, 105.78161, '2021-04-19 06:31:27');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6007063a-9438-4d40-aaa1-4c6326df2a89', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03659, 105.78179, '2021-04-19 06:31:28');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('e5f76614-86b9-4e81-a20e-0d5735cb5036', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03656, 105.78247, '2021-04-19 06:31:29');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0e6f092a-01c0-493c-b763-2f9ead327092', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03651, 105.7848, '2021-04-19 06:36:30');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7375c632-aa9a-4313-a5c0-386bab71a05a', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03649, 105.78595, '2021-04-19 06:41:31');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('1dffc909-e89a-4c1a-8fde-8e97d4ddd844', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03641, 105.78712, '2021-04-19 06:41:32');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f912488b-cc5e-4ae5-9e52-ea212d6b4f2d', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03639, 105.78791, '2021-04-19 06:46:33');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d5a747b7-5a7e-4a5d-b23f-cd4da876c0ed', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03635, 105.7892, '2021-04-19 06:46:34');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f6d75d3a-6a0f-4516-903c-113b153800b3', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03627, 105.78978, '2021-04-19 06:46:35');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('49f45842-42a7-4a6d-aa7e-b21ead3741e2', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03616, 105.79029, '2021-04-19 06:51:36');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('493bbb17-5762-4766-b599-d2d7c46bef8a', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03576, 105.79162, '2021-04-19 06:51:37');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bdbce28f-debf-4c23-8ffa-9c0b7df9c406', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03514, 105.79344, '2021-04-19 06:56:38');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d79e21c4-bc12-4a35-98c4-b1a21bbcc779', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03499, 105.7938, '2021-04-19 07:01:39');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('adf8c05d-21e2-4e5e-9dfa-6419fef42236', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03474, 105.79462, '2021-04-19 07:01:40');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('42f0bdc5-88ff-4031-a21b-28f356733c3d', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.0343, 105.796, '2021-04-19 07:06:41');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('31f9a17e-dd50-43b0-a2f6-98b647d547a9', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.034, 105.79696, '2021-04-19 07:06:42');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('63361723-5819-4c6f-b5ce-cd41d02dba73', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03388, 105.79724, '2021-04-19 07:06:43');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8f899f6d-ce55-437b-9db5-c3d416901713', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03378, 105.79737, '2021-04-19 07:06:44');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5fa9fa1f-fd90-444d-9a8d-9d087ff2c116', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03339, 105.79777, '2021-04-19 07:11:45');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d696a5e8-ba73-42ff-b695-36774f4cfd31', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03265, 105.79856, '2021-04-19 07:11:46');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5b6ddd8a-831a-4bae-b8f3-02075dd2c09b', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03182, 105.79944, '2021-04-19 07:16:47');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('cf96336d-1c84-4479-9fd9-98f88f7f58f5', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03108, 105.80021, '2021-04-19 07:21:48');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9bbe4d9c-d583-4042-8cf4-f7f2e6c4cf16', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03035, 105.80102, '2021-04-19 07:21:49');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('dbabfb0b-458f-4aa3-ab76-65ff516f7708', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.03001, 105.80149, '2021-04-19 07:21:50');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b14e5ea7-0dbf-4381-8cdd-9c31f52a774a', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.02998, 105.80149, '2021-04-19 07:26:51');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('2bf53b30-1e43-4bf5-a88d-b8d8a16fe3f1', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.02919, 105.80079, '2021-04-19 07:26:52');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d522090f-b16e-4edb-b1c1-64db32b01d4e', 'e4900ba9-87d5-47ac-b625-25c9a6fd1b62', 21.02824, 105.79995, '2021-04-19 07:31:53');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('67563b15-638a-4070-85e3-3a3bb4632bcd', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03027, 105.7692, '2021-04-19 05:46:01');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a5e48782-b22f-4ce5-a275-b4e203940b80', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03104, 105.76935, '2021-04-19 05:46:02');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('672d84ed-7095-44d8-a9f0-e615bec4397b', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03213, 105.76959, '2021-04-19 05:46:03');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d7781ae8-9439-443e-a7c4-66999b4efb1d', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03335, 105.76985, '2021-04-19 05:51:04');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8edd3da6-a685-4bc6-a88f-137b6d9e63d0', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03355, 105.76988, '2021-04-19 05:51:05');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('456c0ada-112a-43e8-a1a5-ab5906186c20', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03448, 105.77015, '2021-04-19 05:56:06');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f2e518c3-c4e9-43fc-80a0-6edb7912174f', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03507, 105.77037, '2021-04-19 06:01:07');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6ec0c6f1-8e12-4dcc-b4a1-fbf76f5675a1', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03548, 105.77057, '2021-04-19 06:01:08');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('56a1d530-3219-44e5-8fe0-2015cb94b927', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03667, 105.77128, '2021-04-19 06:01:09');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('3ff03180-65bd-46df-a6e1-9cf68f2b6bd1', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03784, 105.77194, '2021-04-19 06:06:10');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a83f942c-4662-42ae-b5d2-fb2a6c9ad779', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03786, 105.77201, '2021-04-19 06:06:11');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('fd66e676-96e6-48f1-a436-004c895edc55', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03802, 105.7723, '2021-04-19 06:06:12');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a4a2c886-abca-4fe4-a54a-82bd529c6774', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03804, 105.77244, '2021-04-19 06:06:13');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('72ee2670-ad96-4215-975d-2c4c5b221abf', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03806, 105.77254, '2021-04-19 06:11:14');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('99f5a971-7d43-455d-8c83-dd405c43fa24', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03774, 105.77381, '2021-04-19 06:11:15');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('41b62e79-d78e-4e07-8673-b1c4486a311a', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03742, 105.77491, '2021-04-19 06:16:16');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('de45b658-4895-4a0e-a313-89cdc2de72e1', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03699, 105.77631, '2021-04-19 06:21:17');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6c90e325-cf46-476e-8962-ce2601bae30c', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03676, 105.77707, '2021-04-19 06:21:18');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b11413cd-2c84-4c02-b3fe-0ac584bbd74f', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03666, 105.77743, '2021-04-19 06:21:19');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('0357ee1b-24c8-4906-a479-e9cee9640ed1', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03656, 105.77783, '2021-04-19 06:26:20');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bba4471c-fb35-414d-865b-a8355403af2d', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03651, 105.77832, '2021-04-19 06:26:21');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('cdfd3a36-16b2-4e39-94b1-f39e6778dff1', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03649, 105.7792, '2021-04-19 06:26:22');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7333d5a7-1795-423d-a356-8f6c4c11235c', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03648, 105.77956, '2021-04-19 06:26:23');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6fb2fb00-03fe-4014-8b65-61701b2646a2', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03645, 105.78023, '2021-04-19 06:31:24');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('593d3a67-9f2c-41bb-8787-41e6ab948f11', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03637, 105.78086, '2021-04-19 06:31:25');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5f81b396-872f-47e6-b56f-c2ba25cb15d8', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03651, 105.78124, '2021-04-19 06:31:26');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('95ee4551-2b0a-451d-a35c-265aac09af89', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03659, 105.78161, '2021-04-19 06:31:27');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('39d616cf-9473-4190-8cff-d0b1183598ee', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03659, 105.78179, '2021-04-19 06:31:28');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f3f871dd-3872-4de2-b25a-d6d5d4c9f5cb', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03656, 105.78247, '2021-04-19 06:31:29');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('ee020c6c-ceba-4d98-a04c-a6801c6e62ff', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03651, 105.7848, '2021-04-19 06:36:30');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('86484b73-363c-477d-80b8-bdb9044f5af0', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03649, 105.78595, '2021-04-19 06:41:31');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5f3f02d1-0aab-45f9-b9d3-60a56ed3b0c8', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03641, 105.78712, '2021-04-19 06:41:32');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f7063eef-d8f7-44f8-a858-bf0d334c9954', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03639, 105.78791, '2021-04-19 06:46:33');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d108b216-8a3f-4b3b-b07a-45d126aeb887', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03635, 105.7892, '2021-04-19 06:46:34');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('b9818e1d-e521-4624-ad25-5edbacc4c2f9', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03627, 105.78978, '2021-04-19 06:46:35');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('5c825736-35d4-4154-af29-519c7c3f19c0', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03616, 105.79029, '2021-04-19 06:51:36');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('7ef6d00d-febe-41c7-a54c-65101a376336', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03576, 105.79162, '2021-04-19 06:51:37');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('35a51b10-e70f-43f1-98fe-46e8225d5629', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03514, 105.79344, '2021-04-19 06:56:38');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('9335aeef-007d-473b-8b60-4026e11582d6', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03499, 105.7938, '2021-04-19 07:01:39');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('f80d8f23-065a-4ec6-8b5f-1c8fe50f1d0f', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03474, 105.79462, '2021-04-19 07:01:40');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6a4b1710-e941-49b2-8555-33254b4be6be', 'ca419691-ad54-4151-9f15-ba086983200e', 21.0343, 105.796, '2021-04-19 07:06:41');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('bf3b9820-7b2c-4808-a5f1-d922b616b65c', 'ca419691-ad54-4151-9f15-ba086983200e', 21.034, 105.79696, '2021-04-19 07:06:42');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('337854e2-242f-478a-bc30-f5d39665efc8', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03388, 105.79724, '2021-04-19 07:06:43');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('6884eddd-b39f-4aa3-83e5-9e774551210b', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03378, 105.79737, '2021-04-19 07:06:44');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('4b91dca9-3a7e-4a90-93dc-e211204234f6', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03339, 105.79777, '2021-04-19 07:11:45');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d579a351-b5d8-4cd9-a631-aa3b6f6cc681', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03265, 105.79856, '2021-04-19 07:11:46');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('a239332a-7cc2-48bc-ac5f-9e7e9f2fbd65', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03182, 105.79944, '2021-04-19 07:16:47');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('d7eacc84-e0f3-4d69-b8fb-fae3dcee1271', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03108, 105.80021, '2021-04-19 07:21:48');
INSERT INTO public.waypoint (id, on_trip, latitude, longitude, "time") VALUES ('8a7623af-729c-435f-8336-53d5743e8c66', 'ca419691-ad54-4151-9f15-ba086983200e', 21.03041, 105.80095, '2021-04-19 07:21:49');


--
-- TOC entry 2887 (class 0 OID 0)
-- Dependencies: 210
-- Name: route_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.route_id_seq', 2, true);


--
-- TOC entry 2728 (class 2606 OID 16441)
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.account
    ADD CONSTRAINT account_pkey PRIMARY KEY (account_id);


--
-- TOC entry 2738 (class 2606 OID 16505)
-- Name: frequent_point frequent_point_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.frequent_point
    ADD CONSTRAINT frequent_point_pkey PRIMARY KEY (id);


--
-- TOC entry 2740 (class 2606 OID 16513)
-- Name: frequent_route frequent_route_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.frequent_route
    ADD CONSTRAINT frequent_route_pkey PRIMARY KEY (id);


--
-- TOC entry 2736 (class 2606 OID 16484)
-- Name: grid_point grid_point_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grid_point
    ADD CONSTRAINT grid_point_pkey PRIMARY KEY (id);


--
-- TOC entry 2734 (class 2606 OID 16473)
-- Name: grid_trip grid_trip_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grid_trip
    ADD CONSTRAINT grid_trip_pkey PRIMARY KEY (grid_trip_id);


--
-- TOC entry 2744 (class 2606 OID 16677)
-- Name: route route_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route
    ADD CONSTRAINT route_pkey PRIMARY KEY (id);


--
-- TOC entry 2742 (class 2606 OID 16627)
-- Name: route_point route_point_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.route_point
    ADD CONSTRAINT route_point_pkey PRIMARY KEY (id);


--
-- TOC entry 2730 (class 2606 OID 16449)
-- Name: trip trip_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trip
    ADD CONSTRAINT trip_pkey PRIMARY KEY (trip_id);


--
-- TOC entry 2732 (class 2606 OID 16465)
-- Name: waypoint waypoint_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.waypoint
    ADD CONSTRAINT waypoint_pkey PRIMARY KEY (id);


-- Completed on 2021-04-24 13:56:11

--
-- PostgreSQL database dump complete
--

