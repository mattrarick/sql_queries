#  CREATE TABLE students(
#     name VARCHAR(100),
#     gender CHAR(1));
    
# INSERT INTO students(name, gender)
#     VALUES('Jane Doe', 'Female'), ('Billy Thomas', 'Male'), ('Pierre Falconne', 'Male'), ('Betty Billings', 'F');

# CREATE TABLE inventory(
#     item_name VARCHAR(100) NOT NULL,
#     price DECIMAL(9,2) NOT NULL,
#     quantity INT(10)
# );

# SELECT NOW();

# SELECT CURDATE();

# SELECT DAYOFWEEK('2021-07-02');

# SELECT DAYNAME('2021-07-02');

# SELECT DATE_FORMAT('2021-07-02 10:40:00', '%m/%d/%Y at %h:%m:%s');

# SELECT DATE_FORMAT('2021-01-02 15:15', '%M %D at %h:%i');

# SELECT DATE_FORMAT('2021-04-01 10:18', '%M %D at %h:%i');

# SELECT DATE_FORMAT(NOW(), '%M %D at %h:%i');

# CREATE TABLE tweets(
#     Tweet_content    VARCHAR(280),
#     Username         VARCHAR(15),
#     created_at       TIMESTAMP    DEFAULT NOW()
# );

# SELECT DAYNAME(NOW());