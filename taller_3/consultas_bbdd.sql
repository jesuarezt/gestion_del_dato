/*
 * 
 * 1. Cuáles son los 10 productos más vendidos en AdventureWorks utilizando Production.Product y  Sales.SalesOrderDetail. 
 * 
 * */

SELECT TOP 10
p.ProductID, p.Name, count(sod.SalesOrderID) as veces_vendido
FROM Production.Product p
LEFT JOIN Sales.SalesOrderDetail sod  ON (sod.ProductID = p.ProductID)
GROUP BY p.ProductID, p.Name
ORDER BY Count(sod.SalesOrderID) DESC


/*
 * 
 * 2. Determinar los vendedores estrella de los que más venden a los que menos venden por año en  Adventure Works utilizando SalesPersonQuotaHistory y Person 
 * 
 */


select top 10 *, YEAR(spqh.QuotaDate)
FROM sales.SalesPersonQuotaHistory spqh ;
select top 10 *
FROM Person.Person p  ;

SELECT p.FirstName, p.LastName, 
    YEAR(spqh.QuotaDate) as año, 
    SUM(spqh.SalesQuota) as total_vendido
FROM Person.Person p 
inner JOIN Sales.SalesPersonQuotaHistory spqh on (spqh.BusinessEntityID = p.BusinessEntityID)
GROUP BY p.FirstName, p.LastName, YEAR(spqh.QuotaDate) 
ORDER BY YEAR(spqh.QuotaDate), 
    SUM(spqh.SalesQuota) DESC