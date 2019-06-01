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

SET default_tablespace = '';

SET default_with_oids = false;

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
    reported_time timestamp(3) without time zone,
    version bigint DEFAULT 0
);


ALTER TABLE public.reported_incident OWNER TO naps;

--
-- Name: reported_incident_seq; Type: SEQUENCE; Schema: public; Owner: naps
--

CREATE SEQUENCE public.reported_incident_seq
    START WITH 1
    INCREMENT BY 10
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reported_incident_seq OWNER TO naps;

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
    person boolean DEFAULT false,
    enrolled boolean DEFAULT true,
    version bigint DEFAULT 0
);

-- ALTER TABLE public.responder ADD COLUMN person boolean DEFAULT false;
-- ALTER TABLE public.responder ADD COLUMN enrolled boolean DEFAULT true;

ALTER TABLE public.responder OWNER TO naps;

--
-- Name: responder_sequence; Type: SEQUENCE; Schema: public; Owner: naps
--

CREATE SEQUENCE public.responder_sequence
    START WITH 1
    INCREMENT BY 10
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.responder_sequence OWNER TO naps;

--
-- Name: responder_sequence; Type: SEQUENCE OWNED BY; Schema: public; Owner: naps
--

ALTER SEQUENCE public.responder_sequence OWNED BY public.responder.responder_id;


--
-- Name: responder responder_id; Type: DEFAULT; Schema: public; Owner: naps
--

ALTER TABLE ONLY public.responder ALTER COLUMN responder_id SET DEFAULT nextval('public.responder_sequence'::regclass);

--
-- Data for Name: responder; Type: TABLE DATA; Schema: public; Owner: naps
--

INSERT INTO public.responder VALUES (1, 'Geraldo Groh', '(543) 587-8379', 34.16877, -77.87045, 8, true, true, false, true, 0);
INSERT INTO public.responder VALUES (2, 'Corey Bice', '(851) 700-6544', 34.18323, -77.84099, 17, false, true, false, true, 0);
INSERT INTO public.responder VALUES (3, 'Rashida Lacross', '(700) 249-3167', 34.23670, -77.83479, 9, true, true, false, true, 0);
INSERT INTO public.responder VALUES (4, 'Rocio Hice', '(517) 396-5681', 34.14338, -77.88274, 25, false, true, false, true, 0);
INSERT INTO public.responder VALUES (5, 'Sparkle Willmore', '(342) 943-7791', 34.29256, -77.86569, 28, true, true, false, true, 0);
INSERT INTO public.responder VALUES (6, 'Mei Spano', '(633) 744-4013', 34.12679, -77.87353, 4, false, true, false, true, 0);
INSERT INTO public.responder VALUES (7, 'Eliseo Mawson', '(797) 840-0926', 34.29515, -77.81463, 3, true, true, false, true, 0);
INSERT INTO public.responder VALUES (8, 'Claudia Hanes', '(600) 389-7216', 34.29103, -77.86601, 2, false, true, false, true, 0);
INSERT INTO public.responder VALUES (9, 'Anja Casselman', '(990) 634-8388', 34.24544, -77.83508, 3, true, true, false, true, 0);
INSERT INTO public.responder VALUES (10, 'Harold Hendrixson', '(329) 513-3438', 34.15140, -77.89115, 10, false, true, false, true, 0);
INSERT INTO public.responder VALUES (11, 'Dewayne Clauss', '(499) 868-1459', 34.12112, -77.94435, 12, true, true, false, true, 0);
INSERT INTO public.responder VALUES (12, 'Shannan Buttrey', '(286) 731-8930', 34.12579, -77.89562, 15, false, true, false, true, 0);
INSERT INTO public.responder VALUES (13, 'Celestina Earnshaw', '(582) 209-7903', 34.26845, -77.84534, 30, true, true, false, true, 0);
INSERT INTO public.responder VALUES (14, 'Hannah Rehn', '(996) 499-0839', 34.24732, -77.82757, 13, false, true, false, true, 0);
INSERT INTO public.responder VALUES (15, 'Petra Hinson', '(921) 801-5091', 34.15593, -77.88559, 25, true, true, false, true, 0);
INSERT INTO public.responder VALUES (16, 'Doreatha Hullett', '(497) 555-2913', 34.25137, -77.82163, 19, false, true, false, true, 0);
INSERT INTO public.responder VALUES (17, 'Peter Mcaninch', '(643) 225-2497', 34.28515, -77.81113, 29, true, true, false, true, 0);
INSERT INTO public.responder VALUES (18, 'Sonny Atkison', '(288) 849-0793', 34.22543, -77.89744, 7, false, true, false, true, 0);
INSERT INTO public.responder VALUES (19, 'Telma Gonzales', '(558) 397-9443', 34.21485, -77.88824, 27, true, true, false, true, 0);
INSERT INTO public.responder VALUES (20, 'Alona Ridout', '(842) 988-8925', 34.17537, -77.83297, 10, false, true, false, true, 0);
INSERT INTO public.responder VALUES (21, 'Christoper Fuss', '(967) 474-5325', 34.23755, -77.84025, 9, true, true, false, true, 0);
INSERT INTO public.responder VALUES (22, 'Lindy Delaune', '(905) 568-9815', 34.18062, -77.82813, 18, false, true, false, true, 0);
INSERT INTO public.responder VALUES (23, 'Otto Touchton', '(880) 576-8547', 34.28235, -77.83150, 27, true, true, false, true, 0);
INSERT INTO public.responder VALUES (24, 'Gisela Govan', '(995) 795-2951', 34.13362, -77.87096, 7, false, true, false, true, 0);
INSERT INTO public.responder VALUES (25, 'Berna Till', '(832) 593-9449', 34.22852, -77.88805, 7, true, true, false, true, 0);
INSERT INTO public.responder VALUES (26, 'Traci Beaver', '(586) 864-6802', 34.16838, -77.88663, 3, false, true, false, true, 0);
INSERT INTO public.responder VALUES (27, 'Marine Adamo', '(380) 525-1051', 34.13167, -77.87837, 12, true, true, false, true, 0);
INSERT INTO public.responder VALUES (28, 'Adela Wike', '(506) 955-4748', 34.13807, -77.85802, 28, false, true, false, true, 0);
INSERT INTO public.responder VALUES (29, 'Wendell Greene', '(416) 452-8335', 34.21333, -77.85895, 19, true, true, false, true, 0);
INSERT INTO public.responder VALUES (30, 'Ceola Kall', '(436) 460-6462', 34.22450, -77.83713, 11, false, true, false, true, 0);
INSERT INTO public.responder VALUES (31, 'Gianna Tuthill', '(505) 250-9534', 34.29357, -77.88581, 16, true, true, false, true, 0);
INSERT INTO public.responder VALUES (32, 'Priscilla Hardwick', '(382) 491-3858', 34.27320, -77.88904, 7, false, true, false, true, 0);
INSERT INTO public.responder VALUES (33, 'Ines Gooslin', '(695) 384-2573', 34.21410, -77.82393, 21, true, true, false, true, 0);
INSERT INTO public.responder VALUES (34, 'Sook Mathena', '(958) 289-0844', 34.25424, -77.82394, 15, false, true, false, true, 0);
INSERT INTO public.responder VALUES (35, 'Amee Faul', '(533) 375-4630', 34.13270, -77.87921, 8, true, true, false, true, 0);
INSERT INTO public.responder VALUES (36, 'Emily Fleetwood', '(701) 903-3734', 34.19344, -77.88434, 4, false, true, false, true, 0);
INSERT INTO public.responder VALUES (37, 'Euna Coppock', '(592) 522-2422', 34.18518, -77.85839, 16, true, true, false, true, 0);
INSERT INTO public.responder VALUES (38, 'Lashonda Obermiller', '(373) 718-9180', 34.21273, -77.85572, 28, false, true, false, true, 0);
INSERT INTO public.responder VALUES (39, 'Norene Zapata', '(691) 293-2880', 34.18795, -77.85355, 12, true, true, false, true, 0);
INSERT INTO public.responder VALUES (40, 'Dayna Dingee', '(834) 250-6624', 34.11156, -77.87990, 18, false, true, false, true, 0);
INSERT INTO public.responder VALUES (41, 'Katharina Madere', '(409) 833-5834', 34.28865, -77.89509, 3, true, true, false, true, 0);
INSERT INTO public.responder VALUES (42, 'Jean Ahumada', '(999) 479-9872', 34.21850, -77.85742, 17, false, true, false, true, 0);
INSERT INTO public.responder VALUES (43, 'Chastity Norby', '(422) 349-7974', 34.28592, -77.84217, 1, true, true, false, true, 0);
INSERT INTO public.responder VALUES (44, 'Gillian Raphael', '(419) 373-0022', 34.29912, -77.83962, 17, false, true, false, true, 0);
INSERT INTO public.responder VALUES (45, 'Dahlia Rennie', '(749) 987-4563', 34.26085, -77.85754, 10, true, true, false, true, 0);
INSERT INTO public.responder VALUES (46, 'Joellen Tant', '(363) 980-6631', 34.25637, -77.86583, 2, false, true, false, true, 0);
INSERT INTO public.responder VALUES (47, 'Basil Forward', '(243) 367-1728', 34.23781, -77.82313, 1, true, true, false, true, 0);
INSERT INTO public.responder VALUES (48, 'Margaretta Bechtol', '(502) 620-5788', 34.24184, -77.82697, 7, false, true, false, true, 0);
INSERT INTO public.responder VALUES (49, 'Meggan Ferretti', '(443) 585-9120', 34.21667, -77.84090, 24, true, true, false, true, 0);
INSERT INTO public.responder VALUES (50, 'Enid Cadet', '(814) 243-6428', 34.26045, -77.89394, 15, false, true, false, true, 0);
INSERT INTO public.responder VALUES (51, 'Adelia Choice', '(509) 648-9617', 34.27331, -77.83811, 14, true, true, false, true, 0);
INSERT INTO public.responder VALUES (52, 'Erlinda Shofner', '(475) 961-4806', 34.19029, -77.82106, 9, false, true, false, true, 0);
INSERT INTO public.responder VALUES (53, 'Mechelle Eyer', '(831) 934-5082', 34.27525, -77.81595, 11, true, true, false, true, 0);
INSERT INTO public.responder VALUES (54, 'Sherrell Fergerson', '(392) 659-1480', 34.27772, -77.83550, 1, false, true, false, true, 0);
INSERT INTO public.responder VALUES (55, 'German Woodland', '(860) 285-3842', 34.25019, -77.87182, 12, true, true, false, true, 0);
INSERT INTO public.responder VALUES (56, 'Terrence Tennyson', '(955) 988-5670', 34.11707, -77.94990, 7, false, true, false, true, 0);
INSERT INTO public.responder VALUES (57, 'Debera Taff', '(861) 728-6686', 34.26315, -77.85929, 18, true, true, false, true, 0);
INSERT INTO public.responder VALUES (58, 'Olivia Loveland', '(931) 310-2762', 34.13249, -77.86407, 12, false, true, false, true, 0);
INSERT INTO public.responder VALUES (59, 'Randa Havard', '(662) 374-6975', 34.23069, -77.82508, 25, true, true, false, true, 0);
INSERT INTO public.responder VALUES (60, 'Darell Bess', '(392) 701-4283', 34.28325, -77.89050, 3, false, true, false, true, 0);
INSERT INTO public.responder VALUES (61, 'Danny Kreitzer', '(221) 571-4237', 34.25963, -77.87289, 16, true, true, false, true, 0);
INSERT INTO public.responder VALUES (62, 'Tanner Sawtelle', '(323) 531-9871', 34.13516, -77.89807, 26, false, true, false, true, 0);
INSERT INTO public.responder VALUES (63, 'Hsiu Delk', '(545) 985-2364', 34.26474, -77.81976, 7, true, true, false, true, 0);
INSERT INTO public.responder VALUES (64, 'Ingeborg Shives', '(645) 318-0590', 34.23507, -77.81145, 6, false, true, false, true, 0);
INSERT INTO public.responder VALUES (65, 'Bradley Edgerton', '(933) 974-1694', 34.22267, -77.81822, 23, true, true, false, true, 0);
INSERT INTO public.responder VALUES (66, 'Shaunna Stumbaugh', '(803) 521-8853', 34.28085, -77.87028, 28, false, true, false, true, 0);
INSERT INTO public.responder VALUES (67, 'Vincenza Alberti', '(839) 501-7639', 34.15723, -77.88839, 1, true, true, false, true, 0);
INSERT INTO public.responder VALUES (68, 'Darrell Kies', '(539) 322-8127', 34.27059, -77.89015, 22, false, true, false, true, 0);
INSERT INTO public.responder VALUES (69, 'Roma Cummins', '(734) 342-4194', 34.27188, -77.83255, 26, true, true, false, true, 0);
INSERT INTO public.responder VALUES (70, 'Earlean Longacre', '(420) 437-0169', 34.26884, -77.87338, 13, false, true, false, true, 0);
INSERT INTO public.responder VALUES (71, 'Georgie Bucci', '(372) 915-7359', 34.27274, -77.85782, 3, true, true, false, true, 0);
INSERT INTO public.responder VALUES (72, 'Ida Vanderwal', '(757) 516-3383', 34.14713, -77.88061, 14, false, true, false, true, 0);
INSERT INTO public.responder VALUES (73, 'Rachael Saenger', '(760) 202-3388', 34.26952, -77.86032, 3, true, true, false, true, 0);
INSERT INTO public.responder VALUES (74, 'Arnita Defrank', '(981) 395-6881', 34.17767, -77.85476, 11, false, true, false, true, 0);
INSERT INTO public.responder VALUES (75, 'Summer Lamarche', '(231) 238-1277', 34.28241, -77.87475, 18, true, true, false, true, 0);
INSERT INTO public.responder VALUES (76, 'Orval Duarte', '(292) 463-0988', 34.22968, -77.88612, 26, false, true, false, true, 0);
INSERT INTO public.responder VALUES (77, 'Alyssa Younger', '(566) 575-1460', 34.22869, -77.83795, 19, true, true, false, true, 0);
INSERT INTO public.responder VALUES (78, 'Wonda Meador', '(476) 575-7278', 34.14738, -77.84503, 8, false, true, false, true, 0);
INSERT INTO public.responder VALUES (79, 'Jacquelynn Beauchemin', '(452) 454-9561', 34.14900, -77.91642, 11, true, true, false, true, 0);
INSERT INTO public.responder VALUES (80, 'Mandi Blessing', '(858) 280-5942', 34.27962, -77.85038, 29, false, true, false, true, 0);
INSERT INTO public.responder VALUES (81, 'Delbert Carty', '(779) 238-4184', 34.18426, -77.83705, 7, true, true, false, true, 0);
INSERT INTO public.responder VALUES (82, 'Tana Foulger', '(340) 806-8891', 34.29556, -77.87310, 11, false, true, false, true, 0);
INSERT INTO public.responder VALUES (83, 'Leonor Repka', '(658) 231-0984', 34.23763, -77.89170, 17, true, true, false, true, 0);
INSERT INTO public.responder VALUES (84, 'Columbus Haan', '(946) 573-9974', 34.24293, -77.89942, 28, false, true, false, true, 0);
INSERT INTO public.responder VALUES (85, 'Edythe Marmon', '(995) 360-6659', 34.25248, -77.82397, 3, true, true, false, true, 0);
INSERT INTO public.responder VALUES (86, 'Leisha Antonelli', '(486) 846-1619', 34.29972, -77.81515, 12, false, true, false, true, 0);
INSERT INTO public.responder VALUES (87, 'Van Owsley', '(793) 585-4983', 34.14343, -77.86994, 3, true, true, false, true, 0);
INSERT INTO public.responder VALUES (88, 'Tamara Stockman', '(603) 336-1722', 34.21988, -77.85591, 4, false, true, false, true, 0);
INSERT INTO public.responder VALUES (89, 'Vivienne Waters', '(971) 856-6855', 34.28171, -77.86502, 9, true, true, false, true, 0);
INSERT INTO public.responder VALUES (90, 'Jayson Boerner', '(587) 402-0993', 34.24520, -77.87987, 10, false, true, false, true, 0);
INSERT INTO public.responder VALUES (91, 'Chae Peralto', '(553) 348-0534', 34.23446, -77.89876, 28, true, true, false, true, 0);
INSERT INTO public.responder VALUES (92, 'Sharron Rowe', '(316) 307-2747', 34.29174, -77.85198, 11, false, true, false, true, 0);
INSERT INTO public.responder VALUES (93, 'Adrienne Hiner', '(539) 810-6973', 34.23047, -77.89127, 27, true, true, false, true, 0);
INSERT INTO public.responder VALUES (94, 'Pinkie Langstaff', '(386) 937-0152', 34.26726, -77.81489, 29, false, true, false, true, 0);
INSERT INTO public.responder VALUES (95, 'Cole Wiltz', '(790) 793-7075', 34.27177, -77.81052, 9, true, true, false, true, 0);
INSERT INTO public.responder VALUES (96, 'Jimmy Peterman', '(808) 998-8045', 34.21481, -77.88161, 11, false, true, false, true, 0);
INSERT INTO public.responder VALUES (97, 'Kyra Manzo', '(946) 639-4619', 34.23536, -77.86422, 20, true, true, false, true, 0);
INSERT INTO public.responder VALUES (98, 'Penni Mciver', '(584) 383-0968', 34.25881, -77.85262, 9, false, true, false, true, 0);
INSERT INTO public.responder VALUES (99, 'Gustavo Berra', '(441) 399-6229', 34.13046, -77.86591, 10, true, true, false, true, 0);
INSERT INTO public.responder VALUES (100, 'Luis Hazeltine', '(403) 434-8697', 34.28713, -77.93828, 24, false, true, false, true, 0);
INSERT INTO public.responder VALUES (101, 'Boyce Soller', '(554) 547-2709', 34.28495, -77.99200, 3, true, true, false, true, 0);
INSERT INTO public.responder VALUES (102, 'Wilford Phalen', '(936) 368-9269', 34.29079, -77.95484, 4, false, true, false, true, 0);
INSERT INTO public.responder VALUES (103, 'Sol Sharif', '(990) 610-1264', 34.21517, -77.91073, 10, true, true, false, true, 0);
INSERT INTO public.responder VALUES (104, 'Danial Sawicki', '(930) 497-4192', 34.15932, -77.94314, 16, false, true, false, true, 0);
INSERT INTO public.responder VALUES (105, 'Deshawn Sears', '(822) 307-0882', 34.24839, -77.99863, 16, true, true, false, true, 0);
INSERT INTO public.responder VALUES (106, 'Lonny Puleo', '(211) 993-8005', 34.27161, -77.95439, 4, false, true, false, true, 0);
INSERT INTO public.responder VALUES (107, 'Jamie Mccombs', '(624) 965-0549', 34.21105, -77.93218, 4, true, true, false, true, 0);
INSERT INTO public.responder VALUES (108, 'Whitney Raschke', '(248) 962-4771', 34.12347, -77.94362, 15, false, true, false, true, 0);
INSERT INTO public.responder VALUES (109, 'Stewart Faux', '(661) 623-1594', 34.28610, -77.91644, 27, true, true, false, true, 0);
INSERT INTO public.responder VALUES (110, 'Cordell Snodgrass', '(222) 363-1790', 34.27504, -77.93455, 21, false, true, false, true, 0);
INSERT INTO public.responder VALUES (111, 'Terrence Mccotter', '(447) 792-9359', 34.16896, -77.93074, 27, true, true, false, true, 0);
INSERT INTO public.responder VALUES (112, 'Thanh Vanderzee', '(429) 381-7297', 34.26455, -77.95887, 23, false, true, false, true, 0);
INSERT INTO public.responder VALUES (113, 'Mary Brugman', '(964) 480-7912', 34.21879, -77.97400, 2, true, true, false, true, 0);
INSERT INTO public.responder VALUES (114, 'Nathaniel Buczek', '(750) 970-9469', 34.25560, -77.96705, 15, false, true, false, true, 0);
INSERT INTO public.responder VALUES (115, 'Lowell Kulinski', '(564) 929-8683', 34.25102, -77.97634, 17, true, true, false, true, 0);
INSERT INTO public.responder VALUES (116, 'Desmond Alvelo', '(254) 582-8712', 34.22614, -77.97175, 8, false, true, false, true, 0);
INSERT INTO public.responder VALUES (117, 'Ulysses Amos', '(508) 794-5081', 34.11746, -77.91521, 24, true, true, false, true, 0);
INSERT INTO public.responder VALUES (118, 'Dennis Sandquist', '(633) 813-6097', 34.28015, -77.98507, 25, false, true, false, true, 0);
INSERT INTO public.responder VALUES (119, 'Alonzo Bridgett', '(928) 592-9548', 34.19878, -77.91638, 3, true, true, false, true, 0);
INSERT INTO public.responder VALUES (120, 'Jamel Buscemi', '(625) 785-9597', 34.25999, -77.97633, 21, false, true, false, true, 0);
INSERT INTO public.responder VALUES (121, 'Arden Laurich', '(359) 914-4913', 34.14557, -77.95200, 9, true, true, false, true, 0);
INSERT INTO public.responder VALUES (122, 'Filiberto Vaughan', '(374) 280-1859', 34.13402, -77.93135, 18, false, true, false, true, 0);
INSERT INTO public.responder VALUES (123, 'Dalton Mcmahon', '(509) 707-7850', 34.24775, -77.92075, 23, true, true, false, true, 0);
INSERT INTO public.responder VALUES (124, 'Vito Maskell', '(817) 320-5389', 34.14577, -77.93073, 13, false, true, false, true, 0);
INSERT INTO public.responder VALUES (125, 'Loren Winebarger', '(993) 978-9077', 34.16527, -77.92232, 9, true, true, false, true, 0);
INSERT INTO public.responder VALUES (126, 'Dino Hollingshead', '(922) 281-5056', 34.21807, -77.95796, 6, false, true, false, true, 0);
INSERT INTO public.responder VALUES (127, 'Jerrold Hayles', '(364) 673-3551', 34.28799, -77.91497, 24, true, true, false, true, 0);
INSERT INTO public.responder VALUES (128, 'Abram Leer', '(580) 699-8513', 34.18810, -77.97280, 21, false, true, false, true, 0);
INSERT INTO public.responder VALUES (129, 'Ed Haltom', '(376) 266-0568', 34.16427, -77.93684, 20, true, true, false, true, 0);
INSERT INTO public.responder VALUES (130, 'Chase Tedford', '(970) 554-1951', 34.26366, -77.95369, 24, false, true, false, true, 0);
INSERT INTO public.responder VALUES (131, 'Ray Meyerhoff', '(983) 258-8983', 34.16521, -77.95993, 27, true, true, false, true, 0);
INSERT INTO public.responder VALUES (132, 'Augustus Nevius', '(440) 791-2938', 34.17972, -77.99047, 18, false, true, false, true, 0);
INSERT INTO public.responder VALUES (133, 'Jc Reamer', '(926) 675-2467', 34.19061, -77.96396, 13, true, true, false, true, 0);
INSERT INTO public.responder VALUES (134, 'Tyler Raysor', '(290) 616-3513', 34.23965, -77.98157, 6, false, true, false, true, 0);
INSERT INTO public.responder VALUES (135, 'Jeffery Wisner', '(377) 681-4450', 34.18750, -77.99419, 7, true, true, false, true, 0);
INSERT INTO public.responder VALUES (136, 'Jackson Zehner', '(673) 317-3730', 34.22748, -77.93825, 16, false, true, false, true, 0);
INSERT INTO public.responder VALUES (137, 'Bret Seedorf', '(826) 630-9083', 34.24041, -77.93466, 3, true, true, false, true, 0);
INSERT INTO public.responder VALUES (138, 'Eloy Grego', '(865) 475-4210', 34.21071, -77.97218, 15, false, true, false, true, 0);
INSERT INTO public.responder VALUES (139, 'Maynard Ramsier', '(806) 618-6411', 34.28772, -77.97932, 21, true, true, false, true, 0);
INSERT INTO public.responder VALUES (140, 'Sal Delatte', '(210) 262-9347', 34.18098, -77.98539, 20, false, true, false, true, 0);
INSERT INTO public.responder VALUES (141, 'Colby Riney', '(709) 993-4859', 34.14627, -77.99020, 23, true, true, false, true, 0);
INSERT INTO public.responder VALUES (142, 'Christoper Hinrichs', '(939) 674-0597', 34.28673, -77.91908, 12, false, true, false, true, 0);
INSERT INTO public.responder VALUES (143, 'Murray Wixon', '(660) 769-1251', 34.17898, -77.93643, 14, true, true, false, true, 0);
INSERT INTO public.responder VALUES (144, 'Edgar Vina', '(774) 834-6186', 34.28847, -77.99952, 7, false, true, false, true, 0);
INSERT INTO public.responder VALUES (145, 'Owen Breeden', '(742) 904-6598', 34.28340, -77.97876, 18, true, true, false, true, 0);
INSERT INTO public.responder VALUES (146, 'Mohammad Hazlitt', '(528) 274-3309', 34.23515, -77.92913, 18, false, true, false, true, 0);
INSERT INTO public.responder VALUES (147, 'Jimmie Whetzel', '(562) 830-3609', 34.29451, -77.93194, 8, true, true, false, true, 0);
INSERT INTO public.responder VALUES (148, 'Shawn Hamiter', '(861) 243-8557', 34.23012, -77.98727, 23, false, true, false, true, 0);
INSERT INTO public.responder VALUES (149, 'Jacinto Tait', '(957) 452-5703', 34.23053, -77.96972, 15, true, true, false, true, 0);
INSERT INTO public.responder VALUES (150, 'Luke Velasques', '(484) 387-1027', 34.29919, -77.92724, 19, false, true, false, true, 0);

--
-- Name: responder_sequence; Type: SEQUENCE SET; Schema: public; Owner: naps
--

SELECT pg_catalog.setval('public.responder_sequence', 150, true);


--
-- Name: responder responder_pkey; Type: CONSTRAINT; Schema: public; Owner: naps
--

ALTER TABLE ONLY public.responder
    ADD CONSTRAINT responder_pkey PRIMARY KEY (responder_id);


--
-- Name: reported_incident reported_incident_pkey; Type: CONSTRAINT; Schema: public; Owner: naps
--

ALTER TABLE ONLY public.reported_incident
    ADD CONSTRAINT reported_incident_pkey PRIMARY KEY (id);


--
-- Name: idx_reported_incident_incident_id; Type: INDEX; Schema: public; Owner: naps                                            
--

CREATE INDEX idx_reported_incident_incident_id ON public.reported_incident USING btree (incident_id); 

--
-- Name: idx_reported_incident_victim_name; Type: INDEX; Schema: public; Owner: naps
--

CREATE INDEX idx_reported_incident_victim_name ON public.reported_incident USING btree (victim_name);

--
-- PostgreSQL database dump complete
--

