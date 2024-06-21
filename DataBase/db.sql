DROP schema if exists arduinotsw;
CREATE schema arduinotsw;
use arduinotsw;

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    admin boolean not null,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE products (
    id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    category varchar(450) NOT NULL,
    price double NOT NULL,
    image varchar(450) NOT NULL
);

CREATE TABLE orders (
    o_id INT PRIMARY KEY AUTO_INCREMENT,
    p_name VARCHAR(450),
    u_id INT,
    o_quantity INT NOT NULL,
    o_date varchar(450) NOT NULL,
    price_at_purchase DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (u_id) REFERENCES Users(id)
);

INSERT INTO `users` VALUES (1,'admin','admin@mail.it',1,'asdqwe123');
INSERT INTO `users` VALUES (2,'utente','utente@mail.it',0,'asdqwe123');
