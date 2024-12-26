SELECT 
    Transaksi.id_transaksi,
    Transaksi.tanggal,
    Pelanggan.nama_pelanggan,
    Produk.nama_produk,
    Detail_Transaksi.kuantitas,
    Detail_Transaksi.subtotal
FROM 
    Transaksi
JOIN 
    Pelanggan ON Transaksi.id_pelanggan = Pelanggan.id_pelanggan
JOIN 
    Detail_Transaksi ON Transaksi.id_transaksi = Detail_Transaksi.id_transaksi
JOIN 
    Produk ON Detail_Transaksi.id_produk = Produk.id_produk
ORDER BY 
    Transaksi.tanggal DESC;
