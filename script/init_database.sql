/*
=============================================================
Create Database and Schemas
=============================================================
Script Purpose:
    This script creates a new database named 'datawarehouse'.
    If the database exists, it is dropped and recreated. Additionally,
    the script sets up three schemas within the database:
    'bronze', 'silver', and 'gold'.

WARNING:
    Running this script will drop the entire 'datawarehouse' database
    if it exists. All data in the database will be permanently deleted.
    Proceed with caution and ensure you have proper backups.

Usage (psql):
    Part 1 is run while connected to the 'postgres' database.
    Part 2 is run after connecting to the 'datawarehouse' database.
*/

-- =============================================================
-- PART 1: Run while connected to the 'postgres' database
-- =============================================================

-- Terminate all active connections to the target database
SELECT pg_terminate_backend(pid)
FROM pg_stat_activity
WHERE datname = 'datawarehouse'
  AND pid <> pg_backend_pid();

-- Drop and recreate the database
DROP DATABASE IF EXISTS datawarehouse;
CREATE DATABASE datawarehouse;

-- Switch connection to the new database (psql meta-command)
\c datawarehouse

-- =============================================================
-- PART 2: Run while connected to 'datawarehouse'
-- =============================================================

-- Create Schemas
CREATE SCHEMA IF NOT EXISTS bronze;
CREATE SCHEMA IF NOT EXISTS silver;
CREATE SCHEMA IF NOT EXISTS gold;
