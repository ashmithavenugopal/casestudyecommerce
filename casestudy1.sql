create database Ecommerceapplication
------creating tables 
-----customers
CREATE TABLE customers (
    customer_id int not null PRIMARY KEY,
    customer_name VARCHAR(25),
    customer_email VARCHAR(25),
    customer_password VARCHAR(25)
);

-------products table
CREATE TABLE products (
    product_id INT not null PRIMARY KEY ,
    prod_name VARCHAR(25),
    prod_price INT,
    prod_description VARCHAR(100),
    stock_Quantity INT
);

-------cart table
CREATE TABLE cart (
    cart_id INT not null PRIMARY KEY ,
    customer_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
-- Create orders table
CREATE TABLE orders (
    order_id INT not null PRIMARY KEY ,
    customer_id INT,
    order_date DATETIME,
    total_price DECIMAL(10, 2),
    shipping_address VARCHAR(250),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

-- Create order_items table
CREATE TABLE order_items (
    order_item_id INT NOT NULL PRIMARY KEY ,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

insert into customers(customer_id,customer_name,customer_email,customer_password)
values 
(1,'Akshay','akshay@gmail.com','passwordakshay'),
(2,'Deekshita','deekshu@gmail.com','passworddeekshu'),
(3,'Eesha','eesha@gmail.com','passwordeesha'),
(4,'Vamika','vamika@gmail.com','passwordvamika'),
(5,'Meer','meer@gmail.com','passwordmeer');

insert into products(product_id,prod_name,prod_price,prod_description,stock_Quantity) values 
(101,'Samsung S24 Ultra',199000,'Latest smartphone mobile',5),
(102,'Vaccum Cleaner',45000,'Makes your cleaning easy',8),
(103,'Women kurti set',2499,'Bright colours to make your day bright',3),
(104,'Baby Walker',4500,'First steps are precious',8),
(105,'wireless mouse',699,'Connect from everywhere',12);

insert into cart(cart_id,customer_id,product_id,quantity) values 
(1001,1,101,1),
(1002,2,105,3),
(1003,3,104,4),
(1004,4,102,2),
(1005,5,103,1);

insert into orders(order_id,customer_id,order_date,total_price,shipping_address) values
(2001,1, '2024-03-08 08:30:00', 1500.99, '1 Main Street, Chennai'),
(2002,2, '2024-03-09 09:45:00', 799.50, '4 Oak Avenue, Gangtok'),
(2003,3, '2024-03-10 10:15:00', 1249.75, '7 Pine Road, Vishakapatnam'),
(2004,4, '2024-03-11 11:00:00', 750.25, '17 E Lane, Bhopal'),
(2005,5, '2024-03-12 12:30:00', 1990.99, '56 Birla Street, Coimbatore');

insert into order_items(order_item_id,order_id,product_id,quantity) values
(7801,2001,101,5),
(7891,2002,102,3),
(7892,2003,103,4),
(7893,2004,104,2),
(7894,2005,105,1);


