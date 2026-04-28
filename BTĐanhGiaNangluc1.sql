DROP DATABASE IF EXISTS SalesManagement;

CREATE DATABASE SalesManagement;
USE SalesManagement;


CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    manufacturer VARCHAR(100),
    price INT,
    quantity INT
);

CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(200)
);

CREATE TABLE `Order` (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

CREATE TABLE Order_Detail (
    order_id INT,
    product_id INT,
    quantity INT,
    price INT,
    PRIMARY KEY (order_id, product_id),
    FOREIGN KEY (order_id) REFERENCES `Order`(order_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);


ALTER TABLE `Order`
ADD note VARCHAR(255);

ALTER TABLE Product
CHANGE manufacturer nha_san_xuat VARCHAR(100);


INSERT INTO Product VALUES
(1,'MacBook Air M2','Apple',18000000,10),
(2,'MacBook Pro M1','Apple',25000000,5),
(3,'Chuột Logitech','Logitech',500000,50),
(4,'Bàn phím cơ','Razer',3000000,20),
(5,'Màn hình Dell','Dell',7000000,15);


INSERT INTO Customer VALUES
(1,'Nguyễn Văn A','a@gmail.com','0901111111','Hà Nội'),
(2,'Trần Thị B','b@gmail.com',NULL,'HCM'),
(3,'Lê Văn C','c@gmail.com','0903333333','Đà Nẵng'),
(4,'Phạm Thị D','d@gmail.com','0904444444','Hải Phòng'),
(5,'Hoàng Văn E','e@gmail.com',NULL,'Cần Thơ');

INSERT INTO `Order` (order_id, order_date, customer_id) VALUES
(1,'2024-01-10',1),
(2,'2024-01-12',3),
(3,'2024-01-15',4),
(4,'2024-01-18',1),
(5,'2024-01-20',3);

INSERT INTO Order_Detail VALUES
(1,1,1,18000000),
(1,3,1,500000),
(2,3,1,500000),
(3,4,1,3000000),
(4,1,1,18000000);


UPDATE Product
SET price = price * 1.1
WHERE nha_san_xuat = 'Apple';


DELETE FROM Customer
WHERE phone IS NULL;

SELECT *
FROM Product
WHERE price BETWEEN 10000000 AND 20000000;

