USE P;

WITH BorrowCount AS (
    SELECT borrower_id, COUNT(*) AS total_borrowed
    FROM Loans
    GROUP BY borrower_id
),
NotReturnedCount AS (
    SELECT borrower_id, COUNT(*) AS total_not_returned
    FROM Loans
    WHERE status != 'Returned'
    GROUP BY borrower_id
)

SELECT b.first_name, b.last_name, bk.title, a.first_name AS author_first_name, a.last_name AS author_last_name,
       (CAST(nrc.total_not_returned AS FLOAT) / bc.total_borrowed) AS not_returned_ratio
FROM Borrowers b
JOIN BorrowCount bc ON b.borrower_id = bc.borrower_id
JOIN NotReturnedCount nrc ON b.borrower_id = nrc.borrower_id
JOIN Loans l ON b.borrower_id = l.borrower_id
JOIN Books bk ON l.book_id = bk.book_id
JOIN Authors a ON bk.author_id = a.author_id
WHERE (CAST(nrc.total_not_returned AS FLOAT)/ bc.total_borrowed) > 0.5

UNION ALL

SELECT b.first_name, b.last_name, bk.title, a.first_name AS author_first_name, a.last_name AS author_last_name,
       (CAST(nrc.total_not_returned AS FLOAT)/ bc.total_borrowed) AS not_returned_ratio
FROM Borrowers b
JOIN BorrowCount bc ON b.borrower_id = bc.borrower_id
JOIN NotReturnedCount nrc ON b.borrower_id = nrc.borrower_id
JOIN Loans l ON b.borrower_id = l.borrower_id
JOIN Books bk ON l.book_id = bk.book_id
JOIN Authors a ON bk.author_id = a.author_id
WHERE (CAST(nrc.total_not_returned AS FLOAT) / bc.total_borrowed) <= 0.5

ORDER BY not_returned_ratio DESC;
