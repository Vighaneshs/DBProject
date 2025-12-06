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
('P015', 'James', 'William', 'Martin', '486 Cedar Court, Seattle, WA', 'M', '1982-03-22');

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
('P009', 'BK00000003', '2024-07-10 09:00:00', 4, 'Classic romance done right. Love the characters.'),
('P010', 'BK00000009', '2024-08-05 16:00:00', 5, 'Every sentence has meaning. Absolutely brilliant.'),
-- PUB5 (Hachette) books: BK00000007, BK00000008
('P001', 'BK00000007', '2024-08-15 10:45:00', 5, 'The greatest fantasy epic ever written.'),
('P002', 'BK00000008', '2024-08-20 13:00:00', 5, 'Charming and adventurous. Perfect prequel to LOTR.'),
('P003', 'BK00000007', '2024-09-01 11:30:00', 4, 'Rich world, unforgettable characters.'),
('P004', 'BK00000008', '2024-09-10 15:20:00', 4, 'A delightful journey. Bilbo is wonderful.'),
-- PUB2 (HarperCollins) books: BK00000001, BK00000010, BK00000011, BK00000015
('P005', 'BK00000001', '2024-09-20 10:00:00', 5, 'Powerful and moving. A true American classic.'),
('P006', 'BK00000011', '2024-10-01 14:00:00', 4, 'Magical adventures in Narnia. Lewis creates wonder.'),
('P007', 'BK00000015', '2024-10-15 09:30:00', 5, 'Revolutionary perspective on human history.'),
('P008', 'BK00000010', '2024-10-20 13:15:00', 5, 'Disturbing and brilliant. Huxley was a visionary.'),
('P009', 'BK00000011', '2024-11-01 10:30:00', 5, 'Timeless fantasy. Perfect for all ages.'),
-- PUB7 (Pearson Education) - BK00000013
('P010', 'BK00000013', '2024-11-05 15:00:00', 5, 'Comprehensive and essential for CS students.'),
('P001', 'BK00000013', '2024-11-10 11:00:00', 4, 'Detailed and well-structured. Great reference.'),
-- PUB3 (Simon & Schuster) books: BK00000004, BK00000012
('P002', 'BK00000004', '2024-11-15 10:30:00', 4, 'Beautiful prose. Captures the Jazz Age perfectly.'),
('P003', 'BK00000012', '2024-11-20 14:00:00', 5, 'Powerful warning about censorship. Brilliant.'),
('P004', 'BK00000004', '2024-11-22 09:45:00', 5, 'Gatsby is unforgettable. Fitzgerald is a master.'),
-- PUB4 (Macmillan) - BK00000006
('P005', 'BK00000006', '2024-11-25 13:30:00', 4, 'Captures teenage angst perfectly. Holden is iconic.'),
('P006', 'BK00000006', '2024-11-28 10:00:00', 4, 'Raw and honest. A coming-of-age classic.');

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
('EMP003', 'P013', NULL, '2021-06-10'),
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
('PAY025', 'Credit Card', '2024-01-05', 10.00),
('PAY026', 'Credit Card', '2024-02-05', 10.00),
('PAY027', 'Credit Card', '2024-03-05', 10.00),
('PAY028', 'Credit Card', '2024-04-05', 10.00),
('PAY029', 'Credit Card', '2024-05-05', 10.00),
('PAY030', 'Credit Card', '2024-06-05', 10.00),
('PAY031', 'Credit Card', '2024-07-05', 10.00),
('PAY032', 'Credit Card', '2024-08-05', 10.00),
('PAY033', 'Credit Card', '2024-09-05', 10.00),
('PAY034', 'Credit Card', '2024-10-05', 10.00),
('PAY035', 'Credit Card', '2024-11-05', 10.00),
('PAY036', 'Credit Card', '2024-12-05', 10.00),
-- Monthly payments for silver member P004 (another PotentialGoldMember candidate)
('PAY037', 'Debit Card', '2024-01-10', 10.00),
('PAY038', 'Debit Card', '2024-02-10', 10.00),
('PAY039', 'Debit Card', '2024-03-10', 10.00),
('PAY040', 'Debit Card', '2024-04-10', 10.00),
('PAY041', 'Debit Card', '2024-05-10', 10.00),
('PAY042', 'Debit Card', '2024-06-10', 10.00),
('PAY043', 'Debit Card', '2024-07-10', 10.00),
('PAY044', 'Debit Card', '2024-08-10', 10.00),
('PAY045', 'Debit Card', '2024-09-10', 10.00),
('PAY046', 'Debit Card', '2024-10-10', 10.00),
('PAY047', 'Debit Card', '2024-11-10', 10.00),
('PAY048', 'Debit Card', '2024-12-03', 10.00),
-- Additional historical payments
('PAY049', 'Cash', '2024-01-20', 15.00),
('PAY050', 'Credit Card', '2024-02-20', 15.00);

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
('PAY025', '2024-01-05', '2024-01-19'),
('PAY026', '2024-02-05', '2024-02-19'),
('PAY027', '2024-03-05', '2024-03-19'),
('PAY028', '2024-04-05', '2024-04-19'),
('PAY029', '2024-05-05', '2024-05-19'),
('PAY030', '2024-06-05', '2024-06-19'),
('PAY031', '2024-07-05', '2024-07-19'),
('PAY032', '2024-08-05', '2024-08-19'),
('PAY033', '2024-09-05', '2024-09-19'),
('PAY034', '2024-10-05', '2024-10-19'),
('PAY035', '2024-11-05', '2024-11-19'),
('PAY036', '2024-12-05', '2024-12-19'),
-- Monthly records for silver member P004 (PotentialGoldMember)
('PAY037', '2024-01-10', '2024-01-24'),
('PAY038', '2024-02-10', '2024-02-24'),
('PAY039', '2024-03-10', '2024-03-24'),
('PAY040', '2024-04-10', '2024-04-24'),
('PAY041', '2024-05-10', '2024-05-24'),
('PAY042', '2024-06-10', '2024-06-24'),
('PAY043', '2024-07-10', '2024-07-24'),
('PAY044', '2024-08-10', '2024-08-24'),
('PAY045', '2024-09-10', '2024-09-24'),
('PAY046', '2024-10-10', '2024-10-24'),
('PAY047', '2024-11-10', '2024-11-24'),
('PAY048', '2024-12-03', '2024-12-17'),
-- Additional historical records
('PAY049', '2024-01-20', '2024-02-03'),
('PAY050', '2024-02-20', '2024-03-05');

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
('PAY023', 'P009'),
('PAY024', 'P001'),
-- Monthly borrows for silver member P002 (PotentialGoldMember - every month 2024)
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
-- Additional historical
('PAY049', 'P006'),
('PAY050', 'P008');

-- ---------------------------------------------
-- 24. CATALOGING_LOG (Depends on CATALOGING_MANAGER and BOOK)
-- ---------------------------------------------
INSERT INTO CATALOGING_LOG (Manager_ID, Book_ID, Catalog_Date) VALUES
('EMP001', 'BK00000001', '2023-01-10'),
('EMP001', 'BK00000002', '2023-01-11'),
('EMP001', 'BK00000003', '2023-01-12'),
('EMP003', 'BK00000004', '2023-01-15'),
('EMP003', 'BK00000005', '2023-01-16'),
('EMP001', 'BK00000006', '2023-02-01'),
('EMP003', 'BK00000007', '2023-02-05'),
('EMP001', 'BK00000008', '2023-02-10'),
('EMP003', 'BK00000009', '2023-03-01'),
('EMP001', 'BK00000010', '2023-03-15');

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
('INQ001', '2024-11-01 09:00:00', 'Resolved', 'P001', 5, 'EMP005'),
('INQ002', '2024-11-05 10:30:00', 'Resolved', 'P002', 4, 'EMP005'),
('INQ003', '2024-11-08 14:15:00', 'Resolved', 'P003', 5, 'EMP005'),
('INQ004', '2024-11-12 11:45:00', 'Resolved', 'P004', 5, 'EMP005'),
('INQ005', '2024-11-15 16:00:00', 'Resolved', 'P005', 4, 'EMP005'),
('INQ006', '2024-11-18 09:30:00', 'Resolved', 'P006', 4, 'EMP005'),
('INQ007', '2024-11-20 13:20:00', 'Resolved', 'P007', 5, 'EMP005'),
('INQ008', '2024-11-22 10:10:00', 'Resolved', 'P008', 5, 'EMP005'),
('INQ009', '2024-11-24 14:30:00', 'Pending', 'P009', NULL, 'EMP005'),
('INQ010', '2024-11-26 11:00:00', 'In Progress', 'P010', NULL, 'EMP005'),
-- Older inquiries
('INQ011', '2024-10-15 09:00:00', 'Resolved', 'P001', 5, 'EMP005'),
('INQ012', '2024-09-20 10:30:00', 'Resolved', 'P002', 4, 'EMP005');

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
('PAY031', 'BK00000011'),
('PAY032', 'BK00000012'),
('PAY033', 'BK00000013'),
('PAY034', 'BK00000014'),
('PAY035', 'BK00000015'),
('PAY036', 'BK00000001'),
-- Monthly entries for P004 (PotentialGoldMember)
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
('PAY050', 'BK00000015');

-- ==============================================
-- END OF SAMPLE DATA
-- ==============================================