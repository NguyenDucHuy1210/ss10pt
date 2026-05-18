CREATE DATABASE IF NOT EXISTS rikkei_clinic_db;
USE rikkei_clinic_db;

CREATE TABLE pharmacy_inventory (
    inventory_id INT AUTO_INCREMENT PRIMARY KEY,
    drug_name VARCHAR(255) NOT NULL,
    batch_number VARCHAR(100),
    expiry_date DATE,
    quantity INT
);

INSERT INTO pharmacy_inventory
(drug_name, batch_number, expiry_date, quantity)
VALUES
('Paracetamol', 'P001', '2026-12-01', 100),
('Paracetamol', 'P002', '2026-10-15', 200),
('Amoxicillin', 'A001', '2025-08-20', 150),
('Vitamin C', 'V001', '2027-01-01', 300),
('Paracetamol Extra', 'P003', '2026-11-11', 120);

CREATE INDEX idx_drug_expiry
ON pharmacy_inventory(drug_name, expiry_date);
EXPLAIN
SELECT *
FROM pharmacy_inventory
WHERE drug_name = 'Paracetamol'
AND expiry_date <= '2026-12-31';

EXPLAIN
SELECT *
FROM pharmacy_inventory
WHERE drug_name LIKE 'Paracetamol%';