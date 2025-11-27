DROP DATABASE IF EXISTS jungle_library_db;

SOURCE schema/tables/00_database.sql;

-- ADD THE TABLE YOU CREATE HERE
SOURCE schema/tables/01_person.sql;

-- ADD THE View here
SOURCE schema/views/view_top_gold_member.sql;

-- Data file
SOURCE data/sample_data.sql;

-- =============================================
-- Build Complete!
-- =============================================
SELECT 'Database build complete!' AS status;
