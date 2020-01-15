
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

CREATE TABLE public.MissionReport (
    id character varying(255),
    status character varying(255),
    incidentId character varying(255),
    responderId character varying(255),
    responderFullName character varying(255),
    responderHasMedicalKit boolean DEFAULT false,
    numberRescued integer DEFAULT 0,
    responderDistancePickup bigint DEFAULT 0,
    responderDistanceDropoff bigint DEFAULT 0,
    responderDistanceTotal bigint DEFAULT 0,
    responseTimePickup timestamp(3) without time zone,
    responseTimeDropoff timestamp(3) without time zone,
    responseTimeTotal timestamp(3) without time zone
);

ALTER TABLE public.MissionReport OWNER TO naps;

ALTER TABLE ONLY public.MissionReport
    ADD CONSTRAINT responder_pkey PRIMARY KEY (id);
