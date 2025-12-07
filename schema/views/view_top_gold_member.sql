USE jungle_library_db;

CREATE OR REPLACE VIEW TopGoldMember AS
SELECT
	P.FName AS First_Name,
	P.LName AS Last_Name,
	CD.Card_Issue_Date AS Membership_Enrollment_Date
FROM MEMBER M
JOIN PERSON P ON M.Member_ID = P.Person_ID
LEFT JOIN CARD_DETAIL CD ON M.Card_ID = CD.Card_ID
JOIN BORROWS B ON M.Member_ID = B.Member_ID
JOIN ENTRY E ON B.Payment_ID = E.Payment_ID
JOIN BORROWING_RECORD BR ON BR.Payment_ID = E.Payment_ID
WHERE BR.Issue_Date >= DATE_SUB(CURDATE(), INTERVAL 1 MONTH)
GROUP BY M.Member_ID
HAVING COUNT(E.Book_ID) > 5
;