-- identifikasi produk paling sering dibeli
-- beserta jumlah total item yang terjual
-- customer, product, supplier, orders, orderitem

SELECT DISTINCT
    product.ProductName,
    SUM(orderitem.Quantity) AS JumlahTerjual

FROM 
    product

JOIN
    orderitem ON product.id = orderitem.ProductID

GROUP BY
    product.ProductName

ORDER BY
    JumlahTerjual DESC;