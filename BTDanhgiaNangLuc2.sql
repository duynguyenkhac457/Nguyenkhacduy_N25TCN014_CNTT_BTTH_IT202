CREATE DATABASE LibraryManagement;

USE LibraryManagement;

CREATE TABLE book(
book_id INT AUTO_INCREMENT PRIMARY KEY,
title VARCHAR (255) NOT NULL,
author VARCHAR (255) NOT NULL,
publish_year INT ,
quantity INT DEFAULT 0 CHECK (quantity >= 0)

);

CREATE TABLE Reader(
reader_id INT AUTO_INCREMENT PRIMARY KEY,
fullname VARCHAR (255)NOT NULL,
email VARCHAR (255) UNIQUE,
phone VARCHAR (20),
birthday DATE

);


CREATE TABLE Borrow_Card(
borrow_id INT AUTO_INCREMENT PRIMARY KEY,
borrow_date DATE NOT NULL,
due_date DATE NOT NULL,
reader_id INT NOT NULL,
FOREIGN KEY (reader_id) REFERENCES Reader(reader_id)

);


CREATE TABLE  Borrow_Detail(
borrow_id INT,
book_id INT,
book_status ENUM('Mới', 'Cũ') NOT NULL,
fee DECIMAL(10,2) DEFAULT 0,
PRIMARY KEY (borrow_id, book_id),
FOREIGN KEY (borrow_id) REFERENCES Borrow_Card(borrow_id),
FOREIGN KEY (book_id) REFERENCES Book(book_id)

);


ALTER TABLE Reader
ADD address VARCHAR (255);

ALTER TABLE book
CHANGE publish_year nam_phat_hanh INT;

INSERT INTO Book (book_id, title, author, nam_phat_hanh, quantity) VALUES
(1, 'Mắt Biếc', 'Nguyễn Nhật Ánh', 1990, 10),
(2, 'Cho Tôi Xin Một Vé Đi Tuổi Thơ', 'Nguyễn Nhật Ánh', 2008, 7),
(3, 'Harry Potter 1', 'J.K. Rowling', 1997, 12),
(4, 'Dế Mèn Phiêu Lưu Ký', 'Tô Hoài', 1941, 5),
(5, 'Tuổi Thơ Dữ Dội', 'Phùng Quán', 1988, 6);

INSERT INTO Reader (reader_id, fullname, email, phone, birthday, address) VALUES
(1, 'Nguyễn Văn A', 'a@gmail.com', '0901111111', '2000-01-01', 'Hà Nội'),
(2, 'Trần Thị B', NULL, '0902222222', '1999-02-02', 'Hải Phòng'),
(3, 'Lê Văn C', 'c@gmail.com', '0903333333', '2001-03-03', 'Đà Nẵng'),
(4, 'Phạm Thị D', NULL, '0904444444', '2002-04-04', 'TP HCM'),
(5, 'Hoàng Văn E', 'e@gmail.com', '0905555555', '1998-05-05', 'Cần Thơ');


INSERT INTO Borrow_Card (borrow_id, borrow_date, due_date, reader_id) VALUES
(1, '2024-01-01', '2024-01-10', 1),
(2, '2024-01-02', '2024-01-12', 2),
(3, '2024-01-03', '2024-01-13', 3),
(4, '2024-01-04', '2024-01-14', 4),
(5, '2024-01-05', '2024-01-15', 5);

INSERT INTO Borrow_Detail (borrow_id, book_id, book_status, fee) VALUES
(1, 1, 'Mới', 10000),
(1, 2, 'Cũ', 8000),
(2, 3, 'Mới', 12000),
(3, 4, 'Cũ', 5000),
(4, 5, 'Mới', 9000);

UPDATE book
SET quantity = quantity + 5
WHERE author = 'Nguyễn Nhật Ánh';

DELETE FROM Borrow_Detail
WHERE borrow_id IN (
    SELECT borrow_id
    FROM Borrow_Card
    WHERE reader_id IN (
        SELECT reader_id
        FROM Reader
        WHERE email IS NULL
    )
);

DELETE FROM Borrow_Card
WHERE reader_id IN (
    SELECT reader_id
    FROM Reader
    WHERE email IS NULL
);

DELETE FROM Reader
WHERE email IS NULL;

SELECT *
FROM book
WHERE nam_phat_hanh BETWEEN 2015 AND 2023;

SELECT r.fullname, bc.borrow_id
FROM Reader r
JOIN Borrow_Card bc ON r.reader_id = bc.reader_id
WHERE MONTH(bc.borrow_date) = 4
AND YEAR(bc.borrow_date) = 2026;

SELECT b.title
FROM Book b
JOIN Borrow_Detail bd ON b.book_id = bd.book_id
WHERE bd.borrow_id = 'PM001';

DROP TABLE Borrow_Detail;
DROP TABLE Borrow_Card;
