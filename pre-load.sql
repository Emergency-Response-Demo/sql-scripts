CREATE ROLE naps with PASSWORD 'naps' LOGIN NOSUPERUSER INHERIT CREATEDB CREATEROLE NOREPLICATION;
CREATE DATABASE naps_emergency_response OWNER naps;

\q

# psql -U naps -d naps_emergency_response -1 -f naps_emergency_response_with_data.sql

