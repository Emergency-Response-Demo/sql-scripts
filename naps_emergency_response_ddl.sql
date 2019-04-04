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
-- Name: reported_incident reported_incident_pkey; Type: CONSTRAINT; Schema: public; Owner: naps
--

ALTER TABLE ONLY public.reported_incident
    ADD CONSTRAINT reported_incident_pkey PRIMARY KEY (id);


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
-- Name: idx_reported_incident_incident_id; Type: INDEX; Schema: public; Owner: naps                                            
--

CREATE INDEX idx_reported_incident_incident_id ON public.reported_incident USING btree (incident_id); 

--
-- PostgreSQL database dump complete
--

