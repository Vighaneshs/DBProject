USE jungle_library_db;

-- Add Query b here
-- Average number of books borrowed by the top five gold members
SELECT AVG(book_count) AS avg_books
FROM (
	SELECT
		M.Member_ID,
		COUNT(EN.Book_ID) AS book_count
	FROM MEMBER M
	JOIN BORROWS B ON M.Member_ID = B.Member_ID
	JOIN ENTRY EN ON EN.Payment_ID = B.Payment_ID
	WHERE M.Member_type = 'gold'
	GROUP BY M.Member_ID
	ORDER BY book_count DESC
	LIMIT 5
) AS top5;