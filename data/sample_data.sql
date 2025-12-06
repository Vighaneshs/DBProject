USE jungle_library_db;

-- ==============================================
-- SAMPLE DATA FOR JUNGLE LIBRARY DATABASE
-- Respects all foreign keys, constraints, and enums
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
-- ---------------------------------------------
INSERT INTO CARD_DETAIL (Card_ID, Card_Issue_Date) VALUES
('CARD-G-001', '2023-01-15'),
('CARD-S-002', '2023-02-20'),
('CARD-G-003', '2023-03-10'),
('CARD-S-004', '2023-04-05'),
('CARD-G-005', '2023-05-12'),
('CARD-S-006', '2023-06-18'),
('CARD-G-007', '2023-07-22'),
('CARD-S-008', '2023-08-30'),
('CARD-G-009', '2023-09-14'),
('CARD-S-010', '2023-10-25');

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
-- ---------------------------------------------
INSERT INTO COMMENTS (Person_ID, Book_ID, Comment_Time, Rating, Content) VALUES
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
('P001', 'BK00000002', '2024-04-01 16:00:00', 5, 'Big Brother is watching! Chillingly relevant today.');

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
('PAY001', 'Credit Card', '2024-11-01', 15.00),
('PAY002', 'Debit Card', '2024-11-03', 10.00),
('PAY003', 'Cash', '2024-11-05', 15.00),
('PAY004', 'Credit Card', '2024-11-07', 20.00),
('PAY005', 'PayPal', '2024-11-10', 10.00),
('PAY006', 'Credit Card', '2024-11-12', 15.00),
('PAY007', 'Cash', '2024-11-15', 25.00),
('PAY008', 'Debit Card', '2024-11-18', 10.00),
('PAY009', 'Credit Card', '2024-11-20', 15.00),
('PAY010', 'Cash', '2024-11-22', 30.00);

-- ---------------------------------------------
-- 22. BORROWING_RECORD (Depends on PAYMENT)
-- ---------------------------------------------
INSERT INTO BORROWING_RECORD (Payment_ID, Issue_Date, Return_Due_Date) VALUES
('PAY001', '2024-11-01', '2024-11-15'),
('PAY002', '2024-11-03', '2024-11-17'),
('PAY003', '2024-11-05', '2024-11-19'),
('PAY004', '2024-11-07', '2024-11-21'),
('PAY005', '2024-11-10', '2024-11-24'),
('PAY006', '2024-11-12', '2024-11-26'),
('PAY007', '2024-11-15', '2024-11-29'),
('PAY008', '2024-11-18', '2024-12-02'),
('PAY009', '2024-11-20', '2024-12-04'),
('PAY010', '2024-11-22', '2024-12-06');

-- ---------------------------------------------
-- 23. BORROWS (Depends on BORROWING_RECORD and MEMBER)
-- ---------------------------------------------
INSERT INTO BORROWS (Payment_ID, Member_ID) VALUES
('PAY001', 'P001'),
('PAY002', 'P002'),
('PAY003', 'P003'),
('PAY004', 'P004'),
('PAY005', 'P005'),
('PAY006', 'P006'),
('PAY007', 'P007'),
('PAY008', 'P008'),
('PAY009', 'P009'),
('PAY010', 'P010');

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
('INQ001', '2024-11-01 09:00:00', 'Resolved', 'P001', 5, 'EMP005'),
('INQ002', '2024-11-05 10:30:00', 'Resolved', 'P002', 4, 'EMP005'),
('INQ003', '2024-11-08 14:15:00', 'Pending', 'P003', NULL, 'EMP005'),
('INQ004', '2024-11-12 11:45:00', 'Resolved', 'P004', 5, 'EMP005'),
('INQ005', '2024-11-15 16:00:00', 'In Progress', 'P005', NULL, 'EMP005'),
('INQ006', '2024-11-18 09:30:00', 'Resolved', 'P006', 4, 'EMP005'),
('INQ007', '2024-11-20 13:20:00', 'Resolved', 'P007', 5, 'EMP005'),
('INQ008', '2024-11-22 10:10:00', 'Pending', 'P008', NULL, 'EMP005');

-- ---------------------------------------------
-- 27. ENTRY (Depends on BORROWING_RECORD and BOOK)
-- ---------------------------------------------
INSERT INTO ENTRY (Payment_ID, Book_ID) VALUES
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
('PAY010', 'BK00000015');

-- ==============================================
-- END OF SAMPLE DATA
-- ==============================================