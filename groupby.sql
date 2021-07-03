# SELECT author_fname, author_lname, COUNT(*) FROM books GROUP BY author_lname, author_fname;

# SELECT CONCAT ('In ', released_year, ' ', COUNT(*), ' book(s) released.') AS year FROM books GROUP BY released_year; 

# SELECT author_fname, author_lname, SUM(pages) FROM books GROUP BY author_lname, author_fname;

# SELECT SUM(stock_quantity) FROM books;

# SELECT AVG(pages) FROM books;

# SELECT AVG(stock_quantity) FROM books GROUP BY released_year;

# SELECT released_year, AVG(stock_quantity) FROM books GROUP BY released_year;

# SELECT SUM(stock_quantity) FROM books;

# SELECT COUNT(title) FROM books;

# SELECT COUNT(*) FROM books;

# SELECT released_year, COUNT(title) FROM books GROUP BY released_year;

# SELECT author_fname, author_lname, AVG(released_year) FROM books GROUP BY released_year;

# SELECT CONCAT(author_fname, " ", author_lname) AS 'full name', MAX(pages) FROM books ORDER BY pages DESC LIMIT 1;

SELECT released_year AS 'year', COUNT(released_year) AS '# of books', AVG(pages) FROM books GROUP BY released_year;
