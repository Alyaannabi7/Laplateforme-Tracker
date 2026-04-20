--
-- PostgreSQL database dump
--

\restrict syMOisQDqsdbymHUlT9Qf7bqZjaPEDGx0IvKEh5LZbywtMUcE5oIcucSUXuWEIs

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

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
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins (
    id integer NOT NULL,
    email character varying(100),
    password character varying(100)
);


ALTER TABLE public.admins OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.admins_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.admins_id_seq OWNER TO postgres;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.admins_id_seq OWNED BY public.admins.id;


--
-- Name: grades; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grades (
    id integer NOT NULL,
    student_id integer,
    project_id integer,
    grade numeric(5,2)
);


ALTER TABLE public.grades OWNER TO postgres;

--
-- Name: grades_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grades_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.grades_id_seq OWNER TO postgres;

--
-- Name: grades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grades_id_seq OWNED BY public.grades.id;


--
-- Name: professors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.professors (
    id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(100),
    password text,
    subject character varying(50)
);


ALTER TABLE public.professors OWNER TO postgres;

--
-- Name: professors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.professors_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.professors_id_seq OWNER TO postgres;

--
-- Name: professors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.professors_id_seq OWNED BY public.professors.id;


--
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    id integer NOT NULL,
    name character varying(100),
    level character varying(50),
    professor_id integer
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.projects_id_seq OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: students; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.students (
    id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    email character varying(100),
    password text,
    filiere character varying(50),
    level integer DEFAULT 1,
    age integer
);


ALTER TABLE public.students OWNER TO postgres;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.students_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.students_id_seq OWNER TO postgres;

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.students_id_seq OWNED BY public.students.id;


--
-- Name: admins id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins ALTER COLUMN id SET DEFAULT nextval('public.admins_id_seq'::regclass);


--
-- Name: grades id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades ALTER COLUMN id SET DEFAULT nextval('public.grades_id_seq'::regclass);


--
-- Name: professors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professors ALTER COLUMN id SET DEFAULT nextval('public.professors_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: students id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students ALTER COLUMN id SET DEFAULT nextval('public.students_id_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admins (id, email, password) FROM stdin;
1	admin@school.com	admin123
2	root@school.com	root123
\.


--
-- Data for Name: grades; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grades (id, student_id, project_id, grade) FROM stdin;
1	1	1	4.33
2	2	1	18.97
3	3	1	6.50
4	4	1	7.84
5	5	1	5.29
6	6	1	1.91
7	7	1	3.88
8	8	1	12.13
9	9	1	14.36
10	10	1	14.28
11	11	1	1.90
12	12	1	12.96
13	13	1	12.55
14	14	1	8.38
15	1	2	12.63
16	2	2	18.53
17	3	2	16.01
18	4	2	7.09
19	5	2	12.83
20	6	2	2.84
21	7	2	5.56
22	8	2	18.85
23	9	2	2.76
24	10	2	14.54
25	11	2	17.83
26	12	2	1.47
27	13	2	19.57
28	14	2	9.48
29	1	3	0.32
30	2	3	4.96
31	3	3	5.73
32	4	3	12.10
33	5	3	0.28
34	6	3	8.16
35	7	3	14.37
36	8	3	5.34
37	9	3	10.09
38	10	3	7.83
39	11	3	5.44
40	12	3	14.89
41	13	3	6.93
42	14	3	1.06
43	15	1	11.50
44	15	2	9.75
45	15	3	13.20
46	16	1	15.80
47	16	2	14.60
48	16	3	16.40
49	17	1	17.90
50	17	2	18.20
51	17	3	16.75
52	18	1	13.40
53	18	2	12.90
54	18	3	14.10
58	20	1	14.70
59	20	2	15.30
60	20	3	13.90
61	24	1	9.69
62	24	2	19.91
63	24	3	15.62
64	25	1	14.16
65	25	2	17.51
66	25	3	14.42
67	26	1	17.00
68	26	2	15.09
69	26	3	10.18
70	27	1	18.75
71	27	2	12.35
72	27	3	16.08
73	28	1	18.04
74	28	2	8.89
75	28	3	6.33
76	29	1	19.21
77	29	2	15.05
78	29	3	12.56
79	30	1	10.25
80	30	2	12.37
81	30	3	16.08
82	31	1	12.11
83	31	2	13.06
84	31	3	13.64
85	32	1	14.23
86	32	2	14.25
87	32	3	9.94
88	33	1	9.79
89	33	2	9.47
90	33	3	8.96
91	34	1	19.98
92	34	2	8.63
93	34	3	10.92
94	35	1	14.93
95	35	2	16.51
96	35	3	17.60
97	36	1	7.73
98	36	2	16.31
99	36	3	11.31
100	37	1	6.75
101	37	2	9.83
102	37	3	6.92
103	38	1	14.47
104	38	2	10.18
105	38	3	9.53
106	39	1	14.63
107	39	2	16.35
108	39	3	6.73
109	40	1	9.01
110	40	2	10.14
111	40	3	6.09
112	41	1	11.80
113	41	2	6.96
114	41	3	6.77
115	42	1	15.73
116	42	2	14.64
117	42	3	14.80
118	43	1	6.96
119	43	2	18.76
120	43	3	15.47
121	44	1	15.58
122	44	2	17.77
123	44	3	10.47
124	45	1	9.11
125	45	2	9.14
126	45	3	6.19
127	46	1	12.47
128	46	2	18.18
129	46	3	13.91
130	47	1	10.03
131	47	2	7.74
132	47	3	17.94
133	48	1	13.30
134	48	2	19.21
135	48	3	7.26
136	49	1	6.78
137	49	2	6.34
138	49	3	17.80
139	50	1	17.07
140	50	2	12.94
141	50	3	9.80
142	51	1	9.20
143	51	2	6.11
144	51	3	11.99
145	52	1	11.74
146	52	2	16.25
147	52	3	13.66
148	53	1	12.64
149	53	2	17.45
150	53	3	10.58
151	54	1	17.83
152	54	2	10.92
153	54	3	6.48
154	55	1	19.40
155	55	2	13.59
156	55	3	9.50
157	56	1	7.61
158	56	2	19.68
159	56	3	14.64
160	57	1	8.36
161	57	2	9.97
162	57	3	12.23
163	58	1	6.74
164	58	2	17.39
165	58	3	16.22
166	59	1	10.10
167	59	2	15.92
168	59	3	18.75
169	60	1	8.86
170	60	2	11.22
171	60	3	12.31
172	61	1	17.64
173	61	2	18.10
174	61	3	17.55
175	62	1	14.76
176	62	2	8.21
177	62	3	16.64
178	63	1	18.77
179	63	2	8.67
180	63	3	12.62
181	64	1	11.58
182	64	2	15.62
183	64	3	9.00
184	65	1	19.48
185	65	2	18.56
186	65	3	13.63
187	66	1	14.09
188	66	2	13.22
189	66	3	11.86
190	67	1	15.65
191	67	2	13.02
192	67	3	6.00
193	68	1	15.98
194	68	2	13.17
195	68	3	7.02
196	69	1	16.65
197	69	2	10.40
198	69	3	14.11
199	70	1	6.46
200	70	2	15.64
201	70	3	19.43
202	71	1	13.66
203	71	2	8.26
204	71	3	6.72
205	72	1	16.16
206	72	2	8.05
207	72	3	6.85
208	73	1	15.42
209	73	2	17.07
210	73	3	17.60
211	74	1	7.23
212	74	2	8.63
213	74	3	11.38
214	75	1	6.86
215	75	2	14.43
216	75	3	14.92
217	76	1	16.68
218	76	2	9.87
219	76	3	8.59
220	77	1	13.68
221	77	2	17.69
222	77	3	9.24
223	78	1	7.76
224	78	2	8.40
225	78	3	8.19
226	79	1	18.97
227	79	2	15.90
228	79	3	19.34
229	80	1	9.28
230	80	2	6.52
231	80	3	9.93
232	81	1	9.57
233	81	2	19.19
234	81	3	17.76
235	82	1	10.91
236	82	2	15.61
237	82	3	17.55
238	83	1	13.46
239	83	2	17.49
240	83	3	16.55
\.


--
-- Data for Name: professors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.professors (id, first_name, last_name, email, password, subject) FROM stdin;
1	Lucas	Martin	logiciel@school.com	1234	Logiciel
2	Sophie	Durand	skills@school.com	1234	Skills
3	Marc	Lefevre	hardware@school.com	1234	Hardware
4	Julie	Petit	reseau@school.com	1234	R‚seau
5	morgane	straciatelo	momo@shool.com	1234	logiciel
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (id, name, level, professor_id) FROM stdin;
1	Application Java	1A	1
2	Base de donn‚es	1A	1
3	Soft Skills	1A	2
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.students (id, first_name, last_name, email, password, filiere, level, age) FROM stdin;
13	L‚a	Renard	lea.renard@school.com	1234	cyber	2	23
30	Chloé	Richard	chloe.richard@school.com	1234	logiciel	3	21
34	Zoé	Simon	zoe.simon@school.com	1234	data	3	21
41	Théo	Roux	theo.roux@school.com	1234	cyber	2	21
46	Alice	André	alice.andre@school.com	1234	data	3	20
52	Julie	François	julie.francois@school.com	1234	data	2	23
38	Ana‹s	Garcia	anais.garcia@school.com	1234	cyber	3	23
1	Alex	Dupont	alex@mail.com	pass1	logiciel	1	22
2	Marie	Bernard	marie@mail.com	pass2	data	2	21
3	Julien	Petit	julien@mail.com	pass3	cyber	3	23
4	Karim	Benali	karim@school.com	1234	cyber	1	20
5	Julie	Morel	julie@school.com	1234	data	2	22
6	Hugo	Lemoine	hugo.lemoine@school.com	1234	logiciel	1	21
7	Clara	Fontaine	clara.fontaine@school.com	1234	logiciel	2	24
8	Enzo	Chevalier	enzo.chevalier@school.com	1234	logiciel	3	20
9	Sarah	Marchand	sarah.marchand@school.com	1234	data	3	23
10	Lucas	Perrot	lucas.perrot@school.com	1234	data	1	21
11	Manon	Garnier	manon.garnier@school.com	1234	data	2	22
12	Yanis	Barbier	yanis.barbier@school.com	1234	cyber	1	20
14	Amine	Boussaid	amine.boussaid@school.com	1234	cyber	3	21
15	Thomas	Girard	thomas.girard@school.com	1234	logiciel	1	22
16	Camille	Rousseau	camille.rousseau@school.com	1234	data	2	20
17	Rayan	Diallo	rayan.diallo@school.com	1234	cyber	3	24
20	Sofia	Nguyen	sofia.nguyen@school.com	1234	cyber	2	22
21	alya	annabitable	alya@mail	1234	chocolat	1	18
24	Emma	Dubois	emma.dubois@school.com	1234	logiciel	1	20
25	Noah	Martin	noah.martin@school.com	1234	data	2	21
26	Jade	Bernard	jade.bernard@school.com	1234	cyber	3	22
27	Lucas	Thomas	lucas.thomas@school.com	1234	logiciel	2	20
29	Hugo	Robert	hugo.robert@school.com	1234	cyber	2	23
31	Ethan	Durand	ethan.durand@school.com	1234	data	1	20
33	Arthur	Moreau	arthur.moreau@school.com	1234	logiciel	1	19
36	Camille	Lefebvre	camille.lefebvre@school.com	1234	logiciel	2	22
37	Maxime	Michel	maxime.michel@school.com	1234	data	2	21
39	Baptiste	David	baptiste.david@school.com	1234	logiciel	1	20
40	Lucie	Bertrand	lucie.bertrand@school.com	1234	data	1	19
42	Manon	Vincent	manon.vincent@school.com	1234	logiciel	3	22
43	Antoine	Fournier	antoine.fournier@school.com	1234	data	2	20
44	Laura	Morel	laura.morel@school.com	1234	cyber	1	21
45	Quentin	Girard	quentin.girard@school.com	1234	logiciel	2	23
48	Pauline	Mercier	pauline.mercier@school.com	1234	logiciel	2	21
49	Florian	Dupont	florian.dupont@school.com	1234	data	1	22
50	Marine	Lambert	marine.lambert@school.com	1234	cyber	3	20
51	Alexis	Bonnet	alexis.bonnet@school.com	1234	logiciel	1	21
53	Nicolas	Martinez	nicolas.martinez@school.com	1234	cyber	2	20
54	Sarah	Legrand	sarah.legrand@school.com	1234	logiciel	3	21
35	Raphaël	Laurent	raphael.laurent@school.com	1234	cyber	1	20
28	Léa	Petit	lea.petit@school.com	1234	data	1	19
47	Romain	Lefèvre	romain.lefevre@school.com	1234	cyber	1	19
18	Inès	Lambert	ines.lambert@school.com	1234	logiciel	2	21
32	Inès	Leroy	ines.leroy@school.com	1234	cyber	2	22
55	Thomas	Garnier	thomas.garnier@school.com	1234	data	1	19
57	Julien	Rousseau	julien.rousseau@school.com	1234	logiciel	1	20
60	Mathilde	Muller	mathilde.muller@school.com	1234	logiciel	2	20
62	Charlotte	Roussel	charlotte.roussel@school.com	1234	cyber	3	22
63	Pierre	Gautier	pierre.gautier@school.com	1234	logiciel	1	19
64	Elise	Perrin	elise.perrin@school.com	1234	data	2	20
65	Guillaume	Robin	guillaume.robin@school.com	1234	cyber	1	21
66	Noemie	Clement	noemie.clement@school.com	1234	logiciel	3	23
67	Adrien	Morin	adrien.morin@school.com	1234	data	2	20
68	Amandine	Nicolas	amandine.nicolas@school.com	1234	cyber	1	21
69	Kevin	Picard	kevin.picard@school.com	1234	logiciel	2	22
70	Margaux	Roy	margaux.roy@school.com	1234	data	3	20
71	Dylan	Dumont	dylan.dumont@school.com	1234	cyber	2	19
72	Elodie	Lacroix	elodie.lacroix@school.com	1234	logiciel	1	21
73	Mickael	Caron	mickael.caron@school.com	1234	data	1	22
74	Vanessa	Noel	vanessa.noel@school.com	1234	cyber	3	20
75	Valentin	Gilles	valentin.gilles@school.com	1234	logiciel	2	21
76	Laetitia	Masson	laetitia.masson@school.com	1234	data	1	23
77	Damien	Tessier	damien.tessier@school.com	1234	cyber	2	20
78	Virginie	Hubert	virginie.hubert@school.com	1234	logiciel	3	21
80	Sandrine	Leclercq	sandrine.leclercq@school.com	1234	cyber	1	20
81	Matthieu	Chevalier	matthieu.chevalier@school.com	1234	logiciel	1	21
61	Sébastien	Henry	sebastien.henry@school.com	1234	data	1	21
56	Océane	Faure	oceane.faure@school.com	1234	cyber	2	22
58	Aurélie	Blanc	aurelie.blanc@school.com	1234	data	3	21
59	Clément	Guerin	clement.guerin@school.com	1234	cyber	2	23
79	Benoît	Jacquet	benoit.jacquet@school.com	1234	data	2	22
82	Céline	Fernandez	celine.fernandez@school.com	1234	data	3	19
83	Stéphane	Colin	stephane.colin@school.com	1234	cyber	2	22
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.admins_id_seq', 2, true);


--
-- Name: grades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grades_id_seq', 240, true);


--
-- Name: professors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.professors_id_seq', 5, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_id_seq', 3, true);


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.students_id_seq', 83, true);


--
-- Name: admins admins_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: grades grades_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_pkey PRIMARY KEY (id);


--
-- Name: professors professors_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professors
    ADD CONSTRAINT professors_email_key UNIQUE (email);


--
-- Name: professors professors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.professors
    ADD CONSTRAINT professors_pkey PRIMARY KEY (id);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: students students_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_email_key UNIQUE (email);


--
-- Name: students students_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: grades grades_project_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_project_id_fkey FOREIGN KEY (project_id) REFERENCES public.projects(id);


--
-- Name: grades grades_student_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grades
    ADD CONSTRAINT grades_student_id_fkey FOREIGN KEY (student_id) REFERENCES public.students(id);


--
-- Name: projects projects_professor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_professor_id_fkey FOREIGN KEY (professor_id) REFERENCES public.professors(id);


--
-- PostgreSQL database dump complete
--

\unrestrict syMOisQDqsdbymHUlT9Qf7bqZjaPEDGx0IvKEh5LZbywtMUcE5oIcucSUXuWEIs

