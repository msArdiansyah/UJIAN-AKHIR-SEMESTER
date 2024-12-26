SELECT 
    nama_pelanggan, 
    total_belanja
FROM 
    (SELECT 
         Pelanggan.nama_pelanggan, 
         SUM(Detail_Transaksi.subtotal) AS total_belanja
     FROM 
         Pelanggan
     JOIN 
         Transaksi ON Pelanggan.id_pelanggan = Transaksi.id_pelanggan
     JOIN 
         Detail_Transaksi ON Transaksi.id_transaksi = Detail_Transaksi.id_transaksi
     GROUP BY 
         Pelanggan.id_pelanggan, Pelanggan.nama_pelanggan
    ) AS Total_Pelanggan
WHERE 
    total_belanja > 1000000;
