-- menemukan 3 pelanggan paling aktif
-- mencakup : negara, nama, jumlah order, total pembelian

SELECT 
    CONCAT(customer.FirstName, ' ' , customer.LastName) AS Nama, 
    customer.Country AS Negara,
    COUNT(DISTINCT orders.Id) AS JumlahOrder,
    SUM(DISTINCT orders.TotalAmount) AS TotalPembelian

FROM 
    customer

JOIN 
    orders ON customer.Id = orders.CustomerId   

GROUP BY
    Nama, Negara

ORDER BY
    JumlahOrder DESC

LIMIT 3;