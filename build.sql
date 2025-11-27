-- =============================================
-- Build Script: E-Commerce Database
-- This file must be run from command line, NOT from MySQL client
-- Run: mysql -u username -p < build.sql
-- =============================================

DROP DATABASE IF EXISTS jungle_library_db;

-- Database Creation
source schema/tables/00_database.sql;

-- Tables
source schema/tables/01_person.sql;

-- Views
source schema/views/view_top_gold_member.sql;

-- Sample Data
source data/sample_data.sql;

-- Build Complete
SELECT 'Database build complete!' AS status;
