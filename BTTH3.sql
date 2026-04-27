CREATE DATABASE book_worm;
USE book_worm;

CREATE TABLE authors (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    birth_year INT,
    nationality VARCHAR(50)
);

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    book_name VARCHAR(255),
    category VARCHAR(50),
    author_id INT,
    price INT NOT NULL DEFAULT 0 CHECK (price >= 0),
    publish_year INT,
    FOREIGN KEY (author_id) REFERENCES authors(id)
);

CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20) UNIQUE,
    registration_date DATE DEFAULT (CURRENT_DATE)
);

INSERT INTO authors (full_name, birth_year, nationality) VALUES
('Nguyen Nhat Anh', 1955, 'Vietnam'),
('J.K. Rowling', 1965, 'UK'),
('Dale Carnegie', 1888, 'USA');

INSERT INTO books (book_name, category, author_id, price, publish_year) VALUES
('Mat Biec', 'Van hoc', 1, 150000, 1990),
('Kinh Van Hoa', 'Van hoc', 1, 120000, 1995),
('Harry Potter 1', 'Ky ao', 2, 250000, 1997),
('Harry Potter 2', 'Ky ao', 2, 260000, 1998),
('Dac Nhan Tam', 'Ky nang', 3, 100000, 1936),
('Quang Ganh Lo Di', 'Ky nang', 3, 110000, 1948),
('Toi Thay Hoa Vang Tren Co Xanh', 'Van hoc', 1, 140000, 2010),
('Harry Potter 3', 'Ky ao', 2, 270000, 1999);

INSERT INTO customers (full_name, email, phone) VALUES
('Nguyen Van A', 'acsc123@gmail.com', '0901234567'),
('Tran Thi B', 'blabla99@gmail.com', '0912345678'),
('Le Van C', 'heheboi@gmail.com', '0923456789'),
('Pham Thi D', 'randomacc@gmail.com', '0934567890'),
('Hoang Van E', 'mailrac123@gmail.com', '0945678901');

-- Them khach hang moi voi email bi trung
-- Giai thich: Lenh nay se bi tu choi va bao loi (Error Code: 1062. Duplicate entry) 
-- vi cot 'email' trong bang 'customers' da duoc thiet lap rang buoc UNIQUE.
INSERT INTO customers (full_name, email, phone) VALUES
('Khach Hang F', 'acsc123@gmail.com', '0988888888');
SELECT *
FROM Books
WHERE Category = 'Trinh thám' AND Price < 100000;

SELECT *
FROM Customers
WHERE Email LIKE '%@gmail.com';

SELECT *
FROM Books
ORDER BY Price DESC
LIMIT 3;

UPDATE Books
SET Price = Price * 0.9
WHERE PublishYear < 2020;