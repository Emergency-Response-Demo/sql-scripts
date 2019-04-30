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
    INCREMENT BY 1
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
-- Name: responder responder_id; Type: DEFAULT; Schema: public; Owner: naps
--

ALTER TABLE ONLY public.responder ALTER COLUMN responder_id SET DEFAULT nextval('public.responder_sequence'::regclass);


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
-- PostgreSQL database dump complete
--

