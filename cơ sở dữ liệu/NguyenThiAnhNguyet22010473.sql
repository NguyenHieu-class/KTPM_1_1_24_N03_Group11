/*Thi giữa kì - Môn cơ sở dữ liệu */
/*Họ và tên: Nguyễn Thị Ánh Nguyệt- 22010473*/

use classicmodels;
/*Bài1*/
SELECT orderNumber
FROM orders
WHERE (MONTH(requireddate) = 4 AND YEAR(requireddate) = 2005)
   OR (MONTH(requireddate) = 1 AND YEAR(requireddate) = 2005);
   
/*Bài 2*/
SELECT customerNumber, COUNT(orderNumber) AS order_count
FROM orders
GROUP BY customerNumber
ORDER BY order_count DESC
LIMIT 1;

/*Bài3*/
SELECT * 
FROM products 
WHERE quantityInStock BETWEEN 1000 AND 2000;

SELECT productCode
FROM Products
WHERE quantityInStock > 2000 AND productLine = 'Classic Cars';


/*Bài4*/
SELECT customerName 
FROM customers 
WHERE customerName LIKE 'B%';


SELECT country, COUNT(customerNumber) AS customer_count 
FROM customers 
GROUP BY country;


SELECT country, SUM(creditLimit) AS total_creditLimit 
FROM customers 
GROUP BY country 
ORDER BY total_creditLimit DESC 
LIMIT 1;


/*Bài5*/
SELECT customerNumber, SUM(amount) as total_amount
FROM Payments
GROUP BY customerNumber;

SELECT customerNumber
FROM Payments
GROUP BY customerNumber
HAVING SUM(amount) < 90000 AND COUNT(paymentDate) > 2;


/*Bài6*/
SELECT SUM(amount) as total_amount
FROM Payments
WHERE MONTH(paymentDate) = 11 AND YEAR(paymentDate) = 2004;


SELECT customerNumber, SUM(amount) AS total_amount
FROM payments
WHERE MONTH(paymentDate) = 11 AND YEAR(paymentDate) = 2004
GROUP BY customerNumber
ORDER BY total_amount DESC
LIMIT 1;


/*Bài7*/
SELECT MONTH(requireddate) as month, COUNT(orderNumber) as order_count
FROM orders
WHERE YEAR(requireddate) = 2003
GROUP BY MONTH(requireddate);

SELECT customerNumber, COUNT(orderNumber) AS order_count
FROM orders
WHERE YEAR(requireddate) = 2003
GROUP BY customerNumber
ORDER BY order_count DESC
LIMIT 1;

/*Bài8*/
SELECT c.customerName, p.productName
FROM orders o
JOIN orderdetails od ON o.orderNumber = od.orderNumber
JOIN products p ON od.productCode = p.productCode
JOIN customers c ON o.customerNumber = c.customerNumber
WHERE MONTH(o.requireddate) = 5 AND YEAR(o.requireddate) = 2003;

/*Bài9*/
SELECT productCode
FROM orderdetails
WHERE orderNumber IN (
    SELECT orderNumber
    FROM orders
    WHERE MONTH(requireddate) = 3 
      AND YEAR(requireddate) = 2005 
      AND status = 'Shipped'
);


/*Bài 10*/
drop DATABASE QuanLyDiem_N03TH2;
CREATE DATABASE QuanLyDiem_N03TH2;
USE QuanLyDiem_N03TH2;

CREATE TABLE SinhVien (
    maSV CHAR(10) PRIMARY KEY,
    hoten VARCHAR(50),
    gioitinh VARCHAR(10),
    ngaysinh DATE,
    diachi VARCHAR(100),
    malop CHAR(10),
    maKhoa CHAR(10)
);


CREATE TABLE Khoa (
    MaKhoa CHAR(10) PRIMARY KEY,
    TenKhoa VARCHAR(50),
    MaGV_TruongKhoa CHAR(10),
    TruongKhoa VARCHAR(50)
);


CREATE TABLE GiaoVien (
    maGV CHAR(10) PRIMARY KEY,
    hoten VARCHAR(50),
    ngaysinh DATE,
    gioitinh VARCHAR(10),
    diachi VARCHAR(100),
    MaKhoa CHAR(10),
    FOREIGN KEY (MaKhoa) REFERENCES Khoa(MaKhoa)
);

INSERT INTO SinhVien (maSV, hoten, gioitinh, ngaysinh, diachi, malop, maKhoa) 
VALUES ('SV001', 'Nguyen Van A', 'Nam', '2001-01-02', 'Hà Nội', 'CSDL', 'CNTT');

INSERT INTO Khoa (MaKhoa, TenKhoa, MaGV) 
VALUES ('CNTT', 'Công nghệ thông tin', 'PU001');

INSERT INTO GiaoVien (maGV, hoten, ngaysinh, gioitinh, diachi, MaKhoa) 
VALUES ('PU010', 'Nguyễn Công Phượng', '1996-10-20', 'Nam', 'Nghệ An', 'CNTT');








   
   

