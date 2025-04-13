-- laporan tren pembelian bulanan yang mencakup:
-- 1. tahun dan bulan
-- 2. total akumulasi order
-- 3. total nilai penjualan
-- 4. rata-rata nilai per order
-- (urutkan berdasarkan tahun dan bulan)

SELECT
    DATE_FORMAT(orders.OrderDate, '%M %Y') AS Periode,
    COUNT(DISTINCT orders.id) AS JumlahOrder,
    SUM(DISTINCT orders.TotalAmount) AS TotalPenjualan,
    AVG(DISTINCT orders.TotalAmount) AS RerataOrder

FROM
    orders

JOIN
    orderitem ON orders.id = orderitem.OrderId

GROUP BY
    DATE_FORMAT(orders.OrderDate, '%Y-%m'),
    Periode -- untuk menghindari error
    
ORDER BY
    DATE_FORMAT(orders.OrderDate, '%Y-%m') DESC;