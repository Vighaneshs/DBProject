USE jungle_library_db;

SELECT
	E.Employee_ID,
	P.FName    AS First_Name,
	P.LName    AS Last_Name,
	M.Member_type,
	BR.Issue_Date,
	EN.Book_ID,
	B.Book_Title
FROM EMPLOYEE E
JOIN PERSON P ON E.Person_ID = P.Person_ID
JOIN MEMBER M ON E.Member_ID = M.Member_ID
JOIN BORROWS BO ON M.Member_ID = BO.Member_ID
JOIN BORROWING_RECORD BR ON BR.Payment_ID = BO.Payment_ID
JOIN ENTRY EN ON EN.Payment_ID = BR.Payment_ID
JOIN BOOK B ON B.Book_ID = EN.Book_ID
WHERE BR.Issue_Date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
ORDER BY E.Employee_ID, BR.Issue_Date DESC;