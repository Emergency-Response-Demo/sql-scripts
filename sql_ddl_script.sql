CREATE SEQUENCE reporter_sequence START 1;
CREATE SEQUENCE responder_sequence START 1;
CREATE SEQUENCE incident_sequence START 1;
CREATE SEQUENCE mission_sequence START 1;


CREATE TABLE Responder (responder_id integer PRIMARY KEY DEFAULT nextval('responder_sequence'), responder_name text, responder_phone_number text, responder_current_gps_lat double precision, responder_current_gps_long double precision, boat_capacity int, has_medical_kit boolean );
ALTER SEQUENCE responder_sequence OWNED BY Responder.responder_id;

CREATE TABLE Reporter ( reporter_id integer PRIMARY KEY DEFAULT nextval('reporter_sequence'), responder_name text, need_medical_assistance boolean);
ALTER SEQUENCE reporter_sequence OWNED BY Reporter.reporter_id;

CREATE TABLE Incident ( incident_id integer PRIMARY KEY DEFAULT nextval('incident_sequence'), report_id integer references REPORTER, gps_lat double precision, gps_long double precision,number_of_people integer, medical_need boolean, report_time timestamp);
ALTER SEQUENCE incident_sequence OWNED BY Incident.incident_id;

CREATE TYPE status AS ENUM ('Requested','Assigned','Pickedup','Cancelled','Rescued');

CREATE TABLE Mission ( mission_id integer PRIMARY KEY DEFAULT nextval('mission_sequence'), responder_id integer references RESPONDER, incident_id integer references INCIDENT, last_update date, current_status status);
ALTER SEQUENCE mission_sequence OWNED BY Mission.mission_id;
