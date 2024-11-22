CREATE DATABASE LojaOnline;
USE LojaOnline;

CREATE TABLE Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Telefone VARCHAR(15)
);

CREATE TABLE Produtos (
    ProdutoID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL,
    Estoque INT NOT NULL
);

CREATE TABLE Pedidos (
    PedidoID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    DataPedido DATE NOT NULL,
    FOREIGN KEY (ClienteID) REFERENCES Clientes(ClienteID)
);

CREATE TABLE ItensPedido (
    ItemID INT AUTO_INCREMENT PRIMARY KEY,
    PedidoID INT,
    ProdutoID INT,
    Quantidade INT NOT NULL,
    FOREIGN KEY (PedidoID) REFERENCES Pedidos(PedidoID),
    FOREIGN KEY (ProdutoID) REFERENCES Produtos(ProdutoID)
);

INSERT INTO Clientes (Nome, Email, Telefone) VALUES
('João Silva', 'joao@gmail.com', '1234-5678'),
('Maria Oliveira', 'maria@gmail.com', '9876-5432');

INSERT INTO Produtos (Nome, Preco, Estoque) VALUES
('Camiseta', 29.90, 100),
('Calça', 59.90, 50),
('Tênis', 199.90, 30);

INSERT INTO Pedidos (ClienteID, DataPedido) VALUES
(1, '2023-11-01'),
(2, '2023-11-02');

INSERT INTO ItensPedido (PedidoID, ProdutoID, Quantidade) VALUES
(1, 1, 2),  -- 2 Camisetas para o Pedido 1
(1, 3, 1),  -- 1 Tênis para o Pedido 1
(2, 2, 1);  -- 1 Calça para o Pedido 2

SELECT 
    c.Nome AS NomeCliente,
    p.DataPedido,
    pr.Nome AS NomeProduto,
    ip.Quantidade,
    pr.Preco,
    (ip.Quantidade * pr.Preco) AS Total
FROM 
    Pedidos p
JOIN 
    Clientes c ON p.ClienteID = c.ClienteID
JOIN 
    ItensPedido ip ON p.PedidoID = ip.PedidoID
JOIN 
    Produtos pr ON ip.ProdutoID = pr.ProdutoID;

 SELECT 
    pr.Nome AS NomeProduto,
    pr.Estoque,
    SUM(ip.Quantidade) AS QuantidadeVendida
FROM 
    Produtos pr
JOIN 
    ItensPedido ip ON pr.ProdutoID = ip.ProdutoID
GROUP BY 
    pr.Nome, pr.Estoque;   