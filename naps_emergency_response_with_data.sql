--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.10
-- Dumped by pg_dump version 9.6.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
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


--
-- Name: status; Type: TYPE; Schema: public; Owner: naps
--

CREATE TYPE public.status AS ENUM (
    'Requested',
    'Assigned',
    'Pickedup',
    'Cancelled',
    'Rescued'
);


ALTER TYPE public.status OWNER TO naps;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: incident; Type: TABLE; Schema: public; Owner: naps
--

CREATE TABLE public.incident (
    incident_id integer NOT NULL,
    report_id integer,
    gps_lat double precision,
    gps_long double precision,
    number_of_people integer,
    medical_need boolean,
    report_time timestamp without time zone
);


ALTER TABLE public.incident OWNER TO naps;

--
-- Name: incident_sequence; Type: SEQUENCE; Schema: public; Owner: naps
--

CREATE SEQUENCE public.incident_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.incident_sequence OWNER TO naps;

--
-- Name: incident_sequence; Type: SEQUENCE OWNED BY; Schema: public; Owner: naps
--

ALTER SEQUENCE public.incident_sequence OWNED BY public.incident.incident_id;


--
-- Name: mission; Type: TABLE; Schema: public; Owner: naps
--

CREATE TABLE public.mission (
    mission_id integer NOT NULL,
    responder_id integer,
    last_update date,
    current_status public.status,
    incident_id integer
);


ALTER TABLE public.mission OWNER TO naps;

--
-- Name: mission_sequence; Type: SEQUENCE; Schema: public; Owner: naps
--

CREATE SEQUENCE public.mission_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.mission_sequence OWNER TO naps;

--
-- Name: mission_sequence; Type: SEQUENCE OWNED BY; Schema: public; Owner: naps
--

ALTER SEQUENCE public.mission_sequence OWNED BY public.mission.mission_id;

--
-- Name: reported_incident; Type: TABLE; Schema: public; Owner: naps
--

CREATE TABLE public.reported_incident (
    id bigint NOT NULL,
    incident_id character varying(255),
    latitude character varying(255),
    longitude character varying(255),
    medical_needed boolean,
    number_of_people integer,
    incident_status character varying(255),
    victim_name character varying(255),
    victim_phone character varying(255),
    reported_time timestamp(3) without time zone
);


ALTER TABLE public.reported_incident OWNER TO naps;

--
-- Name: reported_incident_seq; Type: SEQUENCE; Schema: public; Owner: naps
--

CREATE SEQUENCE public.reported_incident_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reported_incident_seq OWNER TO naps;

--
-- Name: reporter; Type: TABLE; Schema: public; Owner: naps
--

CREATE TABLE public.reporter (
    reporter_id integer NOT NULL,
    reporter_name text,
    reporter_phone_number text
);


ALTER TABLE public.reporter OWNER TO naps;

--
-- Name: reporter_sequence; Type: SEQUENCE; Schema: public; Owner: naps
--

CREATE SEQUENCE public.reporter_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reporter_sequence OWNER TO naps;

--
-- Name: reporter_sequence; Type: SEQUENCE OWNED BY; Schema: public; Owner: naps
--

ALTER SEQUENCE public.reporter_sequence OWNED BY public.reporter.reporter_id;


--
-- Name: responder; Type: TABLE; Schema: public; Owner: naps
--

CREATE TABLE public.responder (
    responder_id bigint NOT NULL,
    responder_name text,
    responder_phone_number text,
    responder_current_gps_lat numeric(7,5),
    responder_current_gps_long numeric(7,5),
    boat_capacity integer,
    has_medical_kit boolean,
    available boolean DEFAULT true,
    version bigint DEFAULT 0
);


ALTER TABLE public.responder OWNER TO naps;

--
-- Name: responder_sequence; Type: SEQUENCE; Schema: public; Owner: naps
--

CREATE SEQUENCE public.responder_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.responder_sequence OWNER TO naps;

--
-- Name: responder_sequence; Type: SEQUENCE OWNED BY; Schema: public; Owner: naps
--

ALTER SEQUENCE public.responder_sequence OWNED BY public.responder.responder_id;


--
-- Name: incident incident_id; Type: DEFAULT; Schema: public; Owner: naps
--

ALTER TABLE ONLY public.incident ALTER COLUMN incident_id SET DEFAULT nextval('public.incident_sequence'::regclass);


--
-- Name: mission mission_id; Type: DEFAULT; Schema: public; Owner: naps
--

ALTER TABLE ONLY public.mission ALTER COLUMN mission_id SET DEFAULT nextval('public.mission_sequence'::regclass);


--
-- Name: reporter reporter_id; Type: DEFAULT; Schema: public; Owner: naps
--

ALTER TABLE ONLY public.reporter ALTER COLUMN reporter_id SET DEFAULT nextval('public.reporter_sequence'::regclass);


--
-- Name: responder responder_id; Type: DEFAULT; Schema: public; Owner: naps
--

ALTER TABLE ONLY public.responder ALTER COLUMN responder_id SET DEFAULT nextval('public.responder_sequence'::regclass);


--
-- Data for Name: incident; Type: TABLE DATA; Schema: public; Owner: naps
--

COPY public.incident (incident_id, report_id, gps_lat, gps_long, number_of_people, medical_need, report_time) FROM stdin;
1	1	34.1687700000000021	-77.8704500000000053	4	f	2019-01-09 21:40:09.131657
2	2	34.1832300000000018	-77.840990000000005	7	t	2019-01-09 21:40:09.131657
3	3	34.236699999999999	-77.8347899999999981	4	f	2019-01-09 21:40:09.131657
4	4	34.1433800000000005	-77.8827399999999983	10	t	2019-01-09 21:40:09.131657
5	5	34.2925600000000017	-77.8656900000000007	12	f	2019-01-09 21:40:09.131657
6	6	34.1267899999999997	-77.8735300000000024	2	t	2019-01-09 21:40:09.131657
7	7	34.2951499999999996	-77.814629999999994	2	f	2019-01-09 21:40:09.131657
8	8	34.2910299999999992	-77.8660100000000028	1	t	2019-01-09 21:40:09.131657
9	9	34.2454400000000021	-77.8350800000000049	2	f	2019-01-09 21:40:09.131657
10	10	34.1514000000000024	-77.8911499999999961	4	t	2019-01-09 21:40:09.131657
11	11	34.1211199999999977	-77.94435	5	f	2019-01-09 21:40:09.131657
12	12	34.1257900000000021	-77.8956199999999939	6	t	2019-01-09 21:40:09.131657
13	13	34.2684500000000014	-77.8453399999999931	12	f	2019-01-09 21:40:09.131657
14	14	34.247320000000002	-77.8275699999999944	6	t	2019-01-09 21:40:09.131657
15	15	34.1559299999999979	-77.8855899999999934	10	f	2019-01-09 21:40:09.131657
16	16	34.2513700000000014	-77.821629999999999	8	t	2019-01-09 21:40:09.131657
17	17	34.2851500000000016	-77.8111300000000057	12	f	2019-01-09 21:40:09.131657
18	18	34.2254300000000029	-77.8974400000000031	3	t	2019-01-09 21:40:09.131657
19	19	34.2148499999999984	-77.8882399999999961	11	f	2019-01-09 21:40:09.131657
20	20	34.1753700000000009	-77.8329700000000031	4	t	2019-01-09 21:40:09.131657
21	21	34.2375499999999988	-77.8402499999999975	4	f	2019-01-09 21:40:09.131657
22	22	34.1806199999999976	-77.8281300000000016	8	t	2019-01-09 21:40:09.131657
23	23	34.282350000000001	-77.8315000000000055	11	f	2019-01-09 21:40:09.131657
24	24	34.1336200000000005	-77.8709599999999966	3	t	2019-01-09 21:40:09.131657
25	25	34.2285200000000032	-77.8880500000000069	3	f	2019-01-09 21:40:09.131657
26	26	34.1683799999999991	-77.8866299999999967	2	t	2019-01-09 21:40:09.131657
27	27	34.1316699999999997	-77.8783700000000039	5	f	2019-01-09 21:40:09.131657
28	28	34.138069999999999	-77.8580199999999962	12	t	2019-01-09 21:40:09.131657
29	29	34.2133299999999991	-77.858949999999993	8	f	2019-01-09 21:40:09.131657
30	30	34.224499999999999	-77.8371300000000019	5	t	2019-01-09 21:40:09.131657
31	31	34.2935700000000026	-77.8858100000000064	7	f	2019-01-09 21:40:09.131657
32	32	34.2732000000000028	-77.8890399999999943	3	t	2019-01-09 21:40:09.131657
33	33	34.214100000000002	-77.8239300000000043	9	f	2019-01-09 21:40:09.131657
34	34	34.2542400000000029	-77.8239399999999932	6	t	2019-01-09 21:40:09.131657
35	35	34.1326999999999998	-77.8792100000000005	4	f	2019-01-09 21:40:09.131657
36	36	34.1934400000000025	-77.8843399999999946	2	t	2019-01-09 21:40:09.131657
37	37	34.1851800000000026	-77.85839	7	f	2019-01-09 21:40:09.131657
38	38	34.2127300000000005	-77.8557200000000051	12	t	2019-01-09 21:40:09.131657
39	39	34.1879500000000007	-77.8535499999999985	5	f	2019-01-09 21:40:09.131657
40	40	34.1115599999999972	-77.8799000000000063	8	t	2019-01-09 21:40:09.131657
41	41	34.288649999999997	-77.8950899999999962	2	f	2019-01-09 21:40:09.131657
42	42	34.2184999999999988	-77.8574200000000047	7	t	2019-01-09 21:40:09.131657
43	43	34.2859199999999973	-77.8421699999999959	1	f	2019-01-09 21:40:09.131657
44	44	34.2991200000000021	-77.8396199999999965	7	t	2019-01-09 21:40:09.131657
45	45	34.2608499999999978	-77.8575400000000002	4	f	2019-01-09 21:40:09.131657
46	46	34.2563699999999969	-77.8658300000000025	1	t	2019-01-09 21:40:09.131657
47	47	34.2378100000000032	-77.8231300000000061	1	f	2019-01-09 21:40:09.131657
48	48	34.2418400000000034	-77.8269700000000029	3	t	2019-01-09 21:40:09.131657
49	49	34.2166700000000006	-77.8409000000000049	10	f	2019-01-09 21:40:09.131657
50	50	34.2604499999999987	-77.8939400000000006	6	t	2019-01-09 21:40:09.131657
51	51	34.2733100000000022	-77.8381100000000004	6	f	2019-01-09 21:40:09.131657
52	52	34.1902899999999974	-77.8210600000000028	4	t	2019-01-09 21:40:09.131657
53	53	34.2752499999999998	-77.8159500000000008	5	f	2019-01-09 21:40:09.131657
54	54	34.2777200000000022	-77.8354999999999961	1	t	2019-01-09 21:40:09.131657
55	55	34.2501900000000035	-77.8718199999999996	5	f	2019-01-09 21:40:09.131657
56	56	34.1170699999999982	-77.9498999999999995	3	t	2019-01-09 21:40:09.131657
57	57	34.2631500000000031	-77.8592900000000014	8	f	2019-01-09 21:40:09.131657
58	58	34.1324899999999971	-77.8640699999999981	5	t	2019-01-09 21:40:09.131657
59	59	34.2306900000000027	-77.8250799999999998	10	f	2019-01-09 21:40:09.131657
60	60	34.2832500000000024	-77.890500000000003	2	t	2019-01-09 21:40:09.131657
61	61	34.2596300000000014	-77.8728899999999982	7	f	2019-01-09 21:40:09.131657
62	62	34.1351599999999991	-77.8980700000000041	11	t	2019-01-09 21:40:09.131657
63	63	34.2647400000000033	-77.8197600000000023	3	f	2019-01-09 21:40:09.131657
64	64	34.2350700000000003	-77.8114499999999936	3	t	2019-01-09 21:40:09.131657
65	65	34.2226700000000008	-77.8182199999999966	10	f	2019-01-09 21:40:09.131657
66	66	34.2808500000000009	-77.8702799999999939	12	t	2019-01-09 21:40:09.131657
67	67	34.1572299999999984	-77.8883900000000011	1	f	2019-01-09 21:40:09.131657
68	68	34.2705899999999986	-77.8901500000000055	9	t	2019-01-09 21:40:09.131657
69	69	34.271880000000003	-77.8325499999999977	11	f	2019-01-09 21:40:09.131657
70	70	34.2688399999999973	-77.8733799999999974	6	t	2019-01-09 21:40:09.131657
71	71	34.2727399999999989	-77.8578200000000038	2	f	2019-01-09 21:40:09.131657
72	72	34.1471299999999971	-77.8806100000000043	6	t	2019-01-09 21:40:09.131657
73	73	34.26952	-77.8603200000000015	2	f	2019-01-09 21:40:09.131657
74	74	34.1776699999999991	-77.8547599999999989	5	t	2019-01-09 21:40:09.131657
75	75	34.2824099999999987	-77.8747500000000059	8	f	2019-01-09 21:40:09.131657
76	76	34.2296800000000019	-77.8861200000000053	11	t	2019-01-09 21:40:09.131657
77	77	34.2286900000000003	-77.8379500000000064	8	f	2019-01-09 21:40:09.131657
78	78	34.1473799999999983	-77.8450299999999942	4	t	2019-01-09 21:40:09.131657
79	79	34.1490000000000009	-77.9164200000000022	5	f	2019-01-09 21:40:09.131657
80	80	34.2796200000000013	-77.8503800000000012	12	t	2019-01-09 21:40:09.131657
81	81	34.1842600000000019	-77.837050000000005	3	f	2019-01-09 21:40:09.131657
82	82	34.2955600000000018	-77.8730999999999938	5	t	2019-01-09 21:40:09.131657
83	83	34.2376300000000029	-77.8917000000000002	7	f	2019-01-09 21:40:09.131657
84	84	34.2429300000000012	-77.8994200000000063	12	t	2019-01-09 21:40:09.131657
85	85	34.2524799999999985	-77.8239700000000028	2	f	2019-01-09 21:40:09.131657
86	86	34.2997200000000007	-77.8151500000000027	5	t	2019-01-09 21:40:09.131657
87	87	34.1434300000000022	-77.8699399999999997	2	f	2019-01-09 21:40:09.131657
88	88	34.2198800000000034	-77.8559099999999944	2	t	2019-01-09 21:40:09.131657
89	89	34.2817099999999968	-77.8650200000000012	4	f	2019-01-09 21:40:09.131657
90	90	34.245199999999997	-77.8798699999999968	4	t	2019-01-09 21:40:09.131657
91	91	34.2344599999999986	-77.8987599999999958	12	f	2019-01-09 21:40:09.131657
92	92	34.2917399999999972	-77.8519799999999975	5	t	2019-01-09 21:40:09.131657
93	93	34.2304699999999968	-77.8912700000000058	11	f	2019-01-09 21:40:09.131657
94	94	34.2672600000000003	-77.8148900000000054	12	t	2019-01-09 21:40:09.131657
95	95	34.2717699999999965	-77.8105199999999968	4	f	2019-01-09 21:40:09.131657
96	96	34.2148099999999999	-77.8816099999999949	5	t	2019-01-09 21:40:09.131657
97	97	34.23536	-77.8642200000000031	8	f	2019-01-09 21:40:09.131657
98	98	34.2588099999999969	-77.8526200000000017	4	t	2019-01-09 21:40:09.131657
99	99	34.1304599999999994	-77.8659099999999995	4	f	2019-01-09 21:40:09.131657
100	100	34.2871299999999977	-77.938280000000006	10	t	2019-01-09 21:40:09.131657
101	101	34.284950000000002	-77.9920000000000044	2	f	2019-01-09 21:40:09.131657
102	102	34.2907900000000012	-77.9548400000000044	2	t	2019-01-09 21:40:09.131657
103	103	34.2151700000000005	-77.9107300000000009	4	f	2019-01-09 21:40:09.131657
104	104	34.159320000000001	-77.9431399999999996	7	t	2019-01-09 21:40:09.131657
105	105	34.2483900000000006	-77.9986300000000057	7	f	2019-01-09 21:40:09.131657
106	106	34.2716100000000026	-77.9543900000000036	2	t	2019-01-09 21:40:09.131657
107	107	34.2110500000000002	-77.9321800000000025	2	f	2019-01-09 21:40:09.131657
108	108	34.1234699999999975	-77.9436199999999957	6	t	2019-01-09 21:40:09.131657
109	109	34.2860999999999976	-77.9164399999999944	11	f	2019-01-09 21:40:09.131657
110	110	34.2750399999999971	-77.9345500000000015	9	t	2019-01-09 21:40:09.131657
111	111	34.1689599999999984	-77.9307400000000001	11	f	2019-01-09 21:40:09.131657
112	112	34.2645499999999998	-77.9588700000000046	10	t	2019-01-09 21:40:09.131657
113	113	34.2187899999999985	-77.9740000000000038	1	f	2019-01-09 21:40:09.131657
114	114	34.2556000000000012	-77.9670500000000004	6	t	2019-01-09 21:40:09.131657
115	115	34.2510199999999969	-77.9763399999999933	7	f	2019-01-09 21:40:09.131657
116	116	34.2261400000000009	-77.9717500000000001	4	t	2019-01-09 21:40:09.131657
117	117	34.1174600000000012	-77.9152100000000019	10	f	2019-01-09 21:40:09.131657
118	118	34.280149999999999	-77.9850699999999932	10	t	2019-01-09 21:40:09.131657
119	119	34.1987799999999993	-77.9163800000000037	2	f	2019-01-09 21:40:09.131657
120	120	34.2599900000000019	-77.9763300000000044	9	t	2019-01-09 21:40:09.131657
121	121	34.1455699999999993	-77.9519999999999982	4	f	2019-01-09 21:40:09.131657
122	122	34.1340199999999996	-77.9313499999999948	8	t	2019-01-09 21:40:09.131657
123	123	34.2477500000000035	-77.9207499999999982	10	f	2019-01-09 21:40:09.131657
124	124	34.1457699999999988	-77.9307299999999969	6	t	2019-01-09 21:40:09.131657
125	125	34.1652699999999996	-77.9223199999999991	4	f	2019-01-09 21:40:09.131657
126	126	34.2180699999999973	-77.9579599999999999	3	t	2019-01-09 21:40:09.131657
127	127	34.2879900000000006	-77.9149699999999967	10	f	2019-01-09 21:40:09.131657
128	128	34.1880999999999986	-77.9728000000000065	9	t	2019-01-09 21:40:09.131657
129	129	34.1642700000000019	-77.9368400000000037	8	f	2019-01-09 21:40:09.131657
130	130	34.2636600000000016	-77.9536899999999946	10	t	2019-01-09 21:40:09.131657
131	131	34.1652100000000019	-77.9599299999999999	11	f	2019-01-09 21:40:09.131657
132	132	34.1797200000000032	-77.990470000000002	8	t	2019-01-09 21:40:09.131657
133	133	34.1906099999999995	-77.9639600000000002	6	f	2019-01-09 21:40:09.131657
134	134	34.2396499999999975	-77.9815700000000049	3	t	2019-01-09 21:40:09.131657
135	135	34.1875	-77.9941900000000032	3	f	2019-01-09 21:40:09.131657
136	136	34.2274799999999999	-77.9382499999999965	7	t	2019-01-09 21:40:09.131657
137	137	34.2404099999999971	-77.9346599999999938	2	f	2019-01-09 21:40:09.131657
138	138	34.2107099999999988	-77.9721799999999945	6	t	2019-01-09 21:40:09.131657
139	139	34.2877200000000002	-77.9793200000000013	9	f	2019-01-09 21:40:09.131657
140	140	34.1809799999999981	-77.9853899999999953	8	t	2019-01-09 21:40:09.131657
141	141	34.1462700000000012	-77.9902000000000015	10	f	2019-01-09 21:40:09.131657
142	142	34.2867299999999986	-77.9190799999999939	5	t	2019-01-09 21:40:09.131657
143	143	34.1789800000000028	-77.9364300000000014	6	f	2019-01-09 21:40:09.131657
144	144	34.2884699999999967	-77.999520000000004	3	t	2019-01-09 21:40:09.131657
145	145	34.2834000000000003	-77.9787599999999941	8	f	2019-01-09 21:40:09.131657
146	146	34.2351499999999973	-77.9291300000000007	8	t	2019-01-09 21:40:09.131657
147	147	34.2945100000000025	-77.9319399999999973	4	f	2019-01-09 21:40:09.131657
148	148	34.2301199999999994	-77.9872699999999952	10	t	2019-01-09 21:40:09.131657
149	149	34.2305300000000017	-77.9697199999999953	6	f	2019-01-09 21:40:09.131657
150	150	34.299190000000003	-77.9272399999999976	8	t	2019-01-09 21:40:09.131657
\.


--
-- Name: incident_sequence; Type: SEQUENCE SET; Schema: public; Owner: naps
--

SELECT pg_catalog.setval('public.incident_sequence', 150, true);


--
-- Data for Name: mission; Type: TABLE DATA; Schema: public; Owner: naps
--

COPY public.mission (mission_id, responder_id, last_update, current_status, incident_id) FROM stdin;
201	51	2019-01-11	Rescued	51
198	48	2019-01-11	Rescued	48
196	46	2019-01-11	Rescued	46
155	5	2019-01-11	Rescued	5
291	141	2019-01-11	Rescued	141
197	47	2019-01-11	Rescued	47
269	119	2019-01-11	Rescued	119
209	59	2019-01-11	Rescued	59
185	35	2019-01-11	Rescued	36
199	49	2019-01-11	Rescued	49
202	52	2019-01-11	Rescued	52
290	140	2019-01-11	Rescued	140
200	50	2019-01-11	Rescued	50
158	8	2019-01-11	Rescued	8
239	89	2019-01-11	Rescued	89
240	90	2019-01-11	Rescued	90
156	6	2019-01-11	Rescued	6
241	91	2019-01-11	Rescued	91
289	139	2019-01-11	Rescued	139
244	94	2019-01-11	Rescued	94
245	95	2019-01-11	Rescued	95
275	125	2019-01-11	Rescued	125
287	137	2019-01-11	Rescued	137
182	32	2019-01-11	Rescued	33
195	45	2019-01-11	Rescued	45
278	128	2019-01-11	Rescued	128
243	93	2019-01-11	Rescued	93
288	138	2019-01-11	Rescued	138
285	135	2019-01-11	Rescued	135
242	92	2019-01-11	Rescued	92
157	7	2019-01-11	Rescued	7
183	33	2019-01-11	Rescued	34
220	70	2019-01-11	Rescued	70
181	31	2019-01-11	Rescued	32
184	34	2019-01-11	Rescued	35
286	136	2019-01-11	Rescued	136
154	4	2019-01-11	Rescued	4
232	82	2019-01-11	Rescued	82
238	88	2019-01-11	Rescued	88
231	81	2019-01-11	Rescued	81
227	77	2019-01-11	Rescued	77
171	21	2019-01-11	Rescued	21
271	121	2019-01-11	Rescued	121
226	76	2019-01-11	Rescued	76
233	83	2019-01-11	Rescued	83
186	36	2019-01-11	Rescued	37
225	75	2019-01-11	Rescued	75
153	3	2019-01-11	Rescued	3
230	80	2019-01-11	Rescued	80
159	9	2019-01-11	Rescued	9
151	1	2019-01-11	Rescued	1
274	124	2019-01-11	Rescued	124
229	79	2019-01-11	Rescued	79
152	2	2019-01-11	Rescued	2
234	84	2019-01-11	Rescued	84
172	22	2019-01-11	Rescued	22
223	73	2019-01-11	Rescued	73
235	85	2019-01-11	Rescued	85
237	87	2019-01-11	Rescued	87
224	74	2019-01-11	Rescued	74
284	134	2019-01-11	Rescued	134
236	86	2019-01-11	Rescued	86
228	78	2019-01-11	Rescued	78
263	113	2019-01-11	Rescued	113
259	109	2019-01-11	Rescued	109
260	110	2019-01-11	Rescued	110
265	115	2019-01-11	Rescued	115
258	108	2019-01-11	Rescued	108
256	106	2019-01-11	Rescued	106
194	44	2019-01-11	Rescued	44
254	104	2019-01-11	Rescued	104
261	111	2019-01-11	Rescued	111
262	112	2019-01-11	Rescued	112
257	107	2019-01-11	Rescued	107
255	105	2019-01-11	Rescued	105
191	41	2019-01-11	Rescued	41
264	114	2019-01-11	Rescued	114
192	42	2019-01-11	Rescued	42
193	43	2019-01-11	Rescued	43
218	68	2019-01-11	Rescued	68
215	65	2019-01-11	Rescued	65
176	26	2019-01-11	Rescued	26
222	72	2019-01-11	Rescued	72
174	24	2019-01-11	Rescued	24
217	67	2019-01-11	Rescued	67
177	27	2019-01-11	Rescued	28
247	97	2019-01-11	Rescued	97
221	71	2019-01-11	Rescued	71
281	131	2019-01-11	Rescued	131
179	29	2019-01-11	Rescued	30
280	130	2019-01-11	Rescued	130
246	96	2019-01-11	Rescued	96
216	66	2019-01-11	Rescued	66
178	28	2019-01-11	Rescued	29
175	25	2019-01-11	Rescued	25
273	123	2019-01-11	Rescued	123
180	30	2019-01-11	Rescued	31
270	120	2019-01-11	Rescued	120
213	63	2019-01-11	Rescued	63
208	58	2019-01-11	Rescued	58
268	118	2019-01-11	Rescued	118
266	116	2019-01-11	Rescued	116
219	69	2019-01-11	Rescued	69
292	142	2019-01-11	Rescued	142
267	117	2019-01-11	Rescued	117
214	64	2019-01-11	Rescued	64
282	132	2019-01-11	Rescued	132
249	99	2019-01-11	Rescued	99
170	20	2019-01-11	Rescued	20
166	16	2019-01-11	Rescued	16
298	148	2019-01-11	Rescued	148
211	61	2019-01-11	Rescued	61
187	37	2019-01-11	Rescued	38
212	62	2019-01-11	Rescued	62
164	14	2019-01-11	Rescued	14
161	11	2019-01-11	Rescued	11
163	13	2019-01-11	Rescued	13
253	103	2019-01-11	Rescued	103
250	100	2019-01-11	Rescued	100
169	19	2019-01-11	Rescued	19
167	17	2019-01-11	Rescued	17
248	98	2019-01-11	Rescued	98
160	10	2019-01-11	Rescued	10
168	18	2019-01-11	Rescued	18
299	149	2019-01-11	Rescued	149
210	60	2019-01-11	Rescued	60
165	15	2019-01-11	Rescued	15
162	12	2019-01-11	Rescued	12
251	101	2019-01-11	Rescued	101
252	102	2019-01-11	Rescued	102
300	150	2019-01-11	Rescued	150
297	147	2019-01-11	Rescued	147
190	40	2019-01-11	Rescued	40
189	39	2019-01-11	Rescued	39
294	144	2019-01-11	Rescued	144
205	55	2019-01-11	Rescued	55
203	53	2019-01-11	Rescued	53
293	143	2019-01-11	Rescued	143
296	146	2019-01-11	Rescued	146
207	57	2019-01-11	Rescued	57
277	127	2019-01-11	Rescued	127
279	129	2019-01-11	Rescued	129
276	126	2019-01-11	Rescued	126
272	122	2019-01-11	Rescued	122
204	54	2019-01-11	Rescued	54
188	38	2019-01-11	Rescued	39
173	23	2019-01-11	Rescued	23
283	133	2019-01-11	Rescued	133
206	56	2019-01-11	Rescued	56
295	145	2019-01-11	Rescued	145
\.


--
-- Name: mission_sequence; Type: SEQUENCE SET; Schema: public; Owner: naps
--

SELECT pg_catalog.setval('public.mission_sequence', 300, true);


--
-- Data for Name: reporter; Type: TABLE DATA; Schema: public; Owner: naps
--

COPY public.reporter (reporter_id, reporter_name, reporter_phone_number) FROM stdin;
3	Irwin Binkley	(700) 249-3167
4	Broderick Antoine	(517) 396-5681
5	Basil Ditto	(342) 943-7791
2	Mikel Wordlaw	(851) 700-6544
6	Chet Meuser	(633) 744-4013
7	Adalberto Davi	(797) 840-0926
8	Antonio Spinner	(600) 389-7216
10	Horacio Cioffi	(329) 513-3438
11	Neil Enriguez	(499) 868-1459
13	Franklyn Noon	(582) 209-7903
14	Norberto Marsico	(996) 499-0839
15	Rico Ogorman	(921) 801-5091
16	Tod Nuckols	(497) 555-2913
18	Melvin Patti	(288) 849-0793
19	Dusty Kearney	(558) 397-9443
20	Dino Larocco	(842) 988-8925
22	Neal Cargo	(905) 568-9815
23	Paris Krebsbach	(880) 576-8547
24	Virgil Mcadam	(995) 795-2951
26	Ted Lilly	(586) 864-6802
27	Patricia Whitson	(380) 525-1051
28	Alonzo Ybarbo	(506) 955-4748
29	Berry Vaden	(416) 452-8335
31	Reynaldo Fincham	(505) 250-9534
32	Shirley Brain	(382) 491-3858
34	Loyd Colbert	(958) 289-0844
35	Dewitt Morein	(533) 375-4630
36	Bud Kwiatkowski	(701) 903-3734
38	Loren Mayhall	(373) 718-9180
49	Donnell Mariner	(443) 585-9120
53	Tandy Memmott	(831) 934-5082
54	Romelia Tuck	(392) 659-1480
55	Dacia Thorn	(860) 285-3842
80	Ilse Liptak	(858) 280-5942
95	Katheleen Schaffer	(790) 793-7075
94	Bev Rowen	(386) 937-0152
103	Cleo Dummer	(990) 610-1264
104	Denny Gladfelter	(930) 497-4192
107	Gale Swope	(624) 965-0549
109	Deangelo Reck	(661) 623-1594
114	Edmund Sweetland	(750) 970-9469
115	Ryan Muniz	(564) 929-8683
118	Charles Betz	(633) 813-6097
120	Toby Sirois	(625) 785-9597
126	Horacio Nagata	(922) 281-5056
139	Jean Carvalho	(806) 618-6411
140	Keneth Cureton	(210) 262-9347
1	Quincy Hanford	(543) 587-8379
39	Tom Eastin	(691) 293-2880
40	Alexis Cipriano	(834) 250-6624
43	Wally Juarez	(422) 349-7974
44	Terence Suriel	(419) 373-0022
46	Mohammad Batie	(363) 980-6631
47	Lionel Chaves	(243) 367-1728
50	Leopoldo Tokarz	(814) 243-6428
61	Lynnette Brierly	(221) 571-4237
131	Josh Cockerham	(983) 258-8983
132	Javier Wimberly	(440) 791-2938
134	Bryon Arena	(290) 616-3513
135	Josiah Steiner	(377) 681-4450
136	Carlton Stalcup	(673) 317-3730
138	Wade Malick	(865) 475-4210
141	Andreas Severe	(709) 993-4859
143	Elliott Cody	(660) 769-1251
145	Samual Gladney	(742) 904-6598
146	Jordon Achenbach	(528) 274-3309
147	Winford Fleck	(562) 830-3609
149	Terrance Portalatin	(957) 452-5703
150	Kenneth Stansbury	(484) 387-1027
101	Jayson Pam	(554) 547-2709
105	Sidney Aguas	(822) 307-0882
106	Gino Dittmar	(211) 993-8005
110	Brant Lamarche	(222) 363-1790
111	Derick Swartwood	(447) 792-9359
113	Yong Brendel	(964) 480-7912
9	Scottie Hulsey	(990) 634-8388
12	Jerold Buzzard	(286) 731-8930
17	Richard Liberatore	(643) 225-2497
21	Morris Kothari	(967) 474-5325
25	Rickey Thurber	(832) 593-9449
30	Rodrick Hunter	(436) 460-6462
33	Warner Hiltner	(695) 384-2573
37	Booker Brinkmann	(592) 522-2422
133	Sean Macko	(926) 675-2467
137	Carlo Crain	(826) 630-9083
142	Denver Baranowski	(939) 674-0597
144	Kory Caskey	(774) 834-6186
148	Nolan Halliwell	(861) 243-8557
102	Frances Empson	(936) 368-9269
108	Garry Cyr	(248) 962-4771
116	Clint Spano	(254) 582-8712
117	Lanny Staiger	(508) 794-5081
121	Truman Helgren	(359) 914-4913
123	Tyrell Laidlaw	(509) 707-7850
124	Kurtis Grande	(817) 320-5389
127	Loyd Stoops	(364) 673-3551
128	Timmy Marone	(580) 699-8513
129	Donny Perz	(376) 266-0568
130	Tony Reder	(970) 554-1951
71	Freida Dewberry	(372) 915-7359
72	Angela Brundage	(757) 516-3383
73	Aleida Marts	(760) 202-3388
75	Tamekia Guerrero	(231) 238-1277
76	Loretta Heckstall	(292) 463-0988
77	Zula Urbanski	(566) 575-1460
78	Norma Muir	(476) 575-7278
81	Maragaret Reynold	(779) 238-4184
82	Loralee Hanna	(340) 806-8891
83	Nana Skiles	(658) 231-0984
85	Shu Mcbrayer	(995) 360-6659
86	Maryam Forbis	(486) 846-1619
87	Charis Desantis	(793) 585-4983
89	Lakisha Keppel	(971) 856-6855
90	Kyoko Hinds	(587) 402-0993
92	Lesia Burk	(316) 307-2747
97	Jeanine Schreck	(946) 639-4619
98	Colene Greer	(584) 383-0968
99	Earnestine Wark	(441) 399-6229
42	Marcel Baca	(999) 479-9872
48	Otis Stevens	(502) 620-5788
51	Fannie Grieco	(509) 648-9617
56	Catina Collin	(955) 988-5670
57	Eliz Kirkbride	(861) 728-6686
58	Felicitas Tall	(931) 310-2762
60	Denyse Fox	(392) 701-4283
62	Margert Hotard	(323) 531-9871
63	Delora Ussery	(545) 985-2364
65	Hildegarde Roberds	(933) 974-1694
66	Kindra Kinsey	(803) 521-8853
69	Juanita Tiemann	(734) 342-4194
112	Garland Yohn	(429) 381-7297
119	Les Yeomans	(928) 592-9548
122	Oliver Mcilvain	(374) 280-1859
125	Lou Orem	(993) 978-9077
70	Francoise Calkins	(420) 437-0169
74	Marilou Goudreau	(981) 395-6881
79	Eladia Baskett	(452) 454-9561
84	Chelsey Rubino	(946) 573-9974
88	Larraine Pennell	(603) 336-1722
91	Rocio Stimac	(553) 348-0534
93	Aisha Wilmeth	(539) 810-6973
96	Marine Agbayani	(808) 998-8045
100	Mellissa Nottingham	(403) 434-8697
41	Freeman Alvino	(409) 833-5834
45	Enrique Reider	(749) 987-4563
52	Luba Milliken	(475) 961-4806
59	Carin Jacome	(662) 374-6975
64	Thresa Sais	(645) 318-0590
67	Rossana Franco	(839) 501-7639
68	Carleen Hodgin	(539) 322-8127
\.


--
-- Name: reporter_sequence; Type: SEQUENCE SET; Schema: public; Owner: naps
--

SELECT pg_catalog.setval('public.reporter_sequence', 150, true);


--
-- Data for Name: responder; Type: TABLE DATA; Schema: public; Owner: naps
--

COPY public.responder (responder_id, responder_name, responder_phone_number, responder_current_gps_lat, responder_curr
ent_gps_long, boat_capacity, has_medical_kit, available, version) FROM stdin;
1       Geraldo Groh    (543) 587-8379  34.16877        -77.87045       8       t       t       0
2       Corey Bice      (851) 700-6544  34.18323        -77.84099       17      f       t       0
3       Rashida Lacross (700) 249-3167  34.23670        -77.83479       9       t       t       0
4       Rocio Hice      (517) 396-5681  34.14338        -77.88274       25      f       t       0
5       Sparkle Willmore        (342) 943-7791  34.29256        -77.86569       28      t       t       0
6       Mei Spano       (633) 744-4013  34.12679        -77.87353       4       f       t       0
7       Eliseo Mawson   (797) 840-0926  34.29515        -77.81463       3       t       t       0
8       Claudia Hanes   (600) 389-7216  34.29103        -77.86601       2       f       t       0
9       Anja Casselman  (990) 634-8388  34.24544        -77.83508       3       t       t       0
10      Harold Hendrixson       (329) 513-3438  34.15140        -77.89115       10      f       t       0
11      Dewayne Clauss  (499) 868-1459  34.12112        -77.94435       12      t       t       0
12      Shannan Buttrey (286) 731-8930  34.12579        -77.89562       15      f       t       0
13      Celestina Earnshaw      (582) 209-7903  34.26845        -77.84534       30      t       t       0
14      Hannah Rehn     (996) 499-0839  34.24732        -77.82757       13      f       t       0
15      Petra Hinson    (921) 801-5091  34.15593        -77.88559       25      t       t       0
16      Doreatha Hullett        (497) 555-2913  34.25137        -77.82163       19      f       t       0
17      Peter Mcaninch  (643) 225-2497  34.28515        -77.81113       29      t       t       0
18      Sonny Atkison   (288) 849-0793  34.22543        -77.89744       7       f       t       0
19      Telma Gonzales  (558) 397-9443  34.21485        -77.88824       27      t       t       0
20      Alona Ridout    (842) 988-8925  34.17537        -77.83297       10      f       t       0
21      Christoper Fuss (967) 474-5325  34.23755        -77.84025       9       t       t       0
22      Lindy Delaune   (905) 568-9815  34.18062        -77.82813       18      f       t       0
23      Otto Touchton   (880) 576-8547  34.28235        -77.83150       27      t       t       0
24      Gisela Govan    (995) 795-2951  34.13362        -77.87096       7       f       t       0
25      Berna Till      (832) 593-9449  34.22852        -77.88805       7       t       t       0
26      Traci Beaver    (586) 864-6802  34.16838        -77.88663       3       f       t       0
27      Marine Adamo    (380) 525-1051  34.13167        -77.87837       12      t       t       0
28      Adela Wike      (506) 955-4748  34.13807        -77.85802       28      f       t       0
29      Wendell Greene  (416) 452-8335  34.21333        -77.85895       19      t       t       0
30      Ceola Kall      (436) 460-6462  34.22450        -77.83713       11      f       t       0
31      Gianna Tuthill  (505) 250-9534  34.29357        -77.88581       16      t       t       0
32      Priscilla Hardwick      (382) 491-3858  34.27320        -77.88904       7       f       t       0
33      Ines Gooslin    (695) 384-2573  34.21410        -77.82393       21      t       t       0
34      Sook Mathena    (958) 289-0844  34.25424        -77.82394       15      f       t       0
35      Amee Faul       (533) 375-4630  34.13270        -77.87921       8       t       t       0
36      Emily Fleetwood (701) 903-3734  34.19344        -77.88434       4       f       t       0
37      Euna Coppock    (592) 522-2422  34.18518        -77.85839       16      t       t       0
38      Lashonda Obermiller     (373) 718-9180  34.21273        -77.85572       28      f       t       0
39      Norene Zapata   (691) 293-2880  34.18795        -77.85355       12      t       t       0
40      Dayna Dingee    (834) 250-6624  34.11156        -77.87990       18      f       t       0
41      Katharina Madere        (409) 833-5834  34.28865        -77.89509       3       t       t       0
42      Jean Ahumada    (999) 479-9872  34.21850        -77.85742       17      f       t       0
43      Chastity Norby  (422) 349-7974  34.28592        -77.84217       1       t       t       0
44      Gillian Raphael (419) 373-0022  34.29912        -77.83962       17      f       t       0
45      Dahlia Rennie   (749) 987-4563  34.26085        -77.85754       10      t       t       0
46      Joellen Tant    (363) 980-6631  34.25637        -77.86583       2       f       t       0
47      Basil Forward   (243) 367-1728  34.23781        -77.82313       1       t       t       0
48      Margaretta Bechtol      (502) 620-5788  34.24184        -77.82697       7       f       t       0
49      Meggan Ferretti (443) 585-9120  34.21667        -77.84090       24      t       t       0
50      Enid Cadet      (814) 243-6428  34.26045        -77.89394       15      f       t       0
51      Adelia Choice   (509) 648-9617  34.27331        -77.83811       14      t       t       0
52      Erlinda Shofner (475) 961-4806  34.19029        -77.82106       9       f       t       0
53      Mechelle Eyer   (831) 934-5082  34.27525        -77.81595       11      t       t       0
54      Sherrell Fergerson      (392) 659-1480  34.27772        -77.83550       1       f       t       0
55      German Woodland (860) 285-3842  34.25019        -77.87182       12      t       t       0
56      Terrence Tennyson       (955) 988-5670  34.11707        -77.94990       7       f       t       0
57      Debera Taff     (861) 728-6686  34.26315        -77.85929       18      t       t       0
58      Olivia Loveland (931) 310-2762  34.13249        -77.86407       12      f       t       0
59      Randa Havard    (662) 374-6975  34.23069        -77.82508       25      t       t       0
60      Darell Bess     (392) 701-4283  34.28325        -77.89050       3       f       t       0
61      Danny Kreitzer  (221) 571-4237  34.25963        -77.87289       16      t       t       0
62      Tanner Sawtelle (323) 531-9871  34.13516        -77.89807       26      f       t       0
63      Hsiu Delk       (545) 985-2364  34.26474        -77.81976       7       t       t       0
64      Ingeborg Shives (645) 318-0590  34.23507        -77.81145       6       f       t       0
65      Bradley Edgerton        (933) 974-1694  34.22267        -77.81822       23      t       t       0
66      Shaunna Stumbaugh       (803) 521-8853  34.28085        -77.87028       28      f       t       0
67      Vincenza Alberti        (839) 501-7639  34.15723        -77.88839       1       t       t       0
68      Darrell Kies    (539) 322-8127  34.27059        -77.89015       22      f       t       0
69      Roma Cummins    (734) 342-4194  34.27188        -77.83255       26      t       t       0
70      Earlean Longacre        (420) 437-0169  34.26884        -77.87338       13      f       t       0
71      Georgie Bucci   (372) 915-7359  34.27274        -77.85782       3       t       t       0
72      Ida Vanderwal   (757) 516-3383  34.14713        -77.88061       14      f       t       0
73      Rachael Saenger (760) 202-3388  34.26952        -77.86032       3       t       t       0
74      Arnita Defrank  (981) 395-6881  34.17767        -77.85476       11      f       t       0
75      Summer Lamarche (231) 238-1277  34.28241        -77.87475       18      t       t       0
76      Orval Duarte    (292) 463-0988  34.22968        -77.88612       26      f       t       0
77      Alyssa Younger  (566) 575-1460  34.22869        -77.83795       19      t       t       0
78      Wonda Meador    (476) 575-7278  34.14738        -77.84503       8       f       t       0
79      Jacquelynn Beauchemin   (452) 454-9561  34.14900        -77.91642       11      t       t       0
80      Mandi Blessing  (858) 280-5942  34.27962        -77.85038       29      f       t       0
81      Delbert Carty   (779) 238-4184  34.18426        -77.83705       7       t       t       0
82      Tana Foulger    (340) 806-8891  34.29556        -77.87310       11      f       t       0
83      Leonor Repka    (658) 231-0984  34.23763        -77.89170       17      t       t       0
84      Columbus Haan   (946) 573-9974  34.24293        -77.89942       28      f       t       0
85      Edythe Marmon   (995) 360-6659  34.25248        -77.82397       3       t       t       0
86      Leisha Antonelli        (486) 846-1619  34.29972        -77.81515       12      f       t       0
87      Van Owsley      (793) 585-4983  34.14343        -77.86994       3       t       t       0
88      Tamara Stockman (603) 336-1722  34.21988        -77.85591       4       f       t       0
89      Vivienne Waters (971) 856-6855  34.28171        -77.86502       9       t       t       0
90      Jayson Boerner  (587) 402-0993  34.24520        -77.87987       10      f       t       0
91      Chae Peralto    (553) 348-0534  34.23446        -77.89876       28      t       t       0
92      Sharron Rowe    (316) 307-2747  34.29174        -77.85198       11      f       t       0
93      Adrienne Hiner  (539) 810-6973  34.23047        -77.89127       27      t       t       0
94      Pinkie Langstaff        (386) 937-0152  34.26726        -77.81489       29      f       t       0
95      Cole Wiltz      (790) 793-7075  34.27177        -77.81052       9       t       t       0
96      Jimmy Peterman  (808) 998-8045  34.21481        -77.88161       11      f       t       0
97      Kyra Manzo      (946) 639-4619  34.23536        -77.86422       20      t       t       0
98      Penni Mciver    (584) 383-0968  34.25881        -77.85262       9       f       t       0
99      Gustavo Berra   (441) 399-6229  34.13046        -77.86591       10      t       t       0
100     Luis Hazeltine  (403) 434-8697  34.28713        -77.93828       24      f       t       0
101     Boyce Soller    (554) 547-2709  34.28495        -77.99200       3       t       t       0
102     Wilford Phalen  (936) 368-9269  34.29079        -77.95484       4       f       t       0
103     Sol Sharif      (990) 610-1264  34.21517        -77.91073       10      t       t       0
104     Danial Sawicki  (930) 497-4192  34.15932        -77.94314       16      f       t       0
105     Deshawn Sears   (822) 307-0882  34.24839        -77.99863       16      t       t       0
106     Lonny Puleo     (211) 993-8005  34.27161        -77.95439       4       f       t       0
107     Jamie Mccombs   (624) 965-0549  34.21105        -77.93218       4       t       t       0
108     Whitney Raschke (248) 962-4771  34.12347        -77.94362       15      f       t       0
109     Stewart Faux    (661) 623-1594  34.28610        -77.91644       27      t       t       0
110     Cordell Snodgrass       (222) 363-1790  34.27504        -77.93455       21      f       t       0
111     Terrence Mccotter       (447) 792-9359  34.16896        -77.93074       27      t       t       0
112     Thanh Vanderzee (429) 381-7297  34.26455        -77.95887       23      f       t       0
113     Mary Brugman    (964) 480-7912  34.21879        -77.97400       2       t       t       0
114     Nathaniel Buczek        (750) 970-9469  34.25560        -77.96705       15      f       t       0
115     Lowell Kulinski (564) 929-8683  34.25102        -77.97634       17      t       t       0
116     Desmond Alvelo  (254) 582-8712  34.22614        -77.97175       8       f       t       0
117     Ulysses Amos    (508) 794-5081  34.11746        -77.91521       24      t       t       0
118     Dennis Sandquist        (633) 813-6097  34.28015        -77.98507       25      f       t       0
119     Alonzo Bridgett (928) 592-9548  34.19878        -77.91638       3       t       t       0
120     Jamel Buscemi   (625) 785-9597  34.25999        -77.97633       21      f       t       0
121     Arden Laurich   (359) 914-4913  34.14557        -77.95200       9       t       t       0
122     Filiberto Vaughan       (374) 280-1859  34.13402        -77.93135       18      f       t       0
123     Dalton Mcmahon  (509) 707-7850  34.24775        -77.92075       23      t       t       0
124     Vito Maskell    (817) 320-5389  34.14577        -77.93073       13      f       t       0
125     Loren Winebarger        (993) 978-9077  34.16527        -77.92232       9       t       t       0
126     Dino Hollingshead       (922) 281-5056  34.21807        -77.95796       6       f       t       0
127     Jerrold Hayles  (364) 673-3551  34.28799        -77.91497       24      t       t       0
128     Abram Leer      (580) 699-8513  34.18810        -77.97280       21      f       t       0
129     Ed Haltom       (376) 266-0568  34.16427        -77.93684       20      t       t       0
130     Chase Tedford   (970) 554-1951  34.26366        -77.95369       24      f       t       0
131     Ray Meyerhoff   (983) 258-8983  34.16521        -77.95993       27      t       t       0
132     Augustus Nevius (440) 791-2938  34.17972        -77.99047       18      f       t       0
133     Jc Reamer       (926) 675-2467  34.19061        -77.96396       13      t       t       0
134     Tyler Raysor    (290) 616-3513  34.23965        -77.98157       6       f       t       0
135     Jeffery Wisner  (377) 681-4450  34.18750        -77.99419       7       t       t       0
136     Jackson Zehner  (673) 317-3730  34.22748        -77.93825       16      f       t       0
137     Bret Seedorf    (826) 630-9083  34.24041        -77.93466       3       t       t       0
138     Eloy Grego      (865) 475-4210  34.21071        -77.97218       15      f       t       0
139     Maynard Ramsier (806) 618-6411  34.28772        -77.97932       21      t       t       0
140     Sal Delatte     (210) 262-9347  34.18098        -77.98539       20      f       t       0
141     Colby Riney     (709) 993-4859  34.14627        -77.99020       23      t       t       0
142     Christoper Hinrichs     (939) 674-0597  34.28673        -77.91908       12      f       t       0
143     Murray Wixon    (660) 769-1251  34.17898        -77.93643       14      t       t       0
144     Edgar Vina      (774) 834-6186  34.28847        -77.99952       7       f       t       0
145     Owen Breeden    (742) 904-6598  34.28340        -77.97876       18      t       t       0
146     Mohammad Hazlitt        (528) 274-3309  34.23515        -77.92913       18      f       t       0
147     Jimmie Whetzel  (562) 830-3609  34.29451        -77.93194       8       t       t       0
148     Shawn Hamiter   (861) 243-8557  34.23012        -77.98727       23      f       t       0
149     Jacinto Tait    (957) 452-5703  34.23053        -77.96972       15      t       t       0
150     Luke Velasques  (484) 387-1027  34.29919        -77.92724       19      f       t       0
\.


--
-- Name: responder_sequence; Type: SEQUENCE SET; Schema: public; Owner: naps
--

SELECT pg_catalog.setval('public.responder_sequence', 150, true);


--
-- Name: incident incident_pkey; Type: CONSTRAINT; Schema: public; Owner: naps
--

ALTER TABLE ONLY public.incident
    ADD CONSTRAINT incident_pkey PRIMARY KEY (incident_id);


--
-- Name: mission mission_pkey; Type: CONSTRAINT; Schema: public; Owner: naps
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT mission_pkey PRIMARY KEY (mission_id);


--
-- Name: reporter reporter_pkey; Type: CONSTRAINT; Schema: public; Owner: naps
--

ALTER TABLE ONLY public.reporter
    ADD CONSTRAINT reporter_pkey PRIMARY KEY (reporter_id);


--
-- Name: responder responder_pkey; Type: CONSTRAINT; Schema: public; Owner: naps
--

ALTER TABLE ONLY public.responder
    ADD CONSTRAINT responder_pkey PRIMARY KEY (responder_id);


--
-- Name: incident incident_report_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: naps
--

ALTER TABLE ONLY public.incident
    ADD CONSTRAINT incident_report_id_fkey FOREIGN KEY (report_id) REFERENCES public.reporter(reporter_id);


--
-- Name: mission mission_responder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: naps
--

ALTER TABLE ONLY public.mission
    ADD CONSTRAINT mission_responder_id_fkey FOREIGN KEY (responder_id) REFERENCES public.reporter(reporter_id);


--
-- PostgreSQL database dump complete
--

