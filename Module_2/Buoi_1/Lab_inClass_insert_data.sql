INSERT INTO Customers (first_name, last_name, email_address, number_of_complains)
VALUES 
('John', 'McKinley', 'john.mackinley@365careers.com', 0),
('Elizabeth', 'McFarlane', 'e.mcfarlane@365careers.com', 2),
('Kevin', 'Lawrence', 'kevin.lawrence@365careers.com', 1),
('Catherine', 'Winnfield', 'c.winnfield@365careers.com', 0);

INSERT INTO `SALES` (date_of_purchase, customer_id, item_code)
VALUES
('2016-09-03', 1, 'A_1'),
('2016-12-02', 2, 'C_1'),
('2017-04-15', 3, 'D_1'),
('2017-05-24', 1, 'B_2'),
('2017-05-25', 4, 'B_2'),
('2017-06-06', 2, 'B_1'),
('2017-06-10', 4, 'A_2'),
('2017-06-13', 3, 'C_1'),
('2017-07-20', 1, 'A_1'),
('2017-08-11', 2, 'B_1');

INSERT INTO `Items` (item_code, item, unit_price_usd, company_id, company, headquaters_phone_number)
VALUES
('A_1', 'Lamp', 20, 1, 'Company A', '+1(202)555-0196'),
('A_2', 'Desk', 250, 1, 'Company A', '+1(202)555-0196'),
('B_1', 'Lamp', 30, 2, 'Company B', '+1(202)555-0152'),
('B_2', 'Desk', 350, 2, 'Company B', '+1(202)555-0152'),
('C_1', 'Chair', 150, 3, 'Company C', '+1(229)853-9913'),
('D_1', 'Loudspeakers', 400, 4, 'Company D', '+1(618)369-7392');
    