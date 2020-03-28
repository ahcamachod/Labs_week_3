SELECT  a.au_id AS "Author ID",
		a.au_fname AS "Author First Name",
		a.au_lname AS "Author Last Name",
		COALESCE(SUM(d.qty),0) AS "TOTAL"
FROM authors AS a
LEFT JOIN titleauthor AS b ON a.au_id = b.au_id
LEFT JOIN sales AS d ON d.title_id = d.title_id
GROUP BY a.au_id, a.au_lname, a.au_fname
ORDER BY "TOTAL" DESC LIMIT 3;
