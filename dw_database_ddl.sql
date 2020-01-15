
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
    responseTimeSecondesPickup integer DEFAULT 0,
    responseTimeSecondsDropoff integer DEFAULT 0,
    responseTimeSecondsTotal integer DEFAULT 0
);

ALTER TABLE public.MissionReport OWNER TO naps;

ALTER TABLE ONLY public.MissionReport
    ADD CONSTRAINT missionReport_pkey PRIMARY KEY (id);
