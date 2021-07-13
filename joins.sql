# CREATE TABLE customers(
#     id                INT           NOT NULL        AUTO_INCREMENT        PRIMARY KEY,
#     first_name        VARCHAR(100)  NOT NULL,
#     last_name         VARCHAR(100)  NOT NULL,
#     email             VARCHAR(100)  NOT NULL
# );

# CREATE TABLE orders(
#     id                INT           NOT NULL        AUTO_INCREMENT        PRIMARY KEY,
#     order_date        DATE,
#     amount            DECIMAL(8,2),
#     item_quantity     INT,
#     customer_id       INT           NOT NULL,
#     FOREIGN KEY(customer_id) REFERENCES customers(id)
# );

# INSERT INTO customers(first_name, last_name, email)
# VALUES  ('Jack', 'Anderson', 'janderson@zyxllc.com'),
#         ('Alice', 'Andrews', 'aandrews@boltoncorp.com'),
#         ('Dylan', 'Atkins', 'datkins@goingprosportz.com'),
#         ('Shondra', 'Ayers', 'sayers@wallzdown.com'),
#         ('Jayson', 'Baker', 'jbaker@bakerempowerz.com');
        
# INSERT INTO orders(order_date, amount, item_quantity, customer_id)
# VALUES( '2021/01/05',    127.80,    4,    2),
#       ( '2021/01/05',    34.99,     1,    3),
#       ( '2021/01/05',    34.99,     1,    3),
#       ( '2021/01/06',    227.43,    9,    1),
#       ( '2021/01/06',    44.99,     1,    4),
#       ( '2021/01/06',    149.99,    1,    5),
#       ( '2021/01/07',    34.99,     1,    3),
#       ( '2021/01/08',    123.25,    5,    2),
#       ( '2021/01/09',    79.99,     1,    1),
#       ( '2021/01/10',    243.58,    6,    4);

# Implicit Inner Joins

# SELECT * FROM customers, orders;

# SELECT * FROM customers, orders WHERE customers.id = orders.customer_id;

# SELECT first_name, last_name, order_date, amount FROM customers, orders WHERE customers.id = orders.customer_id;

# Explicit Inner Joins

# SELECT * FROM customers
# JOIN orders
#     ON customers.id = orders.customer_id;
    
# SELECT first_name, last_name, order_date, amount
# FROM customers
# JOIN orders
#     ON customers.id = orders.customer_id;

# SELECT first_name,
#         last_name,
#         order_date,
#         SUM(amount) AS total_spent
# FROM customers
# JOIN orders
#     ON customers.id = orders.customer_id
# GROUP BY orders.customer_id
# ORDER BY total_spent DESC;

# Left Joins

# SELECT * FROM customers
# LEFT JOIN orders
#     ON customers.id = orders.customer_id;

# SELECT
#     first_name,
#     last_name,
#     IFNULL (SUM(amount), 0) AS total_spent
# FROM customers
# LEFT JOIN orders
#     ON customers.id = orders.customer_id
# GROUP BY customers.id
# ORDER BY total_spent DESC;


# SELECT * FROM customers
# RIGHT JOIN orders
#     ON customers.id = orders.customer_id;

# Challenges

# CREATE TABLE students(
#     id INT AUTO_INCREMENT PRIMARY KEY,
#     first_name VARCHAR(100));

# CREATE TABLE papers(
# title VARCHAR(100),
# grade INT,
# student_id INT,
# FOREIGN KEY(student_id)
#     REFERENCES students(id)
#     ON DELETE CASCADE
# );

# INSERT INTO students(first_name) VALUES
# ('Caleb'), ('Samantha'), ('Raj'), ('Carlos'), ('Lisa');

# INSERT INTO papers(student_id, title, grade) VALUES
#     (1, 'My First Book Report', 60),
#     (1, 'My Second Book Report', 75),
#     (2, 'Russian Lit Through The Ages', 94),
#     (2, 'De Montaigne and The Art of the Essay', 98),
#     (4, 'Borges and Magical Realism', 89);

# SELECT first_name, title, grade
# FROM students
# INNER JOIN papers
#     ON students.id = papers.student_id
# ORDER BY grade DESC;

# SELECT first_name, title, grade
# FROM students
# LEFT JOIN papers
#     ON students.id = papers.student_id
# GROUP BY students.id;

# SELECT 
#     first_name,
#     IFNULL(title, 'MISSING'),
#     IFNULL(grade, 0)
# FROM students
# LEFT JOIN orders
#     ON students.id = papers.student_id;
    
# SELECT
#     first_name,
#     IFNULL(AVG(grade), 0) AS average
# FROM students
# LEFT JOIN papers
#     ON students.id = papers.student_id
# GROUP BY students.id
# ORDER BY AVG(grade) DESC;

# SELECT first_name,
#     IFNULL (AVG(grade), 0) AS average,
#     CASE
#         WHEN AVG(grade) IS NULL THEN 'FAILING'
#         WHEN AVG(grade) >= 75 THEN 'PASSING'
#         ELSE 'FAILING'
#     END AS passing_status
# FROM students
# LEFT JOIN papers
#     ON students.id = papers.student_id
# GROUP BY students.id
# ORDER BY AVG(grade) DESC;

# CREATE TABLE reviewers(
#     id    INT    AUTO_INCREMENT    PRIMARY KEY,
#     first_name   VARCHAR(100),
#     last_name    VARCHAR(100)
# );

# CREATE TABLE series(
#     id    INT    AUTO_INCREMENT    PRIMARY KEY,
#     title   VARCHAR(100),
#     release_year    YEAR(4),
#     genre    VARCHAR(100)
# );

# INSERT INTO series(title, release_year, genre) VALUES
#     ('Archer', 2009, 'Animation'),
#     ('Arrested Development', 2003, 'Comedy'),
#     ('Bobs Burgers', 2011, 'Animation'),
#     ('Bojack Horseman', 2014, 'Animation'),
#     ('Breaking Bad', 2008, 'Drama'),
#     ('Curb Your Enthusiasm', 2000, 'Comedy'),
#     ('Fargo', 2014, 'Drama'),
#     ('Freaks and Geeks', 1999, 'Comedy'),
#     ('General Hospital', 1963, 'Drama'),
#     ('Halt and Catch Fire', 2014, 'Drama'),
#     ('Malcolm In The Middle', 2000, 'Comedy'),
#     ('Pushing Daisies', 2007, 'Comedy'),
#     ('Seinfeld', 1989, 'Comedy'),
#     ('Stranger Things', 2016, 'Drama');
     
# INSERT INTO reviewers(first_name, last_name) VALUES
#     ('Thomas', 'Stoneman'),
#     ('Wyatt', 'Skaggs'),
#     ('Kimbra', 'Masters'),
#     ('Domingo', 'Cortes'),
#     ('Colt', 'Steele'),
#     ('Pinkie', 'Petit'),
#     ('Marlon', 'Crafford');
    
    # CREATE TABLE reviews(
    # id INT AUTO_INCREMENT PRIMARY KEY,
    # rating DECIMAL(2,1),
    # series_id INT,
    # reviewers_id INT,
    # FOREIGN KEY(series_id) REFERENCES series(id),
    # FOREIGN KEY(reviewers_id) REFERENCES reviewers(id)
    # );

    # INSERT INTO reviews(series_id, reviewers_id, rating) VALUES
    # (1, 1, 8.0), (1, 2, 7.5), (1, 3, 8.5), (1, 4, 7.7), (1, 5, 8.9),
    # (2, 1, 8.1), (1, 2, 7.5), (2, 3, 8.0), (2, 6, 8.4), (2, 5, 9.9),
    # (3, 1, 7.0), (3, 6, 7.5), (3, 4, 8.0), (3, 3, 7.1), (3, 5, 8.0),
    # (4, 1, 7.5), (4, 3, 7.8), (4, 4, 8.3), (4, 2, 7.6), (4, 5, 8.5),
    # (5, 1, 9.5), (5, 3, 9.0), (5, 4, 9.1), (5, 2, 9.3), (5, 5, 9.9),
    # (6, 2, 6.5), (6, 3, 7.8), (6, 4, 8.8), (6, 2, 8.4), (6, 5, 9.1),
    # (7, 2, 9.1), (7, 5, 9.7),
    # (8, 4, 8.5), (8, 2, 7.8), (8, 6, 8.8), (8, 5, 9.3),
    # (9, 2, 5.5), (9, 3, 6.8), (9, 4, 5.8), (9, 6, 4.3), (9, 5, 4.5),
    # (10, 5, 9.9),
    # (13, 3, 8.0), (13, 4, 7.2),
    # (14, 2, 8.5), (14, 3, 8.9), (14, 4, 8.9);
    
    # Challenge 1
    
    # SELECT title, rating
    # FROM series
    # JOIN reviews
    #     ON series.id = reviews.series_id
    # ORDER BY title;
    
# Challenge 2
    
# SELECT
#     title,
#     AVG(rating) AS avg_rating
# FROM series
# JOIN reviews
#     ON series.id = reviews.series_id
# GROUP BY series.id
# ORDER BY avg_rating;

# Challenge 3

# SELECT
#     first_name,
#     last_name,
#     rating
# FROM reviewers
# INNER JOIN reviews
#     ON reviewers.id = reviews.reviewers_id;
    
# Challenge 4

# SELECT title AS unreviewed_series
# FROM series
# LEFT JOIN reviews
#     ON series.id = reviews.series_id
# WHERE rating IS NULL;

# Challenge 5

# SELECT genre,
#     ROUND(AVG(rating), 2) AS avg_rating
# FROM series
# INNER JOIN reviews
#     ON series.id = reviews.series_id
# GROUP BY genre;

# Challenge 6

# SELECT
#     first_name,
#     last_name,
#     COUNT(rating) AS COUNT, 
#     IFNULL(MIN(rating), 0) AS MIN,
#     IFNULL(MAX(rating), 0) AS MAX,
#     ROUND(IFNULL(AVG(rating), 0), 2) AS AVG,
#     IF(COUNT(rating) > 0, 'ACTIVE', 'INACTIVE') AS STATUS
#    FROM reviewers
# LEFT JOIN reviews
#     ON reviewers.id = reviews.reviewers_id
# GROUP BY reviewers.id;
    
# Example with a CASE statement handling more than 2 conditions of STATUS

# SELECT first_name,
#         last_name,
#         COUNT(rating) AS COUNT,
#         IFNULL(MIN(rating),0) AS MIN,
#         IFNULL(MAX(rating),0) AS MAX,
#         ROUND(IFNULL(AVG(rating),0),2) AS AVG,
#         CASE
#             WHEN COUNT(rating) >= 10 THEN 'POWER USER'
#             WHEN COUNT(rating) > 0 THEN 'ACTIVE'
#             ELSE 'INACTIVE'
#         END AS STATUS 
# FROM reviewers
#     LEFT JOIN reviews
#             ON reviewers.id = reviews.reviewers_id
# GROUP BY reviewers.id;

# Challenge 7

SELECT title,
        rating,
        CONCAT(first_name, ' ', last_name) AS reviewer
FROM reviewers
INNER JOIN reviews
    ON reviewers.id = reviews.reviewers_id
INNER JOIN series
    ON series.id = reviews.series_id
ORDER BY title;



