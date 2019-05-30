CREATE ROLE naps with PASSWORD 'naps' LOGIN NOSUPERUSER INHERIT CREATEDB CREATEROLE NOREPLICATION;
CREATE DATABASE emergency_response_demo OWNER naps;

\q

# psql -U naps -d emergency_response_demo -1 -f emergency_response_demo_with_data.sql

