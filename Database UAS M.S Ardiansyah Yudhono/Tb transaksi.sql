CREATE TABLE Transaksi (
    id_transaksi INT PRIMARY KEY,
    tanggal DATE,
    id_pelanggan INT,
    FOREIGN KEY (id_pelanggan) REFERENCES Pelanggan(id_pelanggan)
);