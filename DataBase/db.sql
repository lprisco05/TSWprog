DROP schema if exists arduinotsw;
CREATE schema arduinotsw;
use arduinotsw;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    admin BOOLEAN NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE products (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(450) NOT NULL,
    price DOUBLE NOT NULL,
    image VARCHAR(450) NOT NULL
);

CREATE TABLE orders (
    o_id INT PRIMARY KEY AUTO_INCREMENT,
    p_name VARCHAR(450),
    u_id INT,
    o_quantity INT NOT NULL,
    o_date VARCHAR(450) NOT NULL,
    price_at_purchase DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (u_id) REFERENCES users(id)
);

INSERT INTO `users` VALUES 
(1,'admin','admin@mail.it',1,'asdqwe123'),
(2,'utente','utente@mail.it',0,'asdqwe123'),
(3,'John Doe','john.doe@mail.it',0,'password123'),
(4,'Jane Smith','jane.smith@mail.it',0,'password123'),
(5,'Alice Brown','alice.brown@mail.it',0,'password123'),
(6,'Bob Johnson','bob.johnson@mail.it',0,'password123'),
(7,'Charlie Davis','charlie.davis@mail.it',0,'password123');


INSERT INTO `products` VALUES (3,'Arduino Uno','Starter Kit', '100','Arduino.png');
INSERT INTO `products` VALUES (4,'Cavi','Cavi', '0.50','Cavi.png');
INSERT INTO `products` VALUES (5,'led','led', '0.10','led.png');
INSERT INTO `products` VALUES (6,'Pulsante','pulsante', '1','Pulsante.png');
INSERT INTO `products` VALUES (7,'Sensore','Sensore', '1','Sensore.png');
INSERT INTO `products` VALUES (8,'Servomotore','Servomotore', '2','Servo.png');

-- Populating the orders table with more orders
INSERT INTO `orders` (p_name, u_id, o_quantity, o_date, price_at_purchase) VALUES
('Arduino Uno', 2, 1, '2024-01-15', 100.00),
('Cavi', 2, 5, '2024-01-16', 0.50),
('LED', 2, 20, '2024-01-17', 0.10),
('Pulsante', 2, 10, '2024-01-18', 1.00),
('Sensore', 2, 2, '2024-01-19', 1.00),
('Servomotore', 2, 3, '2024-01-20', 2.00),
('Arduino Uno', 3, 2, '2024-01-21', 100.00),
('Cavi', 3, 10, '2024-01-22', 0.50),
('LED', 4, 30, '2024-01-23', 0.10),
('Pulsante', 4, 15, '2024-01-24', 1.00),
('Sensore', 5, 5, '2024-01-25', 1.00),
('Servomotore', 5, 4, '2024-01-26', 2.00),
('Arduino Uno', 6, 1, '2024-01-27', 100.00),
('Cavi', 6, 20, '2024-01-28', 0.50),
('LED', 7, 40, '2024-01-29', 0.10),
('Pulsante', 7, 25, '2024-01-30', 1.00),
('Sensore', 3, 3, '2024-01-31', 1.00),
('Servomotore', 4, 6, '2024-02-01', 2.00),
('Arduino Uno', 5, 3, '2024-02-02', 100.00),
('Cavi', 6, 15, '2024-02-03', 0.50),
('LED', 7, 50, '2024-02-04', 0.10),
('Pulsante', 3, 12, '2024-02-05', 1.00),
('Sensore', 4, 7, '2024-02-06', 1.00),
('Servomotore', 5, 8, '2024-02-07', 2.00),
('Arduino Uno', 6, 2, '2024-02-08', 100.00),
('Cavi', 6, 25, '2024-02-09', 0.50),
('LED', 7, 60, '2024-02-10', 0.10),
('Pulsante', 3, 20, '2024-02-11', 1.00),
('Sensore', 4, 4, '2024-02-12', 1.00),
('Servomotore', 5, 10, '2024-02-13', 2.00),
('Arduino Uno', 3, 1, '2024-02-14', 100.00),
('Cavi', 3, 5, '2024-02-15', 0.50),
('LED', 4, 20, '2024-02-16', 0.10),
('Pulsante', 4, 10, '2024-02-17', 1.00),
('Sensore', 5, 2, '2024-02-18', 1.00),
('Servomotore', 5, 3, '2024-02-19', 2.00),
('Arduino Uno', 6, 2, '2024-02-20', 100.00),
('Cavi', 6, 10, '2024-02-21', 0.50),
('LED', 7, 30, '2024-02-22', 0.10),
('Pulsante', 7, 15, '2024-02-23', 1.00),
('Sensore', 3, 5, '2024-02-24', 1.00),
('Servomotore', 4, 4, '2024-02-25', 2.00),
('Arduino Uno', 5, 1, '2024-02-26', 100.00),
('Cavi', 6, 20, '2024-02-27', 0.50),
('LED', 7, 40, '2024-02-28', 0.10),
('Pulsante', 3, 25, '2024-02-29', 1.00),
('Sensore', 4, 3, '2024-03-01', 1.00),
('Servomotore', 5, 6, '2024-03-02', 2.00);


