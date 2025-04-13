# Proyek Analisis Query Database
oleh Davis Arrizqi Putra Mandiri

## Gambaran Proyek
Repositori ini berisi solusi independen saya untuk tantangan query database yang disediakan dalam soal-latihan.pdf. Setiap solusi mendemonstrasikan berbagai aspek optimasi query SQL dan teknik analisis database.

## Struktur Database
Database terdiri dari beberapa tabel yang saling terhubung:

1. `customer` - Menyimpan informasi pelanggan
    - Kolom: Id, FirstName, LastName, City, Country, Phone
    
2. `orders` - Berisi transaksi pesanan
    - Kolom: Id, OrderDate, OrderNumber, CustomerId, TotalAmount
    
3. `orderitem` - Detail item dalam setiap pesanan
    - Kolom: Id, OrderId, ProductId, Quantity
    
4. `product` - Katalog produk
    - Kolom: Id, ProductName, SupplierId, UnitPrice, Package
    
5. `supplier` - Informasi pemasok
    - Kolom: Id, CompanyName, ContactName, City, Country, Phone, Fax

## Analisis Solusi

### Tugas 1: Analisis Pengeluaran Pelanggan
```sql
SELECT 
     CONCAT(customer.FirstName, ' ', customer.LastName) as Nama, 
     Country as Negara, orders.TotalAmount as Total
FROM 
     customer, orders
WHERE
     orders.CustomerId = customer.id
ORDER BY
     Total DESC;
```
Query ini menganalisis pola pengeluaran pelanggan dengan:
- Menggabungkan nama pelanggan menggunakan CONCAT
- Menggabungkan data pelanggan dan pesanan
- Mengurutkan hasil berdasarkan jumlah total secara menurun

### Tugas 2: Analisis Popularitas Produk
```sql
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
```
Query ini mengidentifikasi produk yang paling sering dibeli dengan:
- Menghitung total kuantitas terjual per produk
- Menggunakan GROUP BY untuk mengumpulkan data penjualan
- Mengurutkan berdasarkan total kuantitas secara menurun

### Tugas 3: Tren Penjualan Bulanan
```sql
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
     Periode
ORDER BY
     DATE_FORMAT(orders.OrderDate, '%Y-%m') DESC;
```
Analisis ini memberikan tren pembelian bulanan dengan:
- Memformat tanggal menjadi periode bulan-tahun
- Menghitung jumlah pesanan, total penjualan, dan nilai rata-rata pesanan
- Mengelompokkan hasil berdasarkan bulan dan tahun

### Tugas 4: Analisis Pelanggan Teratas
```sql
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
```
Query ini mengidentifikasi 3 pelanggan paling aktif dengan:
- Menghitung total pesanan per pelanggan
- Menghitung jumlah total pembelian
- Membatasi hasil untuk 3 pelanggan teratas

### Tugas 5: Identifikasi Pelanggan Baru
```sql
SELECT DISTINCT
     customer.Id AS CustomerId,
     CONCAT(customer.FirstName, ' ', customer.LastName) AS NamaPelanggan,
     customer.Phone AS NomorTelepon,
     orders.TotalAmount
FROM
     customer
LEFT JOIN
     orders ON customer.Id = orders.CustomerId
WHERE
     TotalAmount < 0 OR
     TotalAmount IS NULL
ORDER BY
     orders.TotalAmount ASC;
```
Query ini mengidentifikasi pelanggan baru yang belum melakukan pembelian dengan:
- Menggunakan LEFT JOIN untuk menyertakan semua pelanggan
- Menyaring jumlah total yang null atau negatif
- Menampilkan informasi kontak pelanggan

---
NEO LIVO ACADEMY