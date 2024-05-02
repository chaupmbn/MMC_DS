CREATE TABLE Customers(
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name CHAR(15),
    last_name CHAR(15),
    email_address VARCHAR(50),
    number_of_complains INT
);

CREATE TABLE SALES(
    purchase_number INT PRIMARY KEY AUTO_INCREMENT,
    date_of_purchase DATE,
    customer_id INT,
    item_code VARCHAR(5)
);

CREATE TABLE Items(
    item_code VARCHAR(5) PRIMARY KEY,
    item CHAR(15),
    unit_price_usd INT,
    company_id INT,
    company CHAR(15),
    headquaters_phone_number VARCHAR(20)
);