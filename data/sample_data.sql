USE jungle_library_db;

-- ==============================================
-- SAMPLE DATA FOR JUNGLE LIBRARY DATABASE
-- Respects all foreign keys, constraints, and enums
-- ==============================================
-- ==============================================

-- ---------------------------------------------
-- 1. PERSON (Base table - no dependencies)
-- Person_ID format: P### (enforced by CHECK constraint)
-- ---------------------------------------------
INSERT INTO PERSON (Person_ID, Fname, MName, LName, Address, Gender, DOB) VALUES
('P001', 'John', 'Michael', 'Smith', '123 Oak Street, Portland, OR', 'M', '1985-03-15'),
('P002', 'Emily', 'Rose', 'Johnson', '456 Maple Ave, Seattle, WA', 'F', '1990-07-22'),
('P003', 'David', 'James', 'Williams', '789 Pine Road, Eugene, OR', 'M', '1988-11-30'),
('P004', 'Sarah', 'Ann', 'Brown', '321 Elm Street, Portland, OR', 'F', '1992-05-18'),
('P005', 'Michael', NULL, 'Davis', '654 Cedar Lane, Bend, OR', 'M', '1987-09-10'),
('P006', 'Jessica', 'Marie', 'Miller', '987 Birch Court, Salem, OR', 'F', '1995-02-28'),
('P007', 'Robert', 'Lee', 'Wilson', '147 Spruce Drive, Corvallis, OR', 'M', '1983-12-05'),
('P008', 'Amanda', 'Lynn', 'Moore', '258 Willow Way, Astoria, OR', 'F', '1991-08-14'),
('P009', 'Christopher', 'Paul', 'Taylor', '369 Ash Boulevard, Medford, OR', 'M', '1989-04-25'),
('P010', 'Jennifer', 'Kay', 'Anderson', '741 Fir Street, Portland, OR', 'F', '1993-10-12'),
('P011', 'Daniel', 'Scott', 'Thomas', '852 Oak Avenue, Eugene, OR', 'M', '1986-06-08'),
('P012', 'Lisa', 'Marie', 'Jackson', '963 Maple Drive, Bend, OR', 'F', '1994-01-20'),
('P013', 'Matthew', 'John', 'White', '159 Pine Lane, Salem, OR', 'M', '1984-07-30'),
('P014', 'Michelle', 'Anne', 'Harris', '357 Elm Road, Portland, OR', 'F', '1996-11-15'),
('P015', 'James', 'William', 'Martin', '486 Cedar Court, Seattle, WA', 'M', '1982-03-22'),
('P026', 'Mihelle', 'Annwee', 'Harris', '357 Elm Road, Portland, OR', 'F', '2020-11-15');

-- ---------------------------------------------
-- 2. PERSON_PHONE_NUMBER (Depends on PERSON)
-- ---------------------------------------------
INSERT INTO PERSON_PHONE_NUMBER (Person_ID, Phone_Number) VALUES
('P001', '503-555-0101'),
('P001', '503-555-0102'),  -- Person can have multiple phones
('P002', '206-555-0201'),
('P003', '541-555-0301'),
('P004', '503-555-0401'),
('P005', '541-555-0501'),
('P006', '503-555-0601'),
('P007', '541-555-0701'),
('P008', '503-555-0801'),
('P009', '541-555-0901'),
('P010', '503-555-1001'),
('P011', '541-555-1101'),
('P012', '541-555-1201'),
('P013', '503-555-1301'),
('P014', '503-555-1401'),
('P015', '206-555-1501');

-- ---------------------------------------------
-- 3. MEMBER (Depends on PERSON)
-- Member_type: ENUM('silver', 'gold')
-- ---------------------------------------------
INSERT INTO MEMBER (Member_ID, Member_type, Card_ID) VALUES
('P001', 'gold', 'CARD-G-001'),
('P002', 'silver', 'CARD-S-002'),
('P003', 'gold', 'CARD-G-003'),
('P004', 'silver', 'CARD-S-004'),
('P005', 'gold', 'CARD-G-005'),
('P006', 'silver', 'CARD-S-006'),
('P007', 'gold', 'CARD-G-007'),
('P008', 'silver', 'CARD-S-008'),
('P009', 'gold', 'CARD-G-009'),
('P010', 'silver', 'CARD-S-010');

-- ---------------------------------------------
-- 4. CARD_DETAIL (Depends on MEMBER)
-- Card_Issue_Date represents membership enrollment date
-- ---------------------------------------------
INSERT INTO CARD_DETAIL (Card_ID, Card_Issue_Date) VALUES
('CARD-G-001', '2023-11-15'),  -- P001 - Gold member (enrolled Nov 2023)
('CARD-S-002', '2023-12-20'),  -- P002 - Silver member (enrolled Dec 2023)
('CARD-G-003', '2023-03-10'),  -- P003 - Gold member
('CARD-S-004', '2023-12-05'),  -- P004 - Silver member (enrolled Dec 2023)
('CARD-G-005', '2023-05-12'),  -- P005 - Gold member
('CARD-S-006', '2023-06-18'),  -- P006 - Silver member
('CARD-G-007', '2023-07-22'),  -- P007 - Gold member
('CARD-S-008', '2023-08-30'),  -- P008 - Silver member
('CARD-G-009', '2023-09-14'),  -- P009 - Gold member
('CARD-S-010', '2023-10-25');  -- P010 - Silver member

-- ---------------------------------------------
-- 5. PROMOTION (No dependencies)
-- ---------------------------------------------
INSERT INTO PROMOTION (Promotion_Code, Description) VALUES
('PROMO2024WINTER', 'Winter 2024 - 20% off late fees for all members'),
('PROMO2024SUMMER', 'Summer Reading Program - Free book rental'),
('NEWMEMBER15', 'New member discount - 15% off first month'),
('LOYALTY2024', 'Loyalty reward - 1 month free membership'),
('HOLIDAY2024', 'Holiday special - Buy 2 months, get 1 free');

-- ---------------------------------------------
-- 6. CARD_PROMOTION (Depends on CARD_DETAIL and PROMOTION)
-- ---------------------------------------------
INSERT INTO CARD_PROMOTION (Card_ID, Promotion_Code) VALUES
('CARD-G-001', 'PROMO2024WINTER'),
('CARD-G-001', 'LOYALTY2024'),  -- Card can have multiple promotions
('CARD-S-002', 'NEWMEMBER15'),
('CARD-G-003', 'PROMO2024SUMMER'),
('CARD-S-004', 'NEWMEMBER15'),
('CARD-G-005', 'LOYALTY2024'),
('CARD-S-006', 'PROMO2024WINTER'),
('CARD-G-007', 'HOLIDAY2024'),
('CARD-S-008', 'NEWMEMBER15'),
('CARD-G-009', 'PROMO2024SUMMER');

-- ---------------------------------------------
-- 7. GUEST (Depends on MEMBER - only gold members)
-- ---------------------------------------------
INSERT INTO GUEST (Gold_Member_ID, Guest_ID, Guest_Name, Guest_Address, Guest_Contact_Info) VALUES
('P001', 'G001', 'Alice Thompson', '125 Oak Street, Portland, OR', '503-555-9001'),
('P001', 'G002', 'Bob Richardson', '127 Oak Street, Portland, OR', '503-555-9002'),
('P003', 'G001', 'Carol Martinez', '791 Pine Road, Eugene, OR', '541-555-9003'),
('P005', 'G001', 'Frank Garcia', '656 Cedar Lane, Bend, OR', '541-555-9004'),
('P007', 'G001', 'Grace Robinson', '149 Spruce Drive, Corvallis, OR', '541-555-9005'),
('P009', 'G001', 'Henry Clark', '371 Ash Boulevard, Medford, OR', '541-555-9006');

-- ---------------------------------------------
-- 8. PUBLISHER (No dependencies)
-- ---------------------------------------------
INSERT INTO PUBLISHER (Publisher_ID, Publisher_Name) VALUES
('PUB1', 'Penguin Random House'),
('PUB2', 'HarperCollins Publishers'),
('PUB3', 'Simon & Schuster'),
('PUB4', 'Macmillan Publishers'),
('PUB5', 'Hachette Book Group'),
('PUB6', 'Scholastic Corporation'),
('PUB7', 'Pearson Education'),
('PUB8', 'Oxford University Press');

-- ---------------------------------------------
-- 9. PUBLISHER_PHONE (Depends on PUBLISHER)
-- ---------------------------------------------
INSERT INTO PUBLISHER_PHONE (Publisher_ID, Phone_Number) VALUES
('PUB1', '212-555-1000'),
('PUB1', '212-555-1001'),
('PUB2', '212-555-2000'),
('PUB3', '212-555-3000'),
('PUB4', '646-555-4000'),
('PUB5', '212-555-5000'),
('PUB6', '212-555-6000'),
('PUB7', '201-555-7000'),
('PUB8', '212-555-8000');

-- ---------------------------------------------
-- 10. PUBLISHER_ADDRESS (Depends on PUBLISHER)
-- ---------------------------------------------
INSERT INTO PUBLISHER_ADDRESS (Publisher_ID, Publisher_Address) VALUES
('PUB1', '1745 Broadway, New York, NY 10019'),
('PUB2', '195 Broadway, New York, NY 10007'),
('PUB3', '1230 Avenue of the Americas, New York, NY 10020'),
('PUB4', '120 Broadway, New York, NY 10271'),
('PUB5', '1290 Avenue of the Americas, New York, NY 10104'),
('PUB6', '557 Broadway, New York, NY 10012'),
('PUB7', 'One Lake Street, Upper Saddle River, NJ 07458'),
('PUB8', '198 Madison Avenue, New York, NY 10016');

-- ---------------------------------------------
-- 11. BOOK (Depends on PUBLISHER)
-- ---------------------------------------------
INSERT INTO BOOK (Book_ID, Book_Title, Category, Synopsis, Publisher_ID) VALUES
('BK00000001', 'To Kill a Mockingbird', 'Fiction', 'A gripping tale of racial injustice and childhood innocence in the American South.', 'PUB2'),
('BK00000002', '1984', 'Science Fiction', 'A dystopian social science fiction novel and cautionary tale about totalitarianism.', 'PUB1'),
('BK00000003', 'Pride and Prejudice', 'Romance', 'A romantic novel of manners that critiques the British landed gentry at the end of the 18th century.', 'PUB1'),
('BK00000004', 'The Great Gatsby', 'Fiction', 'A novel about the American dream and the roaring twenties.', 'PUB3'),
('BK00000005', 'Harry Potter: Philosopher Stone', 'Fantasy', 'A young wizard discovers his magical heritage on his 11th birthday.', 'PUB6'),
('BK00000006', 'The Catcher in the Rye', 'Fiction', 'A story about teenage rebellion and alienation.', 'PUB4'),
('BK00000007', 'Lord of the Rings', 'Fantasy', 'An epic high-fantasy novel about the quest to destroy the One Ring.', 'PUB5'),
('BK00000008', 'The Hobbit', 'Fantasy', 'A tale of Bilbo Baggins adventure to win a share of treasure guarded by a dragon.', 'PUB5'),
('BK00000009', 'Animal Farm', 'Fiction', 'An allegorical novella reflecting events leading up to the Russian Revolution.', 'PUB1'),
('BK00000010', 'Brave New World', 'Science Fiction', 'A dystopian novel set in a futuristic World State of genetically modified citizens.', 'PUB2'),
('BK00000011', 'The Chronicles of Narnia', 'Fantasy', 'A series of fantasy novels set in the fictional realm of Narnia.', 'PUB2'),
('BK00000012', 'Fahrenheit 451', 'Science Fiction', 'A dystopian novel about a future where books are outlawed.', 'PUB3'),
('BK00000013', 'Introduction to Algorithms', 'Technology', 'Comprehensive introduction to the modern study of computer algorithms.', 'PUB7'),
('BK00000014', 'A Brief History of Time', 'Science', 'Explores cosmology, black holes, and the nature of time.', 'PUB1'),
('BK00000015', 'Sapiens', 'History', 'A narrative history of humankind from the Stone Age to the modern age.', 'PUB2');

-- ---------------------------------------------
-- 12. COMMENTS (Depends on PERSON and BOOK)
-- For BestRatingPublisher view - ensuring some publishers have all books rated 4+
-- ---------------------------------------------
INSERT INTO COMMENTS (Person_ID, Book_ID, Comment_Time, Rating, Content) VALUES
-- Comments on books from various publishers
('P001', 'BK00000001', '2024-01-15 10:30:00', 5, 'An absolute masterpiece! The storytelling is phenomenal.'),
('P002', 'BK00000002', '2024-01-20 14:45:00', 5, 'Eerily prophetic. A must-read for everyone.'),
('P003', 'BK00000003', '2024-02-05 09:15:00', 4, 'Delightful romance with witty dialogue. Enjoyed it immensely.'),
('P004', 'BK00000005', '2024-02-10 16:20:00', 5, 'Started my love for reading! Magic at its finest.'),
('P005', 'BK00000007', '2024-02-25 11:00:00', 5, 'Epic adventure! Tolkien is a genius.'),
('P006', 'BK00000010', '2024-03-01 13:30:00', 4, 'Thought-provoking and disturbing in the best way.'),
('P007', 'BK00000001', '2024-03-10 15:45:00', 5, 'A timeless classic that everyone should read.'),
('P008', 'BK00000008', '2024-03-15 10:00:00', 4, 'Great adventure story! Perfect introduction to Middle-earth.'),
('P009', 'BK00000013', '2024-03-20 12:30:00', 5, 'The bible of computer science. Invaluable resource.'),
('P010', 'BK00000015', '2024-03-25 14:15:00', 5, 'Mind-blowing perspective on human history.'),
('P001', 'BK00000002', '2024-04-01 16:00:00', 5, 'Big Brother is watching! Chillingly relevant today.'),
-- Additional ratings for BestRatingPublisher view
-- PUB6 (Scholastic) - BK00000005 (Harry Potter) - ensure all books have 4+ rating
('P002', 'BK00000005', '2024-04-05 10:00:00', 5, 'Magical and captivating! A masterpiece for all ages.'),
('P003', 'BK00000005', '2024-04-10 14:20:00', 5, 'The world-building is incredible. Rowling is brilliant!'),
('P005', 'BK00000005', '2024-05-15 09:30:00', 4, 'Excellent start to an amazing series.'),
-- PUB1 (Penguin Random House) books: BK00000002, BK00000003, BK00000009, BK00000014
('P004', 'BK00000002', '2024-05-20 11:00:00', 5, 'Dystopian perfection. Still relevant decades later.'),
('P006', 'BK00000003', '2024-06-01 13:45:00', 5, 'Witty, charming, and brilliantly written.'),
('P007', 'BK00000009', '2024-06-15 10:15:00', 4, 'A powerful allegory. Orwell at his finest.'),
('P008', 'BK00000014', '2024-07-01 14:30:00', 5, 'Mind-bending and accessible. Hawking makes physics fascinating.'),
('P009', 'BK00000003', '2024-07-10 09:00:00', 2, 'Too slow-paced for my taste. Could not get into it.'),
('P010', 'BK00000009', '2024-08-05 16:00:00', 5, 'Every sentence has meaning. Absolutely brilliant.'),
-- PUB5 (Hachette) books: BK00000007, BK00000008
('P001', 'BK00000007', '2024-08-15 10:45:00', 5, 'The greatest fantasy epic ever written.'),
('P002', 'BK00000008', '2024-08-20 13:00:00', 5, 'Charming and adventurous. Perfect prequel to LOTR.'),
('P003', 'BK00000007', '2024-09-01 11:30:00', 2, 'Way too long and descriptive. Lost interest halfway through.'),
('P004', 'BK00000008', '2024-09-10 15:20:00', 4, 'A delightful journey. Bilbo is wonderful.'),
-- PUB2 (HarperCollins) books: BK00000001, BK00000010, BK00000011, BK00000015
('P005', 'BK00000001', '2024-09-20 10:00:00', 5, 'Powerful and moving. A true American classic.'),
('P006', 'BK00000011', '2024-10-01 14:00:00', 4, 'Magical adventures in Narnia. Lewis creates wonder.'),
('P007', 'BK00000015', '2024-10-15 09:30:00', 3, 'Interesting ideas but felt somewhat repetitive at times.'),
('P008', 'BK00000010', '2024-10-20 13:15:00', 5, 'Disturbing and brilliant. Huxley was a visionary.'),
('P009', 'BK00000011', '2024-11-01 10:30:00', 2, 'Too childish for my liking. Expected more depth.'),
-- PUB7 (Pearson Education) - BK00000013
('P010', 'BK00000013', '2024-11-05 15:00:00', 5, 'Comprehensive and essential for CS students.'),
('P001', 'BK00000013', '2024-11-10 11:00:00', 4, 'Detailed and well-structured. Great reference.'),
('P002', 'BK00000013', '2024-11-12 09:20:00', 2, 'Too dense and dry. Hard to follow without a course.'),
-- PUB3 (Simon & Schuster) books: BK00000004, BK00000012
('P002', 'BK00000004', '2024-11-15 10:30:00', 4, 'Beautiful prose. Captures the Jazz Age perfectly.'),
('P003', 'BK00000012', '2024-11-20 14:00:00', 5, 'Powerful warning about censorship. Brilliant.'),
('P004', 'BK00000004', '2024-11-22 09:45:00', 1, 'Overrated. Characters are shallow and unlikeable.'),
('P010', 'BK00000012', '2024-11-23 11:30:00', 3, 'Good message but the plot felt a bit thin.'),
-- PUB4 (Macmillan) - BK00000006
('P005', 'BK00000006', '2024-11-25 13:30:00', 4, 'Captures teenage angst perfectly. Holden is iconic.'),
('P006', 'BK00000006', '2024-11-28 10:00:00', 2, 'Found the protagonist whiny and annoying.'),
-- More low ratings for variety
('P007', 'BK00000014', '2024-11-29 14:00:00', 2, 'Too technical for casual readers. Could not finish.'),
('P008', 'BK00000015', '2024-11-30 16:30:00', 1, 'Disappointing. Expected more rigor and less speculation.'),
('P009', 'BK00000002', '2024-12-01 10:15:00', 3, 'Interesting concept but execution felt dated.'),
('P010', 'BK00000008', '2024-12-02 12:45:00', 3, 'Nice story but pacing was uneven.');

-- ---------------------------------------------
-- 13. AUTHOR (No dependencies)
-- ---------------------------------------------
INSERT INTO AUTHOR (Author_ID, Author_Name) VALUES
('A001', 'Harper Lee'),
('A002', 'George Orwell'),
('A003', 'Jane Austen'),
('A004', 'F. Scott Fitzgerald'),
('A005', 'J.K. Rowling'),
('A006', 'J.D. Salinger'),
('A007', 'J.R.R. Tolkien'),
('A008', 'Aldous Huxley'),
('A009', 'C.S. Lewis'),
('A010', 'Ray Bradbury'),
('A011', 'Thomas H. Cormen'),
('A012', 'Stephen Hawking'),
('A013', 'Yuval Noah Harari');

-- Additional books by A005 (J.K. Rowling) for testing
INSERT INTO BOOK (Book_ID, Book_Title, Category, Synopsis, Publisher_ID) VALUES
('BK00000016', 'Harry Potter: Chamber of Secrets', 'Fantasy', 'Harry returns to Hogwarts for his second year and faces the mystery of the Chamber of Secrets.', 'PUB6'),
('BK00000017', 'Harry Potter: Prisoner of Azkaban', 'Fantasy', 'Harry learns about Sirius Black and discovers secrets about his past in his third year.', 'PUB6'),
('BK00000018', 'Harry Potter: Goblet of Fire', 'Fantasy', 'Harry competes in the dangerous Triwizard Tournament in his fourth year at Hogwarts.', 'PUB6'),
('BK00000019', 'Harry Potter: Order of the Phoenix', 'Fantasy', 'Harry and his friends form Dumbledores Army to fight against the rise of Voldemort.', 'PUB6'),
('BK00000020', 'Harry Potter: Half-Blood Prince', 'Fantasy', 'Harry discovers the Half-Blood Princes potions book and learns about Voldemorts past.', 'PUB6'),
('BK00000021', 'Harry Potter: Deathly Hallows', 'Fantasy', 'The final battle between Harry Potter and Lord Voldemort comes to an epic conclusion.', 'PUB6'),
-- Additional books for cataloging test - need multiple books per category to avoid duplicate key errors
('BK00000022', 'The Hunger Games', 'Fiction', 'A dystopian novel about survival and rebellion.', 'PUB3'),
('BK00000023', 'Enders Game', 'Science Fiction', 'A military science fiction novel about a child genius.', 'PUB4'),
('BK00000024', 'Outlander', 'Romance', 'A time-traveling romance novel.', 'PUB5'),
('BK00000025', 'The Name of the Wind', 'Fantasy', 'A fantasy novel about a legendary hero.', 'PUB1'),
('BK00000026', 'Clean Code', 'Technology', 'A handbook of agile software craftsmanship.', 'PUB7'),
('BK00000027', 'The Selfish Gene', 'Science', 'An evolutionary biology classic.', 'PUB8'),
('BK00000028', 'Guns Germs and Steel', 'History', 'A study of human societies and their development.', 'PUB2'),
('BK00000029', 'Catch-22', 'Fiction', 'A satirical war novel.', 'PUB3'),
('BK00000030', 'Foundation', 'Science Fiction', 'A space opera about the fall and rise of civilizations.', 'PUB4'),
('BK00000031', 'The Notebook', 'Romance', 'A romantic drama about enduring love.', 'PUB5'),
('BK00000032', 'Mistborn', 'Fantasy', 'An epic fantasy about overthrowing an empire.', 'PUB1'),
('BK00000033', 'Design Patterns', 'Technology', 'Elements of reusable object-oriented software.', 'PUB7'),
('BK00000034', 'Cosmos', 'Science', 'A journey through space and time.', 'PUB8'),
('BK00000035', 'The Diary of Anne Frank', 'History', 'A firsthand account of life during the Holocaust.', 'PUB2'),
('BK00000036', 'Slaughterhouse-Five', 'Fiction', 'An anti-war novel about time travel and bombing.', 'PUB3'),
('BK00000037', 'Dune', 'Science Fiction', 'A science fiction epic about desert planets and politics.', 'PUB4'),
('BK00000038', 'Me Before You', 'Romance', 'A touching story about love and life choices.', 'PUB5'),
('BK00000039', 'The Way of Kings', 'Fantasy', 'The first book in the Stormlight Archive series.', 'PUB1'),
('BK00000040', 'The Pragmatic Programmer', 'Technology', 'Your journey to mastery in software development.', 'PUB7'),
('BK00000041', 'The Origin of Species', 'Science', 'Darwins groundbreaking work on evolution.', 'PUB8'),
('BK00000042', 'A Peoples History of the United States', 'History', 'American history from the perspective of common people.', 'PUB2');

-- Link new books to author A005
INSERT INTO WRITES (Author_ID, Book_ID) VALUES
('A005', 'BK00000016'),
('A005', 'BK00000017'),
('A005', 'BK00000018'),
('A005', 'BK00000019'),
('A005', 'BK00000020'),
('A005', 'BK00000021');

-- ---------------------------------------------
-- 14. AUTHOR_EMAIL (Depends on AUTHOR)
-- ---------------------------------------------
INSERT INTO AUTHOR_EMAIL (Author_ID, Email) VALUES
('A001', 'harper.lee@classic-authors.com'),
('A002', 'george.orwell@classic-authors.com'),
('A002', 'g.orwell@literature.org'),
('A003', 'jane.austen@classic-authors.com'),
('A004', 'fscott.fitzgerald@american-lit.com'),
('A005', 'jk.rowling@wizardingworld.com'),
('A006', 'jd.salinger@american-lit.com'),
('A007', 'jrr.tolkien@middleearth.com'),
('A008', 'aldous.huxley@dystopian-lit.com'),
('A009', 'cs.lewis@narnia.com'),
('A010', 'ray.bradbury@scifi-authors.com'),
('A011', 'cormen@cs.dartmouth.edu'),
('A012', 'stephen.hawking@physics.org'),
('A013', 'yuval.harari@history.com');

-- ---------------------------------------------
-- 15. WRITES (Depends on AUTHOR and BOOK)
-- ---------------------------------------------
INSERT INTO WRITES (Author_ID, Book_ID) VALUES
('A001', 'BK00000001'),  -- To Kill a Mockingbird
('A002', 'BK00000002'),  -- 1984
('A003', 'BK00000003'),  -- Pride and Prejudice
('A004', 'BK00000004'),  -- The Great Gatsby
('A005', 'BK00000005'),  -- Harry Potter
('A006', 'BK00000006'),  -- The Catcher in the Rye
('A007', 'BK00000007'),  -- Lord of the Rings
('A007', 'BK00000008'),  -- The Hobbit (Tolkien wrote both)
('A002', 'BK00000009'),  -- Animal Farm
('A008', 'BK00000010'),  -- Brave New World
('A009', 'BK00000011'),  -- The Chronicles of Narnia
('A010', 'BK00000012'),  -- Fahrenheit 451
('A011', 'BK00000013'),  -- Introduction to Algorithms
('A012', 'BK00000014'),  -- A Brief History of Time
('A013', 'BK00000015');  -- Sapiens

-- ---------------------------------------------
-- 16. EMPLOYEE (Depends on PERSON and MEMBER)
-- Employee can optionally be a member
-- ---------------------------------------------
INSERT INTO EMPLOYEE (Employee_ID, Person_ID, Member_ID, Start_Date) VALUES
('EMP001', 'P011', NULL, '2020-01-15'),
('EMP002', 'P012', 'P010', '2020-03-20'),
('EMP003', 'P013', NULL, '2025-11-10'),
('EMP004', 'P014', NULL, '2021-09-05'),
('EMP005', 'P015', NULL, '2022-01-12');

-- ---------------------------------------------
-- 17. TRAINER (No dependencies - auto increment)
-- Trainer_Job: ENUM('LibrarySupervisor', 'CatalogingManager')
-- ---------------------------------------------
INSERT INTO TRAINER (Trainer_Job) VALUES
('LibrarySupervisor'),
('CatalogingManager'),
('LibrarySupervisor'),
('CatalogingManager');

-- ---------------------------------------------
-- 18. CATALOGING_MANAGER (Depends on EMPLOYEE and TRAINER)
-- ---------------------------------------------
INSERT INTO CATALOGING_MANAGER (Employee_ID, Trainer_ID) VALUES
('EMP001', 2),
('EMP003', 4);

-- ---------------------------------------------
-- 19. LIBRARY_SUPERVISOR (Depends on EMPLOYEE and TRAINER)
-- ---------------------------------------------
INSERT INTO LIBRARY_SUPERVISOR (Employee_ID, Trainer_ID) VALUES
('EMP002', 1),
('EMP004', 3);

-- ---------------------------------------------
-- 20. RECEPTIONIST (Depends on EMPLOYEE and TRAINER)
-- ---------------------------------------------
INSERT INTO RECEPTIONIST (Employee_ID, Trainer_ID) VALUES
('EMP005', 1);

-- ---------------------------------------------
-- 21. PAYMENT (No dependencies)
-- ---------------------------------------------
INSERT INTO PAYMENT (Payment_ID, Payment_Method, Payment_Date, Amount_Paid) VALUES
-- Recent payments (past month - November 2025) for TopGoldMember view
('PAY001', 'Credit Card', '2024-11-01', 15.00),
('PAY002', 'Debit Card', '2024-11-03', 10.00),
('PAY003', 'Cash', '2024-11-05', 15.00),
('PAY004', 'Credit Card', '2024-11-07', 20.00),
('PAY005', 'PayPal', '2024-11-10', 10.00),
('PAY006', 'Credit Card', '2024-11-12', 15.00),
('PAY007', 'Cash', '2024-11-15', 25.00),
('PAY008', 'Debit Card', '2024-11-18', 10.00),
('PAY009', 'Credit Card', '2024-11-20', 15.00),
('PAY010', 'Cash', '2024-11-22', 30.00),
-- Additional payments for past month (more than 5 books for gold member P001)
('PAY011', 'Credit Card', '2024-11-08', 15.00),
('PAY012', 'Credit Card', '2024-11-10', 15.00),
('PAY013', 'Credit Card', '2024-11-14', 15.00),
('PAY014', 'Credit Card', '2024-11-16', 15.00),
-- Historical payments for PopularBooks view (past year)
('PAY015', 'Cash', '2024-01-15', 15.00),
('PAY016', 'Credit Card', '2024-02-10', 15.00),
('PAY017', 'Debit Card', '2024-03-05', 15.00),
('PAY018', 'Credit Card', '2024-04-12', 15.00),
('PAY019', 'Cash', '2024-05-20', 15.00),
('PAY020', 'Credit Card', '2024-06-08', 15.00),
('PAY021', 'Debit Card', '2024-07-15', 15.00),
('PAY022', 'Credit Card', '2024-08-22', 15.00),
('PAY023', 'Cash', '2024-09-10', 15.00),
('PAY024', 'Credit Card', '2024-10-18', 15.00),
-- Monthly payments for silver member P002 (PotentialGoldMember - every month in 2024-2025)
('PAY025', 'Credit Card', '2025-01-05', 10.00),
('PAY026', 'Credit Card', '2025-02-05', 10.00),
('PAY027', 'Credit Card', '2025-03-05', 10.00),
('PAY028', 'Credit Card', '2025-04-05', 10.00),
('PAY029', 'Credit Card', '2025-05-05', 10.00),
('PAY030', 'Credit Card', '2025-06-05', 10.00),
('PAY031', 'Credit Card', '2025-07-05', 10.00),
('PAY032', 'Credit Card', '2025-08-05', 10.00),
('PAY033', 'Credit Card', '2025-09-05', 10.00),
('PAY034', 'Credit Card', '2025-10-05', 10.00),
('PAY035', 'Credit Card', '2025-11-05', 10.00),
('PAY036', 'Credit Card', '2025-12-05', 10.00),
('PAY052', 'Credit Card', '2024-12-01', 10.00),
-- Monthly payments for silver member P004 (another PotentialGoldMember candidate)
('PAY037', 'Debit Card', '2025-01-10', 10.00),
('PAY038', 'Debit Card', '2025-02-10', 10.00),
('PAY039', 'Debit Card', '2025-03-10', 10.00),
('PAY040', 'Debit Card', '2025-04-10', 10.00),
('PAY041', 'Debit Card', '2025-05-10', 10.00),
('PAY042', 'Debit Card', '2025-06-10', 10.00),
('PAY043', 'Debit Card', '2025-07-10', 10.00),
('PAY044', 'Debit Card', '2025-08-10', 10.00),
('PAY045', 'Debit Card', '2025-09-10', 10.00),
('PAY046', 'Debit Card', '2025-10-10', 10.00),
('PAY047', 'Debit Card', '2025-11-10', 10.00),
('PAY048', 'Debit Card', '2025-12-03', 10.00),
('PAY051', 'Credit Card', '2025-12-01', 10.00),
-- Additional historical payments
('PAY049', 'Cash', '2024-01-20', 15.00),
('PAY050', 'Credit Card', '2024-02-20', 15.00),
-- Payments for new Harry Potter books (members borrowing all A005 books)
('PAY053', 'Credit Card', '2024-03-10', 15.00),
('PAY054', 'Credit Card', '2024-04-15', 15.00),
('PAY055', 'Credit Card', '2024-05-10', 15.00),
('PAY056', 'Credit Card', '2024-06-12', 15.00),
('PAY057', 'Credit Card', '2024-07-08', 15.00),
('PAY058', 'Credit Card', '2024-08-14', 15.00),
('PAY059', 'Credit Card', '2024-03-12', 15.00),
('PAY060', 'Credit Card', '2024-04-18', 15.00),
('PAY061', 'Credit Card', '2024-05-15', 15.00),
('PAY062', 'Credit Card', '2024-06-20', 15.00),
('PAY063', 'Credit Card', '2024-07-18', 15.00),
('PAY064', 'Credit Card', '2024-08-22', 15.00),
('PAY065', 'Debit Card', '2024-04-05', 15.00),
('PAY066', 'Debit Card', '2024-05-08', 15.00);

-- ---------------------------------------------
-- 22. BORROWING_RECORD (Depends on PAYMENT)
-- ---------------------------------------------
INSERT INTO BORROWING_RECORD (Payment_ID, Issue_Date, Return_Due_Date) VALUES
-- Recent borrowing records (past month)
('PAY001', '2024-11-01', '2024-11-15'),
('PAY002', '2024-11-03', '2024-11-17'),
('PAY003', '2024-11-05', '2024-11-19'),
('PAY004', '2024-11-07', '2024-11-21'),
('PAY005', '2024-11-10', '2024-11-24'),
('PAY006', '2024-11-12', '2024-11-26'),
('PAY007', '2024-11-15', '2024-11-29'),
('PAY008', '2024-11-18', '2024-12-02'),
('PAY009', '2024-11-20', '2024-12-04'),
('PAY010', '2024-11-22', '2024-12-06'),
-- Additional records for gold member P001 (>5 books in past month)
('PAY011', '2024-11-08', '2024-11-22'),
('PAY012', '2024-11-10', '2024-11-24'),
('PAY013', '2024-11-14', '2024-11-28'),
('PAY014', '2024-11-16', '2024-11-30'),
-- Historical records (past year) for PopularBooks
('PAY015', '2024-01-15', '2024-01-29'),
('PAY016', '2024-02-10', '2024-02-24'),
('PAY017', '2024-03-05', '2024-03-19'),
('PAY018', '2024-04-12', '2024-04-26'),
('PAY019', '2024-05-20', '2024-06-03'),
('PAY020', '2024-06-08', '2024-06-22'),
('PAY021', '2024-07-15', '2024-07-29'),
('PAY022', '2024-08-22', '2024-09-05'),
('PAY023', '2024-09-10', '2024-09-24'),
('PAY024', '2024-10-18', '2024-11-01'),
-- Monthly records for silver member P002 (PotentialGoldMember)
('PAY052', '2024-12-01', '2024-01-24'),
('PAY025', '2025-01-05', '2024-01-19'),
('PAY026', '2025-02-05', '2024-02-19'),
('PAY027', '2025-03-05', '2024-03-19'),
('PAY028', '2025-04-05', '2024-04-19'),
('PAY029', '2025-05-05', '2024-05-19'),
('PAY030', '2025-06-05', '2024-06-19'),
('PAY031', '2025-07-05', '2024-07-19'),
('PAY032', '2025-08-05', '2024-08-19'),
('PAY033', '2025-09-05', '2024-09-19'),
('PAY034', '2025-10-05', '2024-10-19'),
('PAY035', '2025-11-05', '2024-11-19'),
-- Additional historical records
('PAY049', '2024-01-20', '2024-02-03'),
('PAY050', '2024-02-20', '2024-03-05'),
-- Borrowing records for new Harry Potter books
('PAY053', '2024-03-10', '2024-03-24'),
('PAY054', '2024-04-15', '2024-04-29'),
('PAY055', '2024-05-10', '2024-05-24'),
('PAY056', '2024-06-12', '2024-06-26'),
('PAY057', '2024-07-08', '2024-07-22'),
('PAY058', '2024-08-14', '2024-08-28'),
('PAY059', '2024-03-12', '2024-03-26'),
('PAY060', '2024-04-18', '2024-05-02'),
('PAY061', '2024-05-15', '2024-05-29'),
('PAY062', '2024-06-20', '2024-07-04'),
('PAY063', '2024-07-18', '2024-08-01'),
('PAY064', '2024-08-22', '2024-09-05'),
('PAY065', '2024-04-05', '2024-04-19'),
('PAY066', '2024-05-08', '2024-05-22'),
('PAY037', '2025-01-10', '2024-01-24'),
('PAY038', '2025-02-10', '2024-02-24'),
('PAY039', '2025-03-10', '2024-03-24'),
('PAY040', '2025-04-10', '2024-04-24'),
('PAY041', '2025-05-10', '2024-05-24'),
('PAY042', '2025-06-10', '2024-06-24'),
('PAY043', '2025-07-10', '2024-07-24'),
('PAY044', '2025-08-10', '2024-08-24'),
('PAY045', '2025-09-10', '2024-09-24'),
('PAY046', '2024-10-10', '2024-10-24'),
('PAY047', '2024-11-10', '2024-11-24'),
('PAY048', '2025-12-03', '2024-12-17'),
('PAY036', '2025-12-05', '2024-12-19'),
('PAY051', '2024-12-01', '2024-01-24');

-- ---------------------------------------------
-- 23. BORROWS (Depends on BORROWING_RECORD and MEMBER)
-- ---------------------------------------------
INSERT INTO BORROWS (Payment_ID, Member_ID) VALUES
-- Recent borrows
('PAY001', 'P001'),  -- Gold member
('PAY002', 'P002'),  -- Silver member
('PAY003', 'P003'),  -- Gold member
('PAY004', 'P004'),  -- Silver member
('PAY005', 'P005'),  -- Gold member
('PAY006', 'P006'),  -- Silver member
('PAY007', 'P007'),  -- Gold member
('PAY008', 'P008'),  -- Silver member
('PAY009', 'P009'),  -- Gold member
('PAY010', 'P010'),  -- Silver member
-- Additional borrows for gold member P001 in past month (total >5 books)
('PAY011', 'P001'),
('PAY012', 'P001'),
('PAY013', 'P001'),
('PAY014', 'P001'),
-- Historical borrows for past year
('PAY015', 'P003'),
('PAY016', 'P005'),
('PAY017', 'P007'),
('PAY018', 'P009'),
('PAY019', 'P001'),
('PAY020', 'P003'),
('PAY021', 'P005'),
('PAY022', 'P007'),
-- Additional historical
('PAY049', 'P006'),
('PAY050', 'P008'),
-- Borrows for new Harry Potter books - P001 and P003 borrow all A005 books
('PAY053', 'P001'),  -- Gold member P001
('PAY054', 'P001'),
('PAY055', 'P001'),
('PAY056', 'P001'),
('PAY057', 'P001'),
('PAY058', 'P001'),
('PAY059', 'P003'),  -- Gold member P003
('PAY060', 'P003'),
('PAY061', 'P003'),
('PAY062', 'P003'),
('PAY063', 'P003'),
('PAY064', 'P003'),
-- P005 borrows some (but not all) A005 books
('PAY065', 'P005'),
('PAY066', 'P005'),
-- Monthly borrows for silver member P002 (PotentialGoldMember - every month 2024)
('PAY023', 'P009'),
('PAY024', 'P001'),
('PAY025', 'P002'),
('PAY026', 'P002'),
('PAY027', 'P002'),
('PAY028', 'P002'),
('PAY029', 'P002'),
('PAY030', 'P002'),
('PAY031', 'P002'),
('PAY032', 'P002'),
('PAY033', 'P002'),
('PAY034', 'P002'),
('PAY035', 'P002'),
('PAY036', 'P002'),
('PAY052', 'P002'),
-- Monthly borrows for silver member P004 (PotentialGoldMember - every month 2024)
('PAY037', 'P004'),
('PAY038', 'P004'),
('PAY039', 'P004'),
('PAY040', 'P004'),
('PAY041', 'P004'),
('PAY042', 'P004'),
('PAY043', 'P004'),
('PAY044', 'P004'),
('PAY045', 'P004'),
('PAY046', 'P004'),
('PAY047', 'P004'),
('PAY048', 'P004'),
('PAY051', 'P004');

-- ---------------------------------------------
-- 24. CATALOGING_LOG (Depends on CATALOGING_MANAGER and BOOK)
-- ---------------------------------------------
INSERT INTO CATALOGING_LOG (Manager_ID, Book_ID, Catalog_Date) VALUES
-- Historical cataloging entries (using books not used in past 4 weeks test data)
('EMP001', 'BK00000001', '2025-01-10'),
('EMP001', 'BK00000002', '2025-01-11'),
('EMP003', 'BK00000005', '2025-01-16'),
('EMP003', 'BK00000007', '2025-02-05'),
('EMP001', 'BK00000008', '2025-02-10'),
('EMP003', 'BK00000009', '2025-03-01'),
('EMP001', 'BK00000010', '2025-03-15'),

-- ==============================================
-- ADDITIONAL CATALOGING DATA FOR TESTING:
-- Cataloging Managers who cataloged all categories every week in past 4 weeks
-- Current date: Dec 6, 2025
-- Past 4 weeks: Nov 8-14, Nov 15-21, Nov 22-28, Nov 29 - Dec 5
-- Categories: Fiction, Science Fiction, Romance, Fantasy, Technology, Science, History (7 categories)
-- Note: PRIMARY KEY is (Manager_ID, Book_ID), so each manager can catalog each book only once
-- ==============================================

-- EMP001 catalogs all 7 categories in EACH of the past 4 weeks (should appear in query)
-- Week 1 (Nov 8-14, 2025) - All 7 categories using books 4, 12, 24, 16, 26, 27, 28
('EMP001', 'BK00000004', '2025-11-10'),  -- Fiction (The Great Gatsby)
('EMP001', 'BK00000012', '2025-11-10'),  -- Science Fiction (Fahrenheit 451)
('EMP001', 'BK00000024', '2025-11-11'),  -- Romance (Outlander)
('EMP001', 'BK00000016', '2025-11-12'),  -- Fantasy (Chamber of Secrets)
('EMP001', 'BK00000026', '2025-11-13'),  -- Technology (Clean Code)
('EMP001', 'BK00000027', '2025-11-13'),  -- Science (The Selfish Gene)
('EMP001', 'BK00000028', '2025-11-14'),  -- History (Guns Germs and Steel)

-- Week 2 (Nov 15-21, 2025) - All 7 categories using different books (22, 23, 31, 25, 33, 34, 35)
('EMP001', 'BK00000022', '2025-11-17'),  -- Fiction (The Hunger Games)
('EMP001', 'BK00000023', '2025-11-17'),  -- Science Fiction (Enders Game)
('EMP001', 'BK00000031', '2025-11-18'),  -- Romance (The Notebook)
('EMP001', 'BK00000025', '2025-11-19'),  -- Fantasy (Name of the Wind)
('EMP001', 'BK00000033', '2025-11-19'),  -- Technology (Design Patterns)
('EMP001', 'BK00000034', '2025-11-20'),  -- Science (Cosmos)
('EMP001', 'BK00000035', '2025-11-21'),  -- History (Diary of Anne Frank)

-- Week 3 (Nov 22-28, 2025) - All 7 categories using different books (29, 30, 38, 32, 40, 41, 42)
('EMP001', 'BK00000029', '2025-11-24'),  -- Fiction (Catch-22)
('EMP001', 'BK00000030', '2025-11-24'),  -- Science Fiction (Foundation)
('EMP001', 'BK00000038', '2025-11-25'),  -- Romance (Me Before You)
('EMP001', 'BK00000032', '2025-11-26'),  -- Fantasy (Mistborn)
('EMP001', 'BK00000040', '2025-11-26'),  -- Technology (Pragmatic Programmer)
('EMP001', 'BK00000041', '2025-11-27'),  -- Science (Origin of Species)
('EMP001', 'BK00000042', '2025-11-28'),  -- History (Peoples History)

-- Week 4 (Nov 29 - Dec 5, 2025) - All 7 categories using different books (36, 37, 3, 39, 13, 14, 15)
('EMP001', 'BK00000036', '2025-12-01'),  -- Fiction (Slaughterhouse-Five)
('EMP001', 'BK00000037', '2025-12-01'),  -- Science Fiction (Dune)
('EMP001', 'BK00000003', '2025-12-02'),  -- Romance (Pride and Prejudice)
('EMP001', 'BK00000039', '2025-12-03'),  -- Fantasy (Way of Kings)
('EMP001', 'BK00000013', '2025-12-03'),  -- Technology (Intro to Algorithms)
('EMP001', 'BK00000014', '2025-12-04'),  -- Science (Brief History of Time)
('EMP001', 'BK00000015', '2025-12-05'),  -- History (Sapiens)

-- EMP003 catalogs all categories in weeks 1 and 2, but NOT all categories in weeks 3 and 4 (should NOT appear)
-- Week 1 (Nov 8-14, 2025) - All 7 categories using books already cataloged by EMP003 historically plus new ones
('EMP003', 'BK00000001', '2025-11-08'),  -- Fiction (To Kill a Mockingbird)
('EMP003', 'BK00000002', '2025-11-09'),  -- Science Fiction (1984)
('EMP003', 'BK00000024', '2025-11-10'),  -- Romance (Outlander)
('EMP003', 'BK00000016', '2025-11-11'),  -- Fantasy (Chamber of Secrets)
('EMP003', 'BK00000026', '2025-11-12'),  -- Technology (Clean Code)
('EMP003', 'BK00000027', '2025-11-12'),  -- Science (The Selfish Gene)
('EMP003', 'BK00000028', '2025-11-13'),  -- History (Guns Germs and Steel)

-- Week 2 (Nov 15-21, 2025) - All 7 categories
('EMP003', 'BK00000006', '2025-11-15'),  -- Fiction (Catcher in the Rye)
('EMP003', 'BK00000012', '2025-11-16'),  -- Science Fiction (Fahrenheit 451)
('EMP003', 'BK00000031', '2025-11-17'),  -- Romance (The Notebook)
('EMP003', 'BK00000011', '2025-11-18'),  -- Fantasy (Chronicles of Narnia)
('EMP003', 'BK00000033', '2025-11-18'),  -- Technology (Design Patterns)
('EMP003', 'BK00000034', '2025-11-19'),  -- Science (Cosmos)
('EMP003', 'BK00000035', '2025-11-20'),  -- History (Diary of Anne Frank)

-- Week 3 (Nov 22-28, 2025) - Missing Technology and Science (only 5 categories)
('EMP003', 'BK00000022', '2025-11-22'),  -- Fiction (The Hunger Games)
('EMP003', 'BK00000023', '2025-11-23'),  -- Science Fiction (Enders Game)
('EMP003', 'BK00000038', '2025-11-24'),  -- Romance (Me Before You)
('EMP003', 'BK00000025', '2025-11-25'),  -- Fantasy (Name of the Wind)
('EMP003', 'BK00000042', '2025-11-26'),  -- History (Peoples History)
-- Missing: Technology and Science

-- Week 4 (Nov 29 - Dec 5, 2025) - Missing Romance and Fantasy (only 5 categories)
('EMP003', 'BK00000029', '2025-11-30'),  -- Fiction (Catch-22)
('EMP003', 'BK00000037', '2025-12-01'),  -- Science Fiction (Dune)
('EMP003', 'BK00000040', '2025-12-02'),  -- Technology (Pragmatic Programmer)
('EMP003', 'BK00000041', '2025-12-03'),  -- Science (Origin of Species)
('EMP003', 'BK00000015', '2025-12-04');  -- History (Sapiens)
-- Missing: Romance and Fantasy

-- ==============================================
-- EXPECTED QUERY RESULTS:
-- The query should return exactly 1 cataloging manager:
-- - EMP001: Cataloged all 7 categories in each of the past 4 weeks
--
-- Should NOT return:
-- - EMP003: Cataloged all categories in weeks 1 and 2, but missed categories in weeks 3 and 4
-- ==============================================

-- ---------------------------------------------
-- 25. MAINTAINS (Depends on RECEPTIONIST and BORROWING_RECORD)
-- ---------------------------------------------
INSERT INTO MAINTAINS (Receptionist_ID, Payment_ID) VALUES
('EMP005', 'PAY001'),
('EMP005', 'PAY002'),
('EMP005', 'PAY003'),
('EMP005', 'PAY004'),
('EMP005', 'PAY005'),
('EMP005', 'PAY006'),
('EMP005', 'PAY007'),
('EMP005', 'PAY008'),
('EMP005', 'PAY009'),
('EMP005', 'PAY010');

-- ---------------------------------------------
-- 26. INQUIRY (Depends on MEMBER and RECEPTIONIST)
-- ---------------------------------------------
INSERT INTO INQUIRY (Inquiry_ID, Inquiry_Time, Resolution_Status, Member_ID, Rating, Receptionist_ID) VALUES
-- Past month inquiries - EMP005 resolved more than 5 (ActiveReceptionist view)
('INQ001', '2025-11-01 09:00:00', 'Resolved', 'P001', 5, 'EMP005'),
('INQ002', '2025-11-05 10:30:00', 'Resolved', 'P002', 4, 'EMP005'),
('INQ003', '2025-11-08 14:15:00', 'Resolved', 'P003', 5, 'EMP005'),
('INQ004', '2025-11-12 11:45:00', 'Resolved', 'P004', 5, 'EMP005'),
('INQ005', '2025-11-15 16:00:00', 'Resolved', 'P005', 4, 'EMP005'),
('INQ006', '2025-11-18 09:30:00', 'Resolved', 'P006', 4, 'EMP005'),
('INQ007', '2025-11-20 13:20:00', 'Resolved', 'P007', 5, 'EMP005'),
('INQ008', '2025-11-22 10:10:00', 'Resolved', 'P008', 5, 'EMP005'),
('INQ009', '2025-11-24 14:30:00', 'Pending', 'P009', NULL, 'EMP005'),
('INQ010', '2025-11-26 11:00:00', 'In Progress', 'P010', NULL, 'EMP005'),
-- Older inquiries
('INQ011', '2025-10-15 09:00:00', 'Resolved', 'P001', 5, 'EMP005'),
('INQ012', '2025-09-20 10:30:00', 'Resolved', 'P002', 4, 'EMP005');

-- ---------------------------------------------
-- 27. ENTRY (Depends on BORROWING_RECORD and BOOK)
-- ---------------------------------------------
INSERT INTO ENTRY (Payment_ID, Book_ID) VALUES
-- Recent entries (past month)
('PAY001', 'BK00000001'),
('PAY001', 'BK00000002'),  -- Multiple books in one borrowing
('PAY002', 'BK00000003'),
('PAY003', 'BK00000005'),
('PAY003', 'BK00000008'),
('PAY004', 'BK00000007'),
('PAY005', 'BK00000010'),
('PAY006', 'BK00000004'),
('PAY007', 'BK00000006'),
('PAY007', 'BK00000009'),
('PAY008', 'BK00000011'),
('PAY009', 'BK00000012'),
('PAY010', 'BK00000013'),
('PAY010', 'BK00000014'),
('PAY010', 'BK00000015'),
-- Additional entries for P001's borrowing records (past month)
('PAY011', 'BK00000001'),  -- Harry Potter (popular)
('PAY012', 'BK00000002'),  -- 1984
('PAY013', 'BK00000005'),  -- Harry Potter again
('PAY014', 'BK00000007'),  -- Lord of the Rings
-- Historical entries - making Harry Potter (BK00000005) and 1984 (BK00000002) most borrowed
('PAY015', 'BK00000005'),  -- Harry Potter
('PAY016', 'BK00000005'),  -- Harry Potter
('PAY017', 'BK00000002'),  -- 1984
('PAY018', 'BK00000005'),  -- Harry Potter
('PAY019', 'BK00000002'),  -- 1984
('PAY020', 'BK00000005'),  -- Harry Potter
('PAY021', 'BK00000002'),  -- 1984
('PAY022', 'BK00000005'),  -- Harry Potter
('PAY023', 'BK00000002'),  -- 1984
('PAY024', 'BK00000005'),  -- Harry Potter
-- Monthly entries for P002 (PotentialGoldMember)
('PAY025', 'BK00000003'),
('PAY026', 'BK00000004'),
('PAY027', 'BK00000006'),
('PAY028', 'BK00000008'),
('PAY029', 'BK00000009'),
('PAY030', 'BK00000010'),
('PAY032', 'BK00000012'),
('PAY033', 'BK00000013'),
('PAY034', 'BK00000014'),
('PAY035', 'BK00000015'),
('PAY036', 'BK00000001'),
('PAY052', 'BK00000002'),
-- Monthly entries for P004 (PotentialGoldMember)
('PAY051', 'BK00000003'),
('PAY037', 'BK00000002'),
('PAY038', 'BK00000003'),
('PAY039', 'BK00000004'),
('PAY040', 'BK00000005'),
('PAY041', 'BK00000006'),
('PAY042', 'BK00000007'),
('PAY043', 'BK00000008'),
('PAY044', 'BK00000009'),
('PAY045', 'BK00000010'),
('PAY046', 'BK00000011'),
('PAY047', 'BK00000012'),
('PAY048', 'BK00000013'),
-- Additional historical
('PAY049', 'BK00000014'),
('PAY050', 'BK00000015'),
-- Entries for new Harry Potter books
-- P001 borrows all 6 new Harry Potter books (already borrowed BK00000005)
('PAY053', 'BK00000016'),  -- Chamber of Secrets
('PAY054', 'BK00000017'),  -- Prisoner of Azkaban
('PAY055', 'BK00000018'),  -- Goblet of Fire
('PAY056', 'BK00000019'),  -- Order of the Phoenix
('PAY057', 'BK00000020'),  -- Half-Blood Prince
('PAY058', 'BK00000021'),  -- Deathly Hallows
-- P003 borrows all 6 new Harry Potter books (already borrowed BK00000005)
('PAY059', 'BK00000016'),  -- Chamber of Secrets
('PAY060', 'BK00000017'),  -- Prisoner of Azkaban
('PAY061', 'BK00000018'),  -- Goblet of Fire
('PAY062', 'BK00000019'),  -- Order of the Phoenix
('PAY063', 'BK00000020'),  -- Half-Blood Prince
('PAY064', 'BK00000021'),  -- Deathly Hallows
-- P005 borrows only 2 new Harry Potter books (partial borrowing)
('PAY065', 'BK00000016'),  -- Chamber of Secrets
('PAY066', 'BK00000017');  -- Prisoner of Azkaban

-- ==============================================
-- ADDITIONAL DATA FOR TESTING:
-- Employees who enrolled in gold membership within a month of being employed
-- ==============================================

-- Add new PERSON records for test employees
INSERT INTO PERSON (Person_ID, Fname, MName, LName, Address, Gender, DOB) VALUES
('P016', 'Alice', 'Marie', 'Johnson', '100 Library Lane, Portland, OR', 'F', '1990-05-12'),
('P017', 'Robert', 'James', 'Chen', '200 Book Street, Eugene, OR', 'M', '1988-09-20'),
('P018', 'Maria', 'Elena', 'Rodriguez', '300 Reading Road, Salem, OR', 'F', '1992-03-08');

-- Add phone numbers for new persons
INSERT INTO PERSON_PHONE_NUMBER (Person_ID, Phone_Number) VALUES
('P016', '503-555-1601'),
('P017', '541-555-1701'),
('P018', '503-555-1801');

-- Add MEMBER records (gold membership) for the new employees
INSERT INTO MEMBER (Member_ID, Member_type, Card_ID) VALUES
('P016', 'gold', 'CARD-G-016'),
('P017', 'gold', 'CARD-G-017'),
('P018', 'gold', 'CARD-G-018');

-- Add CARD_DETAIL records with enrollment dates within 1 month of employment
-- P016: Employed 2024-01-15, Enrolled 2024-01-20 (5 days later) ✓
-- P017: Employed 2024-06-01, Enrolled 2024-06-25 (24 days later) ✓
-- P018: Employed 2024-09-10, Enrolled 2024-10-01 (21 days later) ✓
INSERT INTO CARD_DETAIL (Card_ID, Card_Issue_Date) VALUES
('CARD-G-016', '2024-01-20'),
('CARD-G-017', '2024-06-25'),
('CARD-G-018', '2024-10-01');

-- Add EMPLOYEE records linking to the gold members
INSERT INTO EMPLOYEE (Employee_ID, Person_ID, Member_ID, Start_Date) VALUES
('EMP006', 'P016', 'P016', '2024-01-15'),  -- Enrolled 5 days after employment
('EMP007', 'P017', 'P017', '2024-06-01'),  -- Enrolled 24 days after employment
('EMP008', 'P018', 'P018', '2024-09-10');  -- Enrolled 21 days after employment

-- Add a counter-example: Employee who enrolled MORE than a month after employment
INSERT INTO PERSON (Person_ID, Fname, MName, LName, Address, Gender, DOB) VALUES
('P019', 'Thomas', 'Edward', 'Baker', '400 Archive Ave, Portland, OR', 'M', '1985-11-15');

INSERT INTO PERSON_PHONE_NUMBER (Person_ID, Phone_Number) VALUES
('P019', '503-555-1901');

INSERT INTO MEMBER (Member_ID, Member_type, Card_ID) VALUES
('P019', 'gold', 'CARD-G-019');

-- P019: Employed 2024-02-01, Enrolled 2024-04-15 (74 days later - more than a month) ✗
INSERT INTO CARD_DETAIL (Card_ID, Card_Issue_Date) VALUES
('CARD-G-019', '2024-04-15');

INSERT INTO EMPLOYEE (Employee_ID, Person_ID, Member_ID, Start_Date) VALUES
('EMP009', 'P019', 'P019', '2024-02-01');  -- Enrolled 74 days after - should NOT appear in query

-- Add another counter-example: Employee with silver membership (not gold)
INSERT INTO PERSON (Person_ID, Fname, MName, LName, Address, Gender, DOB) VALUES
('P020', 'Linda', 'Sue', 'Williams', '500 Catalog Court, Bend, OR', 'F', '1993-07-22');

INSERT INTO PERSON_PHONE_NUMBER (Person_ID, Phone_Number) VALUES
('P020', '541-555-2001');

INSERT INTO MEMBER (Member_ID, Member_type, Card_ID) VALUES
('P020', 'silver', 'CARD-S-020');

-- P020: Employed 2024-08-01, Enrolled 2024-08-10 (9 days later, but SILVER not gold) ✗
INSERT INTO CARD_DETAIL (Card_ID, Card_Issue_Date) VALUES
('CARD-S-020', '2024-08-10');

INSERT INTO EMPLOYEE (Employee_ID, Person_ID, Member_ID, Start_Date) VALUES
('EMP010', 'P020', 'P020', '2024-08-01');  -- Silver member enrolled within a month - should NOT appear

-- ==============================================
-- EXPECTED QUERY RESULTS:
-- The query should return exactly 3 employees:
-- 1. EMP006 (P016 - Alice Johnson) - Enrolled 5 days after employment
-- 2. EMP007 (P017 - Robert Chen) - Enrolled 24 days after employment
-- 3. EMP008 (P018 - Maria Rodriguez) - Enrolled 21 days after employment
--
-- Should NOT return:
-- - EMP009 (P019) - Enrolled 74 days after (more than 1 month)
-- - EMP010 (P020) - Silver member (not gold)
-- ==============================================

-- ==============================================
-- END OF SAMPLE DATA
-- ==============================================

-- ---------------------------------------------
-- Additional test data to validate TopGoldMember view
-- Create 6 borrow events for gold member P001 within past month (Nov 6 - Dec 6, 2025)
-- ---------------------------------------------
INSERT INTO PAYMENT (Payment_ID, Payment_Method, Payment_Date, Amount_Paid) VALUES
('PAY200', 'Credit Card', '2025-11-08', 12.00),
('PAY201', 'Credit Card', '2025-11-09', 12.00),
('PAY202', 'Credit Card', '2025-11-10', 12.00),
('PAY203', 'Credit Card', '2025-11-11', 12.00),
('PAY204', 'Credit Card', '2025-11-12', 12.00),
('PAY205', 'Credit Card', '2025-11-13', 12.00);

INSERT INTO BORROWING_RECORD (Payment_ID, Issue_Date, Return_Due_Date) VALUES
('PAY200', '2025-11-08', '2025-11-22'),
('PAY201', '2025-11-09', '2025-11-23'),
('PAY202', '2025-11-10', '2025-11-24'),
('PAY203', '2025-11-11', '2025-11-25'),
('PAY204', '2025-11-12', '2025-11-26'),
('PAY205', '2025-11-13', '2025-11-27');

INSERT INTO BORROWS (Payment_ID, Member_ID) VALUES
('PAY200', 'P001'),
('PAY201', 'P001'),
('PAY202', 'P001'),
('PAY203', 'P001'),
('PAY204', 'P001'),
('PAY205', 'P001');

INSERT INTO ENTRY (Payment_ID, Book_ID) VALUES
('PAY200', 'BK00000001'),
('PAY201', 'BK00000002'),
('PAY202', 'BK00000003'),
('PAY203', 'BK00000004'),
('PAY204', 'BK00000005'),
('PAY205', 'BK00000006');

-- ---------------------------------------------
-- Additional data for the new set of queries
-- 1) Supervisors hired within past 2 months
-- 2) Employees who are members and their borrows in past month
-- 3) Extra borrows for gold members to compute top-5 average
-- 4) Additional entries to ensure publisher/book popularity clarity
-- ---------------------------------------------

-- Add PERSONs for new recent supervisors
INSERT INTO PERSON (Person_ID, Fname, MName, LName, Address, Gender, DOB) VALUES
('P021', 'Olivia', 'May', 'Brown', '21 Elm St, Portland, OR', 'F', '1991-04-02'),
('P022', 'Liam', 'Alexander', 'Carter', '34 Pine St, Eugene, OR', 'M', '1987-09-11');

-- Add EMPLOYEE records for the new supervisors with recent start dates (within past 2 months)
INSERT INTO EMPLOYEE (Employee_ID, Person_ID, Member_ID, Start_Date) VALUES
('EMP011', 'P021', NULL, '2025-11-10'),
('EMP012', 'P022', NULL, '2025-11-20');

-- Mark them as library supervisors (use existing trainer IDs)
INSERT INTO LIBRARY_SUPERVISOR (Employee_ID, Trainer_ID) VALUES
('EMP011', 1),
('EMP012', 2);

-- ------------------------------------------------------------------
-- 2) Employees who are members and borrowed books in the past month
-- Use existing gold members P016, P017, P018 (EMP006/7/8 correspond to these)
-- Add payments and borrowing records dated within last month (Nov 6 - Dec 6, 2025)
-- ------------------------------------------------------------------
INSERT INTO PAYMENT (Payment_ID, Payment_Method, Payment_Date, Amount_Paid) VALUES
('PAY300', 'Cash', '2025-11-10', 8.00),
('PAY301', 'Cash', '2025-11-11', 7.50),
('PAY302', 'Debit Card', '2025-11-12', 9.00),
('PAY303', 'Credit Card', '2025-11-13', 11.00),
('PAY304', 'Credit Card', '2025-11-14', 10.00),
('PAY305', 'Cash', '2025-11-15', 6.50);

INSERT INTO BORROWING_RECORD (Payment_ID, Issue_Date, Return_Due_Date) VALUES
('PAY300', '2025-11-10', '2025-11-24'),
('PAY301', '2025-11-11', '2025-11-25'),
('PAY302', '2025-11-12', '2025-11-26'),
('PAY303', '2025-11-13', '2025-11-27'),
('PAY304', '2025-11-14', '2025-11-28'),
('PAY305', '2025-11-15', '2025-11-29');

-- Link borrows to member-employees: P016 (EMP006), P017 (EMP007), P018 (EMP008)
INSERT INTO BORROWS (Payment_ID, Member_ID) VALUES
('PAY300', 'P016'),
('PAY301', 'P016'),
('PAY302', 'P017'),
('PAY303', 'P017'),
('PAY304', 'P018'),
('PAY305', 'P018');

-- Each payment maps to one or two books (ENTRY)
INSERT INTO ENTRY (Payment_ID, Book_ID) VALUES
('PAY300', 'BK00000021'), ('PAY300', 'BK00000022'),
('PAY301', 'BK00000023'),
('PAY302', 'BK00000024'), ('PAY302', 'BK00000025'),
('PAY303', 'BK00000026'),
('PAY304', 'BK00000027'), ('PAY304', 'BK00000028'),
('PAY305', 'BK00000029');

-- ------------------------------------------------------------------
-- 3) Extra borrows for gold members to ensure top-5 calculation is meaningful
-- Create a set of payments (PAY400...) for several gold members and multiple ENTRY rows
-- ------------------------------------------------------------------
INSERT INTO PAYMENT (Payment_ID, Payment_Method, Payment_Date, Amount_Paid) VALUES
('PAY400', 'Credit Card', '2025-10-20', 12.00),
('PAY401', 'Credit Card', '2025-10-21', 12.00),
('PAY402', 'Cash', '2025-10-22', 12.00),
('PAY403', 'Debit Card', '2025-10-23', 12.00),
('PAY404', 'Cash', '2025-10-24', 12.00),
('PAY405', 'Credit Card', '2025-10-25', 12.00),
('PAY406', 'Credit Card', '2025-10-26', 12.00),
('PAY407', 'Credit Card', '2025-10-27', 12.00),
('PAY408', 'Cash', '2025-10-28', 12.00),
('PAY409', 'Debit Card', '2025-10-29', 12.00),
('PAY410', 'Cash', '2025-10-30', 12.00);

INSERT INTO BORROWING_RECORD (Payment_ID, Issue_Date, Return_Due_Date) VALUES
('PAY400', '2025-10-20', '2025-11-03'),
('PAY401', '2025-10-21', '2025-11-04'),
('PAY402', '2025-10-22', '2025-11-05'),
('PAY403', '2025-10-23', '2025-11-06'),
('PAY404', '2025-10-24', '2025-11-07'),
('PAY405', '2025-10-25', '2025-11-08'),
('PAY406', '2025-10-26', '2025-11-09'),
('PAY407', '2025-10-27', '2025-11-10'),
('PAY408', '2025-10-28', '2025-11-11'),
('PAY409', '2025-10-29', '2025-11-12'),
('PAY410', '2025-10-30', '2025-11-13');

-- Assign these payments to gold members: P003, P005, P007, P009, P016
INSERT INTO BORROWS (Payment_ID, Member_ID) VALUES
('PAY400', 'P003'),
('PAY401', 'P003'),
('PAY402', 'P005'),
('PAY403', 'P005'),
('PAY404', 'P007'),
('PAY405', 'P007'),
('PAY406', 'P009'),
('PAY407', 'P009'),
('PAY408', 'P016'),
('PAY409', 'P016'),
('PAY410', 'P016');

-- Multiple ENTRY rows per payment to increase book counts
INSERT INTO ENTRY (Payment_ID, Book_ID) VALUES
('PAY400', 'BK00000002'), ('PAY400', 'BK00000003'), ('PAY400', 'BK00000005'),
('PAY401', 'BK00000005'), ('PAY401', 'BK00000007'),
('PAY402', 'BK00000011'), ('PAY402', 'BK00000012'),
('PAY403', 'BK00000013'),
('PAY404', 'BK00000014'), ('PAY404', 'BK00000015'), ('PAY404', 'BK00000016'),
('PAY405', 'BK00000017'),
('PAY406', 'BK00000018'), ('PAY406', 'BK00000019'),
('PAY407', 'BK00000020'),
('PAY408', 'BK00000021'), ('PAY408', 'BK00000022'),
('PAY409', 'BK00000023'),
('PAY410', 'BK00000024');

-- ------------------------------------------------------------------
-- 4) Additional entries to make publisher->most-popular-book clearer
-- Map some existing payments to books from publishers that might be underrepresented
-- ------------------------------------------------------------------
INSERT INTO ENTRY (Payment_ID, Book_ID) VALUES
('PAY300', 'BK00000002'), -- PUB1
('PAY301', 'BK00000009'), -- PUB1
('PAY302', 'BK00000014'), -- PUB1
('PAY303', 'BK00000004'), -- PUB3
('PAY304', 'BK00000010'), -- PUB2
('PAY305', 'BK00000011'); -- PUB2

-- ==============================================
-- TEST DATA FOR ALL FIVE VIEWS
-- ==============================================

-- ============================================================
-- 1. TopGoldMember: Gold members with >5 books in past month
-- ============================================================
INSERT INTO PAYMENT (Payment_ID, Payment_Method, Payment_Date, Amount_Paid) VALUES
('PAY500', 'Credit Card', '2025-12-01', 15.00),
('PAY501', 'Credit Card', '2025-12-02', 15.00);

INSERT INTO BORROWING_RECORD (Payment_ID, Issue_Date, Return_Due_Date) VALUES
('PAY500', '2025-12-01', '2025-12-15'),
('PAY501', '2025-12-02', '2025-12-16');

INSERT INTO BORROWS (Payment_ID, Member_ID) VALUES
('PAY500', 'P001'),
('PAY501', 'P001');

INSERT INTO ENTRY (Payment_ID, Book_ID) VALUES
('PAY500', 'BK00000008'),
('PAY501', 'BK00000010');

-- ============================================================
-- 2. PopularBooks: Most borrowed in past year
-- ============================================================
INSERT INTO PAYMENT (Payment_ID, Payment_Method, Payment_Date, Amount_Paid) VALUES
('PAY502', 'Cash', '2025-10-01', 12.00),
('PAY503', 'Cash', '2025-09-15', 12.00);

INSERT INTO BORROWING_RECORD (Payment_ID, Issue_Date, Return_Due_Date) VALUES
('PAY502', '2025-10-01', '2025-10-15'),
('PAY503', '2025-09-15', '2025-09-29');

INSERT INTO BORROWS (Payment_ID, Member_ID) VALUES
('PAY502', 'P003'),
('PAY503', 'P005');

INSERT INTO ENTRY (Payment_ID, Book_ID) VALUES
('PAY502', 'BK00000005'),
('PAY503', 'BK00000005');

-- ============================================================
-- 3. BestRatingPublisher: All books avg >= 4.0
-- ============================================================
INSERT INTO COMMENTS (Person_ID, Book_ID, Comment_Time, Rating, Content) VALUES
('P001', 'BK00000026', '2025-11-15 10:00:00', 5, 'Excellent guide to software.'),
('P002', 'BK00000033', '2025-11-16 11:00:00', 4, 'Patterns are well explained.'),
('P003', 'BK00000040', '2025-11-17 12:00:00', 5, 'Pragmatic advice for developers.'),
('P004', 'BK00000026', '2025-11-18 13:00:00', 4, 'Good principles for clean code.'),
('P005', 'BK00000033', '2025-11-19 14:00:00', 5, 'Must-read for OOP design.');

-- ============================================================
-- 4. PotentialGoldMember: Silver members with monthly borrows all 12 months
-- P002 and P004 already present with full monthly coverage

-- ============================================================
-- 5. ActiveReceptionist: Receptionists with >5 inquiries resolved in past month
-- ============================================================
INSERT INTO INQUIRY (Inquiry_ID, Inquiry_Time, Resolution_Status, Member_ID, Rating, Receptionist_ID) VALUES
('INQ013', '2025-12-01 10:00:00', 'Resolved', 'P001', 5, 'EMP005'),
('INQ014', '2025-12-02 11:00:00', 'Resolved', 'P002', 4, 'EMP005');
