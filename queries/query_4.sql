USE jungle_library_db;

SELECT
	P.Publisher_Name,
	B.Book_Title,
    S.borrow_count
FROM PUBLISHER P
JOIN BOOK B ON B.Publisher_ID = P.Publisher_ID
JOIN (
	-- compute borrow counts per book
	SELECT EN.Book_ID, COUNT(*) AS borrow_count
	FROM ENTRY EN
	GROUP BY EN.Book_ID
) AS S ON S.Book_ID = B.Book_ID
WHERE S.borrow_count = (
	-- find the maximum borrow_count among books for this publisher
	SELECT MAX(S2.borrow_count)
	FROM BOOK B2
	JOIN (
		SELECT EN2.Book_ID, COUNT(*) AS borrow_count
		FROM ENTRY EN2
		GROUP BY EN2.Book_ID
	) S2 ON S2.Book_ID = B2.Book_ID
	WHERE B2.Publisher_ID = P.Publisher_ID
)
ORDER BY P.Publisher_Name;