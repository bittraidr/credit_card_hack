CREATE VIEW under_two AS
SELECT ch.name AS cardholder_name, 
       t.date AS transaction_date, 
       t.amount AS transaction_amount, 
       m.name AS merchant_name
FROM transaction t
JOIN credit_card cc ON t.card = cc.card
JOIN card_holder ch ON cc.cardholder_id = ch.id
LEFT JOIN merchant m ON t.id_merchant = m.id
WHERE t.amount <= 2.00
ORDER BY ch.name, t.date;

CREATE VIEW under_two_count AS
SELECT ch.name AS cardholder_name,
       COUNT(*) AS transaction_count_less_than_2
FROM transaction t
JOIN credit_card cc ON t.card = cc.card
JOIN card_holder ch ON cc.cardholder_id = ch.id
LEFT JOIN merchant m ON t.id_merchant = m.id
WHERE t.amount <= 2.00
GROUP BY ch.name
ORDER BY ch.name;




SELECT amount
FROM transaction

CREATE VIEW under_two_seven_nine AS
SELECT ch.name AS cardholder_name,
       t.date AS transaction_date,
       t.amount AS transaction_amount,
       m.name AS merchant_name
FROM transaction t
JOIN credit_card cc ON t.card = cc.card
JOIN card_holder ch ON cc.cardholder_id = ch.id
LEFT JOIN merchant m ON t.id_merchant = m.id
WHERE t.amount <= 2.00
  AND EXTRACT(HOUR FROM t.date) BETWEEN 7 AND 9
ORDER BY t.amount DESC
LIMIT 100;

CREATE VIEW under_two_all_other AS
SELECT ch.name AS cardholder_name,
       t.date AS transaction_date,
       t.amount AS transaction_amount,
       m.name AS merchant_name
FROM transaction t
JOIN credit_card cc ON t.card = cc.card
JOIN card_holder ch ON cc.cardholder_id = ch.id
LEFT JOIN merchant m ON t.id_merchant = m.id
WHERE t.amount <= 2.00
  AND (EXTRACT(HOUR FROM t.date) < 7 OR EXTRACT(HOUR FROM t.date) > 9)
ORDER BY t.amount DESC
LIMIT 1000;

CREATE VIEW under_two_top_5_hacked AS
SELECT m.name AS merchant_name,
       COUNT(*) AS transaction_count_under_2
FROM transaction t
JOIN credit_card cc ON t.card = cc.card
JOIN card_holder ch ON cc.cardholder_id = ch.id
LEFT JOIN merchant m ON t.id_merchant = m.id
WHERE t.amount <= 2.00
GROUP BY m.name
ORDER BY transaction_count_under_2 DESC;
