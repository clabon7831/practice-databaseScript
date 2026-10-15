CREATE DATABASE IF NOT EXISTS comic_shop;
USE comic_shop;

DROP TABLE IF EXISTS inventory;
DROP TABLE IF EXISTS comics;
DROP TABLE IF EXISTS publishers;

CREATE TABLE publishers (
    publisher_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE comics (
    comic_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(100) NOT NULL,
    issue_number INT NOT NULL,
    publisher_id INT NOT NULL,
    FOREIGN KEY (publisher_id)
        REFERENCES publishers(publisher_id)
);

CREATE TABLE inventory (
    inventory_id INT PRIMARY KEY AUTO_INCREMENT,
    comic_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(6,2) NOT NULL,
    FOREIGN KEY (comic_id)
        REFERENCES comics(comic_id)
);

-- Add sample data in a transaction
START TRANSACTION;

INSERT INTO publishers (name)
VALUES
    ('Marvel'),
    ('DC');

INSERT INTO comics (title, issue_number, publisher_id)
VALUES
    ('X-Men', 1, 1),
    ('Batman', 1, 2);

INSERT INTO inventory (comic_id, quantity, price)
VALUES
    (1, 10, 4.99),
    (2, 5, 3.99);

COMMIT;

-- Check the data
SELECT * FROM publishers;
SELECT * FROM comics;
SELECT * FROM inventory;
