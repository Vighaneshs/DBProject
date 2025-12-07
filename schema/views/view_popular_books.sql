USE jungle_library_db;

CREATE OR REPLACE VIEW PopularBooks AS
SELECT
	B.Book_ID,
	B.Book_Title,
	B.Category,
    B.Synopsis,
	COUNT(E.Book_ID) AS Borrow_Count
FROM ENTRY E
JOIN BORROWING_RECORD R ON E.Payment_ID = R.Payment_ID
JOIN BOOK B ON E.Book_ID = B.Book_ID
WHERE R.Issue_Date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY B.Book_ID ORDER BY Borrow_Count DESC
;