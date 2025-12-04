USE jungle_library_db;

DROP TABLE IF EXISTS PROMOTION;

CREATE TABLE PROMOTION (
    Promotion_Code VARCHAR(20) PRIMARY KEY,
    Description TEXT
);
