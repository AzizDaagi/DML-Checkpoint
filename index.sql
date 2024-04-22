CREATE TABLE Product
(
    Product_Id VARCHAR2(20) PRIMARY KEY,
    Product_Name VARCHAR2(20) NOT NULL,
    Price NUMBER CHECK (Price > 0)
);
CREATE TABLE Customer
(
    Customer_Id VARCHAR2(20) PRIMARY KEY,
    Customer_Name VARCHAR2(20) NOT NULL,
    Customer_Tel NUMBER
);
CREATE TABLE Orders
(
    Customer_Id VARCHAR2(20) FOREIGN KEY REFERENCES Customer(Customer_Id),
    Product_Id VARCHAR2(20) FOREIGN KEY REFERENCES Product(Product_Id),
    Quantity NUMBER,
    Total_amount NUMBER
);
ALTER TABLE Product
ADD Category VARCHAR2(20);

ALTER TABLE Orders
ADD OrderDate DATE DEFAULT SYSDATE;

INSERT INTO Product
    ( Product_Id, Product_Name, Category, Price )
VALUES
    ("P01", "Samsung Galaxy S20", "Smartphone", 3299),
    ("P02", "ASUS Notebook", "PC", 4599);

INSERT INTO Customer
    (Customer_Id, Customer_Name, Customer_Tel)
VALUES
    ("C01", "ALI", 71321009),
    ("C02", "ASMA", 77345823);

INSERT INTO Orders
    (Customer_Id, Product_Id, OrderDate, Quantity, Total_amount)
VALUES
    ("C01", "P02", NULL, 2, 9198),
    ("C02", "P01", "2020-05-28", 1, 3299);
