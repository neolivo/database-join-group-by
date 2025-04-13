-- buat laporan pelanggan baru (belum pernah order)
-- tampilkan CustomerId, Nama Pelanggan, Nomor Telepon

SELECT DISTINCT
    customer.Id AS CustomerId,
    CONCAT(customer.FirstName, ' ', customer.LastName) AS NamaPelanggan,
    customer.Phone AS NomorTelepon,
    orders.`TotalAmount` -- ini untuk memastikan nilainya

FROM
    customer

LEFT JOIN
    orders ON customer.Id = orders.CustomerId

WHERE
    TotalAmount < 0 OR
    TotalAmount IS NULL

ORDER BY
    orders.`TotalAmount` ASC;