USE jungle_library_db;

DROP TABLE IF EXISTS TRAINER;

CREATE TABLE TRAINER (
    Trainer_ID INT AUTO_INCREMENT PRIMARY KEY,
    Trainer_Job ENUM('LibrarySupervisor', 'CatalogingManager') NOT NULL
);




