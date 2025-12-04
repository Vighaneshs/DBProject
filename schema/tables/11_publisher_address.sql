USE jungle_library_db;

DROP TABLE IF EXISTS PUBLISHER_ADDRESS;

CREATE TABLE PUBLISHER_ADDRESS (
    Publisher_ID CHAR(4),
    Publisher_Address VARCHAR(100),
    PRIMARY KEY (Publisher_ID, Publisher_Address),
    FOREIGN KEY (Publisher_ID) REFERENCES PUBLISHER(Publisher_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
