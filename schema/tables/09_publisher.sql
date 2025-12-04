USE jungle_library_db;

DROP TABLE IF EXISTS PUBLISHER;

CREATE TABLE PUBLISHER (
    Publisher_ID CHAR(4) NOT NULL,
    Publisher_Name VARCHAR(50) NOT NULL,
    PRIMARY KEY (Publisher_ID)
);
