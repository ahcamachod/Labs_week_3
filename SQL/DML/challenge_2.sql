SELECT  a.au_id AS "Author ID",
		a.au_fname AS "Author First Name",
		a.au_lname AS "Author Last Name",
		d.pub_name AS "Publisher",
		COUNT(c.title) AS "Title Count"

FROM authors AS a
INNER JOIN titleauthor AS b ON a.au_id = b.au_id
INNER JOIN titles AS c ON b.title_id = c.title_id
INNER JOIN publishers AS d ON c.pub_id = d.pub_id
GROUP BY a.au_id, d.pub_name, a.au_lname, a.au_fname
ORDER BY "Title Count" DESC;
