-- Practical Assignment 01 "Complex select"
DROP DATABASE IF EXISTS P;

CREATE DATABASE P;

USE P;

-- Creating tables



CREATE TABLE Borrowers (
    borrower_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255),
    phone_number VARCHAR(20),
    membership_date DATE
);



CREATE TABLE Authors (
    author_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    birth_year INT,
    nationality VARCHAR(100)
);

CREATE TABLE Publishers (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(255),
    established_year INT,
    country VARCHAR(50)
);

CREATE TABLE Books (
    book_id INT PRIMARY KEY,
    title VARCHAR(255),
    author_id INT,
    publisher_id INT,
    publish_year INT,
    category VARCHAR(50),
    available_copies INT,
    FOREIGN KEY (author_id) REFERENCES Authors(author_id),
    FOREIGN KEY (publisher_id) REFERENCES Publishers(publisher_id)
);

CREATE TABLE Loans (
    loan_id INT PRIMARY KEY,
    book_id INT,
    borrower_id INT,
    loan_date DATE,
    return_date DATE,
    status VARCHAR(50),
    FOREIGN KEY (book_id) REFERENCES Books(book_id),
    FOREIGN KEY (borrower_id) REFERENCES Borrowers(borrower_id)
);


INSERT INTO Authors (author_id, first_name, last_name, birth_year, nationality) VALUES
(1, 'F. Scott', 'Fitzgerald', 1896, 'American'),
(2, 'Harper', 'Lee', 1926, 'American'),
(3, 'Dan', 'Brown', 1964, 'American'),
(4, 'Stephen', 'Hawking', 1942, 'British'),
(5, 'Cormac', 'McCarthy', 1933, 'American');

INSERT INTO Publishers (publisher_id, publisher_name, established_year, country) VALUES
(1, 'Scribner', 1846, 'United States'),
(2, 'J.B. Lippincott & Co.', 1836, 'United States'),
(3, 'Doubleday', 1897, 'United States'),
(4, 'Bantam Books', 1945, 'United States'),
(5, 'Alfred A. Knopf', 1915, 'United States');

INSERT INTO Books (book_id, title, author_id, publisher_id, publish_year, category, available_copies) VALUES
(1, 'The Great Gatsby', 1, 1, 1925, 'Fiction', 3),
(2, 'To Kill a Mockingbird', 2, 2, 1960, 'Fiction', 5),
(3, 'The Da Vinci Code', 3, 3, 2003, 'Mystery', 4),
(4, 'A Brief History of Time', 4, 4, 1988, 'Science', 2),
(5, 'The Road', 5, 5, 2006, 'Post-apocalyptic', 6);


INSERT INTO Borrowers (borrower_id, first_name, last_name, email, phone_number, membership_date) VALUES
(1, 'John', 'Doe', 'john.doe@example.com', '555-1234', '2022-05-10'),
(2, 'Jane', 'Smith', 'jane.smith@example.com', '555-5678', '2021-11-20'),
(3, 'Alice', 'Johnson', 'alice.johnson@example.com', '555-9876', '2023-01-15'),
(4, 'Bob', 'Lee', 'bob.lee@example.com', '555-4321', '2020-07-12'),
(5, 'Eve', 'Parker', 'eve.parker@example.com', '555-1111', '2023-04-02');


INSERT INTO Loans (loan_id, book_id, borrower_id, loan_date, return_date, status) VALUES
(1, 1, 1, '2024-01-10', '2024-01-20', 'Returned'),
(2, 2, 1, '2024-02-05', NULL, 'Borrowed'),
(3, 3, 2, '2024-03-15', '2024-03-25', 'Returned'),
(4, 4, 3, '2024-03-22', '2024-04-01', 'Returned'),
(5, 5, 4, '2024-04-02', NULL, 'Borrowed');






