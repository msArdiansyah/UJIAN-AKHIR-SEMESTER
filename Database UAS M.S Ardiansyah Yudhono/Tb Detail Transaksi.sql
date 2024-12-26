CREATE TABLE Detail_Transaksi (
    id_detail_transaksi INT PRIMARY KEY,
    id_transaksi INT,
    id_produk INT,
    kuantitas INT,
    subtotal DECIMAL(10, 2),
    FOREIGN KEY (id_transaksi) REFERENCES Transaksi(id_transaksi),
    FOREIGN KEY (id_produk) REFERENCES Produk(id_produk)
);