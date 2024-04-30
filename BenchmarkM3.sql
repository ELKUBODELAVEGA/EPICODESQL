create database ToysGroup;


-- Verificare l'unicità della PK 

SELECT COUNT(*) AS Total_Products, COUNT(DISTINCT ID) AS Unique_Products FROM Product;

-- Elenco dei prodotti venduti con il fatturato totale per anno:

SELECT p.Name, YEAR(s.Sale_Date) AS Year, SUM(s.Amount) AS Total_Sales
FROM Product p
JOIN Sales s ON p.ID = s.Product_ID
GROUP BY p.Name, YEAR(s.Sale_Date);

-- Fatturato totale per regione per anno, ordinato per data e fatturato decrescente:

SELECT r.Country, YEAR(s.Sale_Date) AS Year, SUM(s.Amount) AS Total_Sales
FROM Region r
JOIN Sales s ON r.ID = s.Region_ID
GROUP BY r.Country, YEAR(s.Sale_Date)
ORDER BY YEAR(s.Sale_Date), Total_Sales DESC;

-- Categoria di articoli maggiormente richiesta:

SELECT p.Category, COUNT(*) AS Total_Sales
FROM Product p
JOIN Sales s ON p.ID = s.Product_ID
GROUP BY p.Category
ORDER BY Total_Sales DESC
LIMIT 1;

-- Prodotti invenduti (approccio 1: utilizzando LEFT JOIN):

SELECT p.Name
FROM Product p
LEFT JOIN Sales s ON p.ID = s.Product_ID
WHERE s.ID IS NULL;

-- Elenco dei prodotti con la loro ultima data di vendita:

SELECT p.Name, MAX(s.Sale_Date) AS Last_Sale_Date
FROM Product p
JOIN Sales s ON p.ID = s.Product_ID
GROUP BY p.Name;








