# SELECT title, released_year FROM books WHERE released_year = 2017;

# SELECT title, released_year FROM books WHERE released_year != 2017;

# SELECT title, author_lname FROM books WHERE author_lname = 'Harris';

# SELECT title, author_lname FROM books WHERE author_lname != 'Harris';

# SELECT title FROM books WHERE title NOT LIKE 'W%';

# SELECT * FROM books WHERE released_year > 2000;

# SELECT title, released_year FROM books WHERE released_year > 2000 ORDER BY released_year;

# SELECT title, released_year FROM books WHERE released_year >= 2000 ORDER BY released_year;

# SELECT title, stock_quantity FROM books WHERE stock_quantity >= 100; 

# SELECT 99 > 1;

# SELECT 99 > 567:

# SELECT 'a' > 'b';

# SELECT 'A' > 'a';

# SELECT 'A' >= 'a';

# SELECT 'A' = 'a';

# SELECT * FROM books WHERE released_year < 2000 ORDER BY released_year;

# SELECT * FROM books WHERE released_year <= 2000 ORDER BY released_year;

# SELECT title, author_lname, released_year FROM books WHERE author_lname = 'Eggers' AND released_year > 2010;

# SELECT title, author_lname, released_year FROM books WHERE author_lname = 'Eggers' && released_year > 2010;

# SELECT title, author_lname, stock_quantity FROM books WHERE author_lname NOT LIKE 'Har%' AND stock_quantity > 10;

# SELECT 5 < 9 && 20 = 2;

# SELECT title, author_lname, stock_quantity FROM books WHERE title LIKE 'Lincoln%' && author_lname NOT LIKE '%Lincoln%' AND stock_quantity >= 100;

# SELECT title, released_year, stock_quantity FROM books WHERE released_year > 2005 OR stock_quantity >= 20;

# SELECT title, released_year, stock_quantity FROM books WHERE title LIKE 'American%' || released_year >= 2010 OR stock_quantity >= 20;

# SELECT title, author_lname, stock_quantity FROM books WHERE stock_quantity BETWEEN 20 AND 100;

# SELECT title, author_lname, stock_quantity FROM books WHERE stock_quantity NOT BETWEEN 20 AND 100;

# SELECT CAST('2021-07-04' AS DATETIME);

# SELECT title, pages FROM books WHERE pages IN( 343, 304, 320, 367, 329);

# SELECT title, pages FROM books WHERE pages NOT IN( 343, 304, 320, 367, 329);

# SELECT title, pages FROM books WHERE pages >= 300 AND pages % 2 != 0 ORDER BY pages;

# SELECT title, pages,
#     CASE
#         WHEN pages BETWEEN 0 AND 300 THEN 'Short'
#         WHEN pages BETWEEN 301 AND 600 THEN 'Medium'
#         ELSE 'Long'
#     END AS LENGTH
# FROM books;

# SELECT title, pages,
#     CASE 
#         WHEN pages <= 300 THEN 'Short'
#         WHEN pages <= 600 THEN 'Medium'
#         ELSE 'Long'
#     END AS LENGTH
# FROM books;

# SELECT * FROM books WHERE released_year < 1980;

# SELECT * FROM books WHERE author_lname = 'Eggers' || 'Chabon';

# SELECT * FROM books WHERE author_lname = 'Lahiri' AND released_year > 2000;

# SELECT * FROM books WHERE pages BETWEEN 100 AND 200;

# SELECT * FROM books WHERE author_lname LIKE "C%" || 'S%';

# SELECT title, author_lname,
#     CASE
#         WHEN title LIKE '%stories%' THEN 'Short Stories'
#         WHEN title IN('Just Kids', 'A Heartbreaking%') THEN 'Memoir'
#         ELSE 'Novel'
#     END AS TYPE
# FROM books;

SELECT author_fname, author_lname,
    CASE
        WHEN COUNT(*) = 1 THEN '1 book'
        ELSE CONCAT(COUNT(*), 'books')
    END AS COUNT
FROM books
GROUP BY author_lname, author_fname;
