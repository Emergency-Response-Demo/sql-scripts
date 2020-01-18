
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
    responseTimeSecondsPickup integer DEFAULT 0,
    responseTimeSecondsDropoff integer DEFAULT 0,
    responseTimeSecondsTotal integer DEFAULT 0
);
ALTER TABLE public.MissionReport OWNER TO naps;

ALTER TABLE ONLY public.MissionReport
    ADD CONSTRAINT missionReport_pkey PRIMARY KEY (id);

INSERT INTO public.MissionReport VALUES ('aa10850e-0ac9-4bd0-9012-92fc964b0108','COMPLETED','5e5644a8-ca83-4ec3-b601-cea2c088115c',1,'Geraldo Groh',true,8,4.34,2.15,6.49,300,350,650);
INSERT INTO public.MissionReport VALUES ('aa10850e-0ac9-4bd0-9042-92fc964b0108','COMPLETED','5e5644a8-cb83-4ec3-b601-cea2c088115c',1,'Geraldo Groh',true,6,4.34,2.15,6.49,300,305,605);
INSERT INTO public.MissionReport VALUES ('ba10850e-0ac9-4bd0-9042-92fc964b0108','COMPLETED','4e5644a8-cb83-4ec3-b601-cea2c088115c',1,'Geraldo Groh',true,9,2.34,1.15,3.49,200,150,350);

INSERT INTO public.MissionReport VALUES ('aa10850e-0ac9-4bd0-9012-92fc964b0294','COMPLETED','5e5644a8-ca83-4ec3-b601-cea2c088125c',2, 'Corey Bice',true,8,4.34,2.15,6.49,300,350,650);
INSERT INTO public.MissionReport VALUES ('na10850e-0ac9-4bd0-9012-92fc964b0294','COMPLETED','5k5644a8-ca83-4ec3-b601-cea2c088125c',2, 'Corey Bice',true,3,3.34,2.15,5.49,210,250,460);
INSERT INTO public.MissionReport VALUES ('ra10850e-0ac9-4bd0-9012-92fc964b0294','COMPLETED','5d5644a8-ca83-4ec3-b601-cea2c088125c',2, 'Corey Bice',true,6,1.24,1.15,3.39,200,250,450);

INSERT INTO public.MissionReport VALUES ('aa10850e-0ac9-4bd0-9012-92fc964b0388','COMPLETED','5e5644a8-ca83-4ec3-b601-cea2c088135c',3, 'Rashida Lacross',true,8,4.34,2.15,6.49,300,350,650);
INSERT INTO public.MissionReport VALUES ('aa10830e-0ac9-4bd0-9012-92fc964b0388','FAILED','5e5644a8-ca83-lec3-b601-cea2c088135c',3, 'Rashida Lacross',true,0,0.34,1.15,1.49,0,0,0);
INSERT INTO public.MissionReport VALUES ('aa10950e-0ac9-4bd0-9012-92fc964b0388','UPDATED','5e5644a8-ca83-4ec3-b601-cea2v088135c',3, 'Rashida Lacross',true,0,1.34,4.15,5.49,190,0,0);

INSERT INTO public.MissionReport VALUES ('aa10850e-0ac9-4bd0-9012-92fc964b0477','COMPLETED','5e5644a8-ca83-4ec3-b601-cea2c088145c',4, 'Rocio Hice',true,8,4.34,2.15,6.49,300,350,650);
INSERT INTO public.MissionReport VALUES ('aa10859e-0ac9-4bd0-9n12-92fc964b0477','COMPLETED','5e5b44a8-ca83-4ec3-b501-cea2c078145c',4, 'Rocio Hice',true,3,2.34,1.15,3.49,720,350,1070);

INSERT INTO public.MissionReport VALUES ('aa10850e-0ac9-4bd0-9012-92fc964b0568','COMPLETED','5e5644a8-ca83-4ec3-b601-cea2c088155c',5, 'Sparkle Willmore',true,8,4.34,2.15,6.49,300,350,650);
INSERT INTO public.MissionReport VALUES ('aa10850e-0ac9-4bd0-9012-92fc964b0659','COMPLETED','5e5644a8-ca83-4ec3-b601-cea2c088165c',6, 'Mei Spano',true,8,4.34,2.15,6.49,300,350,650);
INSERT INTO public.MissionReport VALUES ('aa10850e-0ac9-4bd0-9012-92fc964b0748','COMPLETED','5e5644a8-ca83-4ec3-b601-cea2c088175c',7, 'Eliseo Mawson',true,8,4.34,2.15,6.49,100,120,220);
INSERT INTO public.MissionReport VALUES ('aa10850e-0ac9-4bd0-9012-92fc964b0833','COMPLETED','5e5644a8-ca83-4ec3-b601-cea2c088185c',8, 'Claudia Hanes',true,8,4.34,2.15,6.49,100,350,450);
INSERT INTO public.MissionReport VALUES ('aa10850e-0ac9-4bd0-9012-92fc964b0921','CREATED','5e5644a8-ca83-4ec3-b601-cea2c088195c',9, 'Anja Casselman',true,0,4.34,2.15,6.49,0,0,0);
INSERT INTO public.MissionReport VALUES ('aa10850e-0ac9-4bd0-9012-92fc964b0018','CREATED','5e5644a8-ca83-4ec3-b601-cea2c088105c',10, 'Harold Hendrixson',true,0,4.34,2.15,6.49,0,0,0);
