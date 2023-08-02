CREATE TABLE transaction (
    id INT PRIMARY KEY,
    date TIMESTAMP,
    amount INT,
    card VARCHAR(20) REFERENCES credit_card(card),
    id_merchant INT REFERENCES merchant(id)
);

CREATE TABLE merchant_category (
    id INT PRIMARY KEY REFERENCES merchant(id_merchant_category),
    name VARCHAR(200)
);

CREATE TABLE merchant (
    id INT PRIMARY KEY,
    name VARCHAR(200),
    id_merchant_category INT REFERENCES merchant_category(id)
);

CREATE TABLE credit_card (
    card VARCHAR(20) PRIMARY KEY,
    cardholder_id INT REFERENCES card_holder(id)
);

CREATE TABLE card_holder (
    id INT PRIMARY KEY,
    name VARCHAR(200)
);
