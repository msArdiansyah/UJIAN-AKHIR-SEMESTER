CREATE TABLE Produk_Pemasok (
    id_pemasok INT,
    id_produk INT,
    PRIMARY KEY (id_pemasok, id_produk),
    FOREIGN KEY (id_pemasok) REFERENCES Pemasok(id_pemasok),
    FOREIGN KEY (id_produk) REFERENCES Produk(id_produk)
);