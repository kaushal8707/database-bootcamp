
    create database where_bookstore;
    use where_bookstore;

    CREATE TABLE books (
        book_id INT PRIMARY KEY,
        title VARCHAR(100),
        author VARCHAR(50),
        price DECIMAL(10,2),
        publication_date DATE,
        category VARCHAR(30),
        in_stock INT
    );

    INSERT INTO books VALUES
        (1, 'The MySQL Guide', 'John Smith', 29.99, '2023-01-15', 'Technology', 50),
        (2, 'Data Science Basics', 'Sarah Johnson', 34.99, '2023-03-20', 'Technology', 30),
        (3, 'Mystery at Midnight', 'Michael Brown', 19.99, '2023-02-10', 'Mystery', 100),
        (4, 'Cooking Essentials', 'Lisa Anderson', 24.99, '2023-04-05', 'Cooking', 75);

    select * from books;

![img.png](img.png)

=> where clause uses for Filtering...

# we want Technology's category book

    select * from books where category = 'Technology';
![img_1.png](img_1.png)

# we can do numeric comparison as well

    select title, price from books where price < 30.00
![img_2.png](img_2.png)

# publication dates should be after 1st march 2023 (Benefit to use Date datatype is we can apply comparison operator on it)
    
    select title, publication_date from books where publication_date >= '2023-03-01'
![img_3.png](img_3.png)


    
Logical Operator
----------------

# Logical Operator (both conditions should apply)

    select * from books where category = 'Technology' and price < 30.00;
![img_4.png](img_4.png)

# ( either one conditions should apply)
    select * from books where category = 'Technology' or price < 30.00;
![img_5.png](img_5.png)


# IN / NOT IN / NOT
    select * from books where category in('Technology', 'Mystery') and price < 30;
![img_6.png](img_6.png)

    select * from books where (category ='Technology' or category = 'Mystery') and price < 30;
![img_7.png](img_7.png)

    select * from books where not category = 'Technology';
![img_8.png](img_8.png)
    
    select * from books where category not in('Technology', 'Mystery') and price < 30;
![img_9.png](img_9.png)


# Finding NULL values
    INSERT INTO books VALUES (5, 'Cook Book', null, 24.99, '2023-04-05', 'Cooking', 75);
    select * from books where author is null;
![img_10.png](img_10.png)

    select * from books where author is not null;
![img_11.png](img_11.png)


# Pattern Matching - searching in Text data
# find books where title having sql word
    select * from books where title LIKE '%SqL%';
![img_12.png](img_12.png)

# find books where title starts with The
    select * from books where title LIKE 'The%';
![img_13.png](img_13.png)

# case-sensitive search ( here we are in forcing to compare characters binary value )
    select * from books where title LIKE binary '%SqL%';
![img_14.png](img_14.png)


# find books where author having word ohn and that word only 4 character and first character is not known
    INSERT INTO books VALUES (6, 'Mini Cook Book', 'Gohn Smith', 24.99, '2023-04-05', 'Cooking', 75);
    select * from books where author LIKE '_ohn%';
![img_15.png](img_15.png)


# BETWEEN 
# find books whose price is between 20 and 30
    select * from books where price between 20 and 30;
![img_16.png](img_16.png)

# IN (find books from list of given category)
# find all books which comes under category Technology, Mystery and Science.
    select * from books where category in('Technology','Science','Mystery');
![img_17.png](img_17.png)

# we need that books only whose price is between 20 to 40 and published after 1st march 2023
    select * from books where price between 20 and 30 and publication_date >= '2023-03-01'
![img_18.png](img_18.png)

# Sub queries
# we want those books which price is greater than average price
    select * from books where price > (select avg(price) from books);
    select avg(price) from books;
![img_19.png](img_19.png)

# Sub queries - IN
# select those books which comes under those category whose stock is more than 35
    select * from books where category IN (select category from books where in_stock > 35);
![img_20.png](img_20.png)



Questions
==============

1. Find All Books Published in 2023 that cost less than the average book price.

        SELECT title, price, publication_date
        FROM books
        WHERE YEAR(publication_date) = 2023
        AND price < (SELECT avg(price) FROM books);

    ![img_21.png](img_21.png)

2. Find all technology books with "data" in the title that have more than 50 copies in stock.


        SELECT title, category, in_stock
        FROM books
        WHERE category = 'Technology'
        AND title like '%data%'
        AND in_stock > 50;

   ![img_22.png](img_22.png)


3. Find books that are either in the Technology Category with price > $30 or with the Mystery category with price < $20.

       select title, category, price
       FROM books
       WHERE (category = 'Technology' and price > 30)
       OR (category = 'Mystery' and price < 20);

   ![img_23.png](img_23.png)

4. List all books where the author's name contains either 'son' or 'th' and were published after March 2023.


       select title, author, publication_date
       FROM books
       WHERE publication_date > '2023-03-31'
       AND author in (SELECT author FROM books WHERE author like '%son%' or author like '%th%');
    
        # OR
    
        SELECT title, author, publication_date
        FROM books
        WHERE (author LIKE '%son%' OR author LIKE '%th%')
        AND publication_date > '2023-03-31';

   ![img_24.png](img_24.png)



