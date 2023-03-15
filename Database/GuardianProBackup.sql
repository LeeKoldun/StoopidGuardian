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
-- Name: Group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Group" (
    "IdGroup" integer NOT NULL,
    "IdSubdivision" integer NOT NULL,
    "IdSubdivStaff" integer NOT NULL
);


ALTER TABLE public."Group" OWNER TO postgres;

--
-- Name: GroupVisitor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."GroupVisitor" (
    "IdGroupVisitor" integer NOT NULL,
    "IdGroup" integer NOT NULL,
    "IdVisitor" integer NOT NULL
);


ALTER TABLE public."GroupVisitor" OWNER TO postgres;

--
-- Name: GroupVisitor_IdGroupVisitor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."GroupVisitor_IdGroupVisitor_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."GroupVisitor_IdGroupVisitor_seq" OWNER TO postgres;

--
-- Name: GroupVisitor_IdGroupVisitor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."GroupVisitor_IdGroupVisitor_seq" OWNED BY public."GroupVisitor"."IdGroupVisitor";


--
-- Name: Group_IdGroup_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Group_IdGroup_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Group_IdGroup_seq" OWNER TO postgres;

--
-- Name: Group_IdGroup_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Group_IdGroup_seq" OWNED BY public."Group"."IdGroup";


--
-- Name: Request; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Request" (
    "IdRequest" integer NOT NULL,
    "IdRequestStatus" integer NOT NULL,
    "IdUser" integer NOT NULL,
    "IsPersonal" boolean NOT NULL,
    "DateFrom" date NOT NULL,
    "DateTo" date NOT NULL,
    "IdVisitType" integer NOT NULL,
    "IdSubdivision" integer NOT NULL
);


ALTER TABLE public."Request" OWNER TO postgres;

--
-- Name: RequestStatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RequestStatus" (
    "IdRequestStatus" integer NOT NULL,
    "StatusName" character varying(100) NOT NULL
);


ALTER TABLE public."RequestStatus" OWNER TO postgres;

--
-- Name: RequestStatus_IdRequestStatus_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."RequestStatus_IdRequestStatus_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."RequestStatus_IdRequestStatus_seq" OWNER TO postgres;

--
-- Name: RequestStatus_IdRequestStatus_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."RequestStatus_IdRequestStatus_seq" OWNED BY public."RequestStatus"."IdRequestStatus";


--
-- Name: Request_IdRequest_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Request_IdRequest_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Request_IdRequest_seq" OWNER TO postgres;

--
-- Name: Request_IdRequest_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Request_IdRequest_seq" OWNED BY public."Request"."IdRequest";


--
-- Name: Role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Role" (
    "IdRole" integer NOT NULL,
    "Name" character varying(50) NOT NULL
);


ALTER TABLE public."Role" OWNER TO postgres;

--
-- Name: Role_IdRole_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Role_IdRole_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Role_IdRole_seq" OWNER TO postgres;

--
-- Name: Role_IdRole_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Role_IdRole_seq" OWNED BY public."Role"."IdRole";


--
-- Name: SubdivStaff; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SubdivStaff" (
    "IdSubdivStaff" integer NOT NULL,
    "FirstName" character varying(50) NOT NULL,
    "LastName" character varying(50) NOT NULL,
    "Patronymic" character varying(50),
    "IdSubdivision" integer NOT NULL,
    "IdUser" integer
);


ALTER TABLE public."SubdivStaff" OWNER TO postgres;

--
-- Name: SubdivStaff_IdSubdivStaff_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."SubdivStaff_IdSubdivStaff_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."SubdivStaff_IdSubdivStaff_seq" OWNER TO postgres;

--
-- Name: SubdivStaff_IdSubdivStaff_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."SubdivStaff_IdSubdivStaff_seq" OWNED BY public."SubdivStaff"."IdSubdivStaff";


--
-- Name: Subdivision; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Subdivision" (
    "IdSubdivision" integer NOT NULL,
    "Name" character varying(100) NOT NULL
);


ALTER TABLE public."Subdivision" OWNER TO postgres;

--
-- Name: Subdivision_IdSubdivision_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Subdivision_IdSubdivision_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Subdivision_IdSubdivision_seq" OWNER TO postgres;

--
-- Name: Subdivision_IdSubdivision_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Subdivision_IdSubdivision_seq" OWNED BY public."Subdivision"."IdSubdivision";


--
-- Name: User; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."User" (
    "IdUser" integer NOT NULL,
    "Login" character varying(100) NOT NULL,
    "PasswordHash" character(32) NOT NULL,
    "PasswodSalt" character(10) NOT NULL,
    "IdRole" integer NOT NULL
);


ALTER TABLE public."User" OWNER TO postgres;

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
-- Name: VisitType; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."VisitType" (
    "IdVisitType" integer NOT NULL,
    "TypeName" character varying(100) NOT NULL
);


ALTER TABLE public."VisitType" OWNER TO postgres;

--
-- Name: VisitType_IdVisitType_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."VisitType_IdVisitType_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."VisitType_IdVisitType_seq" OWNER TO postgres;

--
-- Name: VisitType_IdVisitType_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."VisitType_IdVisitType_seq" OWNED BY public."VisitType"."IdVisitType";


--
-- Name: Visitor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Visitor" (
    "IdVisitor" integer NOT NULL,
    "FirstName" character varying(50) NOT NULL,
    "LastName" character varying(50) NOT NULL,
    "Patronymic" character varying(50),
    "Phone" character(18),
    "Email" character varying(100) NOT NULL,
    "OrganizationName" character varying(50),
    "Note" character varying(200) NOT NULL,
    "BirthDate" date NOT NULL,
    "PassportSeries" character(4) NOT NULL,
    "PassportNumber" character(6) NOT NULL,
    "Photo" bytea,
    "IdUser" integer,
    CONSTRAINT "Visitor_BirthDate_check" CHECK ((date_part('year'::text, age(("BirthDate")::timestamp with time zone)) >= (16)::double precision))
);


ALTER TABLE public."Visitor" OWNER TO postgres;

--
-- Name: Visitor_IdVisitor_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Visitor_IdVisitor_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Visitor_IdVisitor_seq" OWNER TO postgres;

--
-- Name: Visitor_IdVisitor_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Visitor_IdVisitor_seq" OWNED BY public."Visitor"."IdVisitor";


--
-- Name: Group IdGroup; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Group" ALTER COLUMN "IdGroup" SET DEFAULT nextval('public."Group_IdGroup_seq"'::regclass);


--
-- Name: GroupVisitor IdGroupVisitor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GroupVisitor" ALTER COLUMN "IdGroupVisitor" SET DEFAULT nextval('public."GroupVisitor_IdGroupVisitor_seq"'::regclass);


--
-- Name: Request IdRequest; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Request" ALTER COLUMN "IdRequest" SET DEFAULT nextval('public."Request_IdRequest_seq"'::regclass);


--
-- Name: RequestStatus IdRequestStatus; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestStatus" ALTER COLUMN "IdRequestStatus" SET DEFAULT nextval('public."RequestStatus_IdRequestStatus_seq"'::regclass);


--
-- Name: Role IdRole; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Role" ALTER COLUMN "IdRole" SET DEFAULT nextval('public."Role_IdRole_seq"'::regclass);


--
-- Name: SubdivStaff IdSubdivStaff; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SubdivStaff" ALTER COLUMN "IdSubdivStaff" SET DEFAULT nextval('public."SubdivStaff_IdSubdivStaff_seq"'::regclass);


--
-- Name: Subdivision IdSubdivision; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Subdivision" ALTER COLUMN "IdSubdivision" SET DEFAULT nextval('public."Subdivision_IdSubdivision_seq"'::regclass);


--
-- Name: User IdUser; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User" ALTER COLUMN "IdUser" SET DEFAULT nextval('public."User_IdUser_seq"'::regclass);


--
-- Name: VisitType IdVisitType; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."VisitType" ALTER COLUMN "IdVisitType" SET DEFAULT nextval('public."VisitType_IdVisitType_seq"'::regclass);


--
-- Name: Visitor IdVisitor; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Visitor" ALTER COLUMN "IdVisitor" SET DEFAULT nextval('public."Visitor_IdVisitor_seq"'::regclass);


--
-- Data for Name: Group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Group" ("IdGroup", "IdSubdivision", "IdSubdivStaff") FROM stdin;
\.


--
-- Data for Name: GroupVisitor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."GroupVisitor" ("IdGroupVisitor", "IdGroup", "IdVisitor") FROM stdin;
\.


--
-- Name: GroupVisitor_IdGroupVisitor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."GroupVisitor_IdGroupVisitor_seq"', 1, false);


--
-- Name: Group_IdGroup_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Group_IdGroup_seq"', 1, false);


--
-- Data for Name: Request; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Request" ("IdRequest", "IdRequestStatus", "IdUser", "IsPersonal", "DateFrom", "DateTo", "IdVisitType", "IdSubdivision") FROM stdin;
\.


--
-- Data for Name: RequestStatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RequestStatus" ("IdRequestStatus", "StatusName") FROM stdin;
1	На проверке
2	Одобрено
3	Не одобрено
\.


--
-- Name: RequestStatus_IdRequestStatus_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."RequestStatus_IdRequestStatus_seq"', 1, false);


--
-- Name: Request_IdRequest_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Request_IdRequest_seq"', 1, false);


--
-- Data for Name: Role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Role" ("IdRole", "Name") FROM stdin;
1	Staff
2	Visitor
3	Admin
\.


--
-- Name: Role_IdRole_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Role_IdRole_seq"', 1, false);


--
-- Data for Name: SubdivStaff; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SubdivStaff" ("IdSubdivStaff", "FirstName", "LastName", "Patronymic", "IdSubdivision", "IdUser") FROM stdin;
9367788	Авдотья	Фомичева	Трофимовна	1	\N
9788737	Римма	Гаврилова	Ефимовна	2	\N
9736379	Наталия	Носкова	Прохоровна	3	\N
9362832	Тимофей	Архипов	Васильевич	4	\N
9737848	Вероника	Орехова	Артемовна	5	\N
9768239	Павел	Савельев	Степанович	6	\N
9404040	Всеволод	Чернов	Наумович	7	\N
\.


--
-- Name: SubdivStaff_IdSubdivStaff_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."SubdivStaff_IdSubdivStaff_seq"', 1, false);


--
-- Data for Name: Subdivision; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Subdivision" ("IdSubdivision", "Name") FROM stdin;
1	Производство
2	Сбыт
3	Администрация
4	Служба безопасности
5	Планирование
6	Общий отдел
7	Охрана
\.


--
-- Name: Subdivision_IdSubdivision_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Subdivision_IdSubdivision_seq"', 1, false);


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."User" ("IdUser", "Login", "PasswordHash", "PasswodSalt", "IdRole") FROM stdin;
\.


--
-- Name: User_IdUser_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."User_IdUser_seq"', 1, false);


--
-- Data for Name: VisitType; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."VisitType" ("IdVisitType", "TypeName") FROM stdin;
1	По приколу
2	Нужно
3	По приказу
\.


--
-- Name: VisitType_IdVisitType_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."VisitType_IdVisitType_seq"', 1, false);


--
-- Data for Name: Visitor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Visitor" ("IdVisitor", "FirstName", "LastName", "Patronymic", "Phone", "Email", "OrganizationName", "Note", "BirthDate", "PassportSeries", "PassportNumber", "Photo", "IdUser") FROM stdin;
\.


--
-- Name: Visitor_IdVisitor_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Visitor_IdVisitor_seq"', 1, false);


--
-- Name: GroupVisitor GroupVisitor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GroupVisitor"
    ADD CONSTRAINT "GroupVisitor_pkey" PRIMARY KEY ("IdGroupVisitor");


--
-- Name: Group Group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Group"
    ADD CONSTRAINT "Group_pkey" PRIMARY KEY ("IdGroup");


--
-- Name: RequestStatus RequestStatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RequestStatus"
    ADD CONSTRAINT "RequestStatus_pkey" PRIMARY KEY ("IdRequestStatus");


--
-- Name: Request Request_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Request"
    ADD CONSTRAINT "Request_pkey" PRIMARY KEY ("IdRequest");


--
-- Name: Role Role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Role"
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY ("IdRole");


--
-- Name: SubdivStaff SubdivStaff_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SubdivStaff"
    ADD CONSTRAINT "SubdivStaff_pkey" PRIMARY KEY ("IdSubdivStaff");


--
-- Name: Subdivision Subdivision_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Subdivision"
    ADD CONSTRAINT "Subdivision_pkey" PRIMARY KEY ("IdSubdivision");


--
-- Name: User User_Login_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_Login_key" UNIQUE ("Login");


--
-- Name: User User_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY ("IdUser");


--
-- Name: VisitType VisitType_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."VisitType"
    ADD CONSTRAINT "VisitType_pkey" PRIMARY KEY ("IdVisitType");


--
-- Name: Visitor Visitor_Email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Visitor"
    ADD CONSTRAINT "Visitor_Email_key" UNIQUE ("Email");


--
-- Name: Visitor Visitor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Visitor"
    ADD CONSTRAINT "Visitor_pkey" PRIMARY KEY ("IdVisitor");


--
-- Name: GroupVisitor GroupVisitor_IdGroup_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GroupVisitor"
    ADD CONSTRAINT "GroupVisitor_IdGroup_fkey" FOREIGN KEY ("IdGroup") REFERENCES public."Group"("IdGroup");


--
-- Name: GroupVisitor GroupVisitor_IdVisitor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."GroupVisitor"
    ADD CONSTRAINT "GroupVisitor_IdVisitor_fkey" FOREIGN KEY ("IdVisitor") REFERENCES public."Visitor"("IdVisitor");


--
-- Name: Request Request_IdRequestStatus_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Request"
    ADD CONSTRAINT "Request_IdRequestStatus_fkey" FOREIGN KEY ("IdRequestStatus") REFERENCES public."RequestStatus"("IdRequestStatus");


--
-- Name: Request Request_IdSubdivision_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Request"
    ADD CONSTRAINT "Request_IdSubdivision_fkey" FOREIGN KEY ("IdSubdivision") REFERENCES public."Subdivision"("IdSubdivision");


--
-- Name: Request Request_IdUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Request"
    ADD CONSTRAINT "Request_IdUser_fkey" FOREIGN KEY ("IdUser") REFERENCES public."User"("IdUser");


--
-- Name: Request Request_IdVisitType_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Request"
    ADD CONSTRAINT "Request_IdVisitType_fkey" FOREIGN KEY ("IdVisitType") REFERENCES public."VisitType"("IdVisitType");


--
-- Name: SubdivStaff SubdivStaff_IdSubdivision_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SubdivStaff"
    ADD CONSTRAINT "SubdivStaff_IdSubdivision_fkey" FOREIGN KEY ("IdSubdivision") REFERENCES public."Subdivision"("IdSubdivision");


--
-- Name: SubdivStaff SubdivStaff_IdUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SubdivStaff"
    ADD CONSTRAINT "SubdivStaff_IdUser_fkey" FOREIGN KEY ("IdUser") REFERENCES public."User"("IdUser");


--
-- Name: User User_IdRole_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."User"
    ADD CONSTRAINT "User_IdRole_fkey" FOREIGN KEY ("IdRole") REFERENCES public."Role"("IdRole");


--
-- Name: Visitor Visitor_IdUser_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Visitor"
    ADD CONSTRAINT "Visitor_IdUser_fkey" FOREIGN KEY ("IdUser") REFERENCES public."User"("IdUser");


--
-- PostgreSQL database dump complete
--

