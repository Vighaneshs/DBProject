USE jungle_library_db;

DROP TABLE IF EXISTS INQUIRY;

CREATE TABLE INQUIRY (
    Inquiry_ID VARCHAR(10) PRIMARY KEY,
    Inquiry_Time DATETIME,     
    Resolution_Status VARCHAR(30)
);

