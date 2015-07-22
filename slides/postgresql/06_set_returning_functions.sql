SELECT * FROM project;
SELECT p.id, DATE(p.started_at + (month || ' month')::interval) as next_payment
FROM project p
    JOIN generate_series(1, p.installment - 1) as month
        ON 1 = 1
ORDER BY id, next_payment;

-- -------------------------------------------------------

SELECT * FROM project;
SELECT p.id, DATE(p.started_at + (month || ' month')::interval) as next_payment
FROM project p
    JOIN generate_series(0, p.installment - 1) as month
        ON 1 = 1
ORDER BY id, next_payment;