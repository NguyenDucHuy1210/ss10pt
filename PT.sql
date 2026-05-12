CREATE DATABASE USER_DB;
USE USER_DB;

CREATE TABLE Pharmacy_Inventory (
    Inventory_ID INT AUTO_INCREMENT PRIMARY KEY,
    Drug_Name VARCHAR(255) NOT NULL,
    Batch_Number VARCHAR(50),
    Expiry_Date DATE,
    Quantity INT
);


INSERT INTO Pharmacy_Inventory (Drug_Name, Batch_Number, Expiry_Date, Quantity) VALUES 
('Paracetamol', 'P1', '2026-12-01', 100),
('Amoxicillin', 'P2', '2025-05-20', 250),
('Vitamin C', 'P3', '2024-10-15', 900),
('Ibuprofen', 'P4', '2026-01-10', 500);

CREATE INDEX idx_drug_expiry ON Pharmacy_Inventory(Drug_Name, Expiry_Date);

EXPLAIN SELECT * FROM Pharmacy_Inventory 
WHERE Drug_Name = 'Paracetamol' AND Expiry_Date < '2026-01-01';

ALTER TABLE Pharmacy_Inventory ADD FULLTEXT(Drug_Name);
