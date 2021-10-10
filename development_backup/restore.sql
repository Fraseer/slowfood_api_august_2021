--
-- NOTE:
--
-- File paths need to be edited. Search for $$PATH$$ and
-- replace it with the path to the directory containing
-- the extracted data files.
--
--
-- PostgreSQL database dump
--

-- Dumped from database version 12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.8 (Ubuntu 12.8-0ubuntu0.20.04.1)

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

DROP DATABASE slowfood_api_team_one_development;
--
-- Name: slowfood_api_team_one_development; Type: DATABASE; Schema: -; Owner: fraser
--

CREATE DATABASE slowfood_api_team_one_development WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_GB.UTF-8' LC_CTYPE = 'en_GB.UTF-8';


ALTER DATABASE slowfood_api_team_one_development OWNER TO fraser;

\connect slowfood_api_team_one_development

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
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: fraser
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO fraser;

--
-- Name: cart_products; Type: TABLE; Schema: public; Owner: fraser
--

CREATE TABLE public.cart_products (
    id bigint NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    product_id integer,
    cart_id integer
);


ALTER TABLE public.cart_products OWNER TO fraser;

--
-- Name: cart_products_id_seq; Type: SEQUENCE; Schema: public; Owner: fraser
--

CREATE SEQUENCE public.cart_products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cart_products_id_seq OWNER TO fraser;

--
-- Name: cart_products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fraser
--

ALTER SEQUENCE public.cart_products_id_seq OWNED BY public.cart_products.id;


--
-- Name: carts; Type: TABLE; Schema: public; Owner: fraser
--

CREATE TABLE public.carts (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    user_id integer
);


ALTER TABLE public.carts OWNER TO fraser;

--
-- Name: carts_id_seq; Type: SEQUENCE; Schema: public; Owner: fraser
--

CREATE SEQUENCE public.carts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.carts_id_seq OWNER TO fraser;

--
-- Name: carts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fraser
--

ALTER SEQUENCE public.carts_id_seq OWNED BY public.carts.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: fraser
--

CREATE TABLE public.products (
    id bigint NOT NULL,
    name character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    price numeric,
    description text,
    image character varying,
    category character varying
);


ALTER TABLE public.products OWNER TO fraser;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: fraser
--

CREATE SEQUENCE public.products_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO fraser;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fraser
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: fraser
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO fraser;

--
-- Name: users; Type: TABLE; Schema: public; Owner: fraser
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    provider character varying DEFAULT 'email'::character varying NOT NULL,
    uid character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    allow_password_change boolean DEFAULT false,
    remember_created_at timestamp without time zone,
    confirmation_token character varying,
    confirmed_at timestamp without time zone,
    confirmation_sent_at timestamp without time zone,
    unconfirmed_email character varying,
    email character varying,
    tokens json,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying,
    last_sign_in_ip character varying
);


ALTER TABLE public.users OWNER TO fraser;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: fraser
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO fraser;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fraser
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: cart_products id; Type: DEFAULT; Schema: public; Owner: fraser
--

ALTER TABLE ONLY public.cart_products ALTER COLUMN id SET DEFAULT nextval('public.cart_products_id_seq'::regclass);


--
-- Name: carts id; Type: DEFAULT; Schema: public; Owner: fraser
--

ALTER TABLE ONLY public.carts ALTER COLUMN id SET DEFAULT nextval('public.carts_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: fraser
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: fraser
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: fraser
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
\.
COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM '$$PATH$$/3013.dat';

--
-- Data for Name: cart_products; Type: TABLE DATA; Schema: public; Owner: fraser
--

COPY public.cart_products (id, created_at, updated_at, product_id, cart_id) FROM stdin;
\.
COPY public.cart_products (id, created_at, updated_at, product_id, cart_id) FROM '$$PATH$$/3021.dat';

--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: fraser
--

COPY public.carts (id, name, created_at, updated_at, user_id) FROM stdin;
\.
COPY public.carts (id, name, created_at, updated_at, user_id) FROM '$$PATH$$/3019.dat';

--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: fraser
--

COPY public.products (id, name, created_at, updated_at, price, description, image, category) FROM stdin;
\.
COPY public.products (id, name, created_at, updated_at, price, description, image, category) FROM '$$PATH$$/3015.dat';

--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: fraser
--

COPY public.schema_migrations (version) FROM stdin;
\.
COPY public.schema_migrations (version) FROM '$$PATH$$/3012.dat';

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: fraser
--

COPY public.users (id, provider, uid, encrypted_password, reset_password_token, reset_password_sent_at, allow_password_change, remember_created_at, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, email, tokens, created_at, updated_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip) FROM stdin;
\.
COPY public.users (id, provider, uid, encrypted_password, reset_password_token, reset_password_sent_at, allow_password_change, remember_created_at, confirmation_token, confirmed_at, confirmation_sent_at, unconfirmed_email, email, tokens, created_at, updated_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip) FROM '$$PATH$$/3017.dat';

--
-- Name: cart_products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fraser
--

SELECT pg_catalog.setval('public.cart_products_id_seq', 1, false);


--
-- Name: carts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fraser
--

SELECT pg_catalog.setval('public.carts_id_seq', 1, false);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fraser
--

SELECT pg_catalog.setval('public.products_id_seq', 1, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fraser
--

SELECT pg_catalog.setval('public.users_id_seq', 1, false);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: fraser
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: cart_products cart_products_pkey; Type: CONSTRAINT; Schema: public; Owner: fraser
--

ALTER TABLE ONLY public.cart_products
    ADD CONSTRAINT cart_products_pkey PRIMARY KEY (id);


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: fraser
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: fraser
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: fraser
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: fraser
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_confirmation_token; Type: INDEX; Schema: public; Owner: fraser
--

CREATE UNIQUE INDEX index_users_on_confirmation_token ON public.users USING btree (confirmation_token);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: fraser
--

CREATE UNIQUE INDEX index_users_on_email ON public.users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: fraser
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON public.users USING btree (reset_password_token);


--
-- Name: index_users_on_uid_and_provider; Type: INDEX; Schema: public; Owner: fraser
--

CREATE UNIQUE INDEX index_users_on_uid_and_provider ON public.users USING btree (uid, provider);


--
-- PostgreSQL database dump complete
--

