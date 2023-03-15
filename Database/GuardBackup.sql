--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.20
-- Dumped by pg_dump version 9.6.20

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
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Gender; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Gender" (
    "IdGender" integer NOT NULL,
    "Name" character varying(20) NOT NULL
);


ALTER TABLE public."Gender" OWNER TO postgres;

--
-- Name: Gender_IdGender_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Gender_IdGender_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Gender_IdGender_seq" OWNER TO postgres;

--
-- Name: Gender_IdGender_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Gender_IdGender_seq" OWNED BY public."Gender"."IdGender";


--
-- Name: Post; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Post" (
    "IdPost" integer NOT NULL,
    "Name" character varying(100) NOT NULL,
    "Salary" numeric(10,2) NOT NULL
);


ALTER TABLE public."Post" OWNER TO postgres;

--
-- Name: Post_IdPost_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Post_IdPost_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Post_IdPost_seq" OWNER TO postgres;

--
-- Name: Post_IdPost_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Post_IdPost_seq" OWNED BY public."Post"."IdPost";


--
-- Name: Staff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Staff" (
    "IdStaff" integer NOT NULL,
    "FirstName" character varying(50) NOT NULL,
    "LastName" character varying(50) NOT NULL,
    "Patronymic" character varying(50) NOT NULL,
    "IdPost" integer NOT NULL,
    "IdUser" integer,
    "IdGender" integer NOT NULL
);


ALTER TABLE public."Staff" OWNER TO postgres;

--
-- Name: Staff_IdStaff_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Staff_IdStaff_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Staff_IdStaff_seq" OWNER TO postgres;

--
-- Name: Staff_IdStaff_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Staff_IdStaff_seq" OWNED BY public."Staff"."IdStaff";


--
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    "IdUser" integer NOT NULL,
    "Login" character varying(100) NOT NULL,
    "PasswordHash" character(32) NOT NULL,
    "PasswordSalt" character(10),
    "IdUserRole" integer NOT NULL,
    "SecretWord" character varying(50)
);


ALTER TABLE public."User" OWNER TO postgres;

--
-- Name: UserRole; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UserRole" (
    "IdUserRole" integer NOT NULL,
    "Name" character varying(50) NOT NULL
);


ALTER TABLE public."UserRole" OWNER TO postgres;

--
-- Name: UserRole_IdUserRole_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."UserRole_IdUserRole_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."UserRole_IdUserRole_seq" OWNER TO postgres;

--
-- Name: UserRole_IdUserRole_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."UserRole_IdUserRole_seq" OWNED BY public."UserRole"."IdUserRole";


--
-- Name: User_IdUser_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."User_IdUser_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."User_IdUser_seq" OWNER TO postgres;

--
-- Name: User_IdUser_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."User_IdUser_seq" OWNED BY public."User"."IdUser";


--
-- Name: Gender IdGender; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Gender" ALTER COLUMN "IdGender" SET DEFAULT nextval('public."Gender_IdGender_seq"'::regclass);


--
-- Name: Post IdPost; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Post" ALTER COLUMN "IdPost" SET DEFAULT nextval('public."Post_IdPost_seq"'::regclass);


--
-- Name: Staff IdStaff; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Staff" ALTER COLUMN "IdStaff" SET DEFAULT nextval('public."Staff_IdStaff_seq"'::regclass);


--
-- Name: User IdUser; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User" ALTER COLUMN "IdUser" SET DEFAULT nextval('public."User_IdUser_seq"'::regclass);


--
-- Name: UserRole IdUserRole; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserRole" ALTER COLUMN "IdUserRole" SET DEFAULT nextval('public."UserRole_IdUserRole_seq"'::regclass);


--
-- Data for Name: Gender; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Gender" ("IdGender", "Name") FROM stdin;
1	М
2	Ж
\.


--
-- Name: Gender_IdGender_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Gender_IdGender_seq"', 1, false);


--
-- Data for Name: Post; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Post" ("IdPost", "Name", "Salary") FROM stdin;
1	Администратор доступа	10000.00
2	Специалист по ИБ	15000.00
3	Руководитель отдела	30000.00
4	Контролёр ГОЗ	20000.00
\.


--
-- Name: Post_IdPost_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Post_IdPost_seq"', 1, false);


--
-- Data for Name: Staff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Staff" ("IdStaff", "FirstName", "LastName", "Patronymic", "IdPost", "IdUser", "IdGender") FROM stdin;
1	Агрипина	Уварова	Валентиновна	1	1	2
2	Юрин	Горбунов	Валерианович	2	2	1
3	Климент	Федотов	Васильевич	3	3	1
4	Жанна	Бобылева	Петровна	4	4	2
5	Семен	Русаков	Леонтьевич	3	5	1
6	Юстина	Гусева	Антоновна	4	6	2
\.


--
-- Name: Staff_IdStaff_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Staff_IdStaff_seq"', 1, false);


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" ("IdUser", "Login", "PasswordHash", "PasswordSalt", "IdUserRole", "SecretWord") FROM stdin;
1	Agripina17	obdxbosmqa                      	\N	1	Сова
2	YUrin68	hibljzslmv                      	\N	2	Спутник
3	Kliment119	lpghliewgw                      	\N	3	Фобос
4	Zhanna95	ultxzjtryl                      	\N	4	Краска
5	Semen150	ltlyheruzc                      	\N	3	Стекло
6	YUstina138	drfocfsdjm                      	\N	4	Буря
\.


--
-- Data for Name: UserRole; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UserRole" ("IdUserRole", "Name") FROM stdin;
1	Администратор доступа
2	Служба ИБ
3	Руководитель ПОП
4	Контролёр МО
\.


--
-- Name: UserRole_IdUserRole_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."UserRole_IdUserRole_seq"', 1, false);


--
-- Name: User_IdUser_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."User_IdUser_seq"', 1, false);


--
-- Name: Gender Gender_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Gender"
    ADD CONSTRAINT "Gender_pkey" PRIMARY KEY ("IdGender");


--
-- Name: Post Post_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Post"
    ADD CONSTRAINT "Post_pkey" PRIMARY KEY ("IdPost");


--
-- Name: Staff Staff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Staff"
    ADD CONSTRAINT "Staff_pkey" PRIMARY KEY ("IdStaff");


--
-- Name: UserRole UserRole_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UserRole"
    ADD CONSTRAINT "UserRole_pkey" PRIMARY KEY ("IdUserRole");


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY ("IdUser");


--
-- Name: Staff Staff_IdPost_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Staff"
    ADD CONSTRAINT "Staff_IdPost_fkey" FOREIGN KEY ("IdPost") REFERENCES public."Post"("IdPost");


--
-- Name: Staff Staff_IdUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Staff"
    ADD CONSTRAINT "Staff_IdUser_fkey" FOREIGN KEY ("IdUser") REFERENCES public."User"("IdUser");


--
-- Name: User User_IdUserRole_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_IdUserRole_fkey" FOREIGN KEY ("IdUserRole") REFERENCES public."UserRole"("IdUserRole");


--
-- Name: Staff staff_gender_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Staff"
    ADD CONSTRAINT staff_gender_fk FOREIGN KEY ("IdGender") REFERENCES public."Gender"("IdGender");


--
-- PostgreSQL database dump complete
--

