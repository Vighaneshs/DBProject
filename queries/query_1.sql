USE jungle_library_db;

SELECT E.Employee_ID, P.FName, P.MName, P.LName, P.Address, P.Gender, P.DOB from LIBRARY_SUPERVISOR L
Join EMPLOYEE E ON L.Employee_ID = E.Employee_ID
JOIN PERSON P ON E.Person_ID = P.Person_ID 
WHERE E.Start_Date >= DATE_SUB(CURDATE(), INTERVAL 2 MONTH);
