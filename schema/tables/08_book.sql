USE jungle_library_db;

DROP TABLE IF EXISTS BOOK;

CREATE TABLE BOOK (
    Book_ID CHAR(10) NOT NULL,
    Book_Title VARCHAR(50) NOT NULL,
    Category VARCHAR(20),
    Synopsis TEXT,
    Publisher_ID CHAR(4),
    PRIMARY KEY (Book_ID),
    FOREIGN KEY (Publisher_ID) REFERENCES PUBLISHER(Publisher_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
