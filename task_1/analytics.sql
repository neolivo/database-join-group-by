-- tampilkan nama lengkap pelanggan, negara asal,
-- dan total jumlah uang yang dibelanjakan
-- (urutkan dari yang terbesar)

SELECT 
    CONCAT(customer.FirstName, ' ', customer.LastName) as Nama, 
    Country as Negara, orders.TotalAmount as Total

FROM 
    customer, orders

WHERE
    orders.CustomerId = customer.id

ORDER BY
    Total DESC;