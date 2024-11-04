CREATE DATABASE LojaOnline;
USE LojaOnline;

CREATE TABLE Clientes (
    ClienteID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    Telefone VARCHAR(15),
    DataCadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Produtos (
    ProdutoID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(100) NOT NULL,
    Preco DECIMAL(10, 2) NOT NULL,
    Estoque INT NOT NULL,
    DataCadastro DATETIME DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Pedidos (
    PedidoID INT AUTO_INCREMENT PRIMARY KEY,
    ClienteID INT,
    DataPedido DATETIME DEFAULT CURRENT_TIMESTAMP,
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

INSERT INTO Pedidos (ClienteID) VALUES
(1),
(2);

INSERT INTO ItensPedido (PedidoID, ProdutoID, Quantidade) VALUES
(1, 1, 2), 
(1, 3, 1),  
(2, 2, 1);  

DELIMITER //

CREATE TRIGGER AtualizarEstoque
AFTER INSERT ON ItensPedido
FOR EACH ROW
BEGIN
    UPDATE Produtos
    SET Estoque = Estoque - NEW.Quantidade
    WHERE ProdutoID = NEW.ProdutoID;
END;

//

DELIMITER ;

INSERT INTO ItensPedido (PedidoID, ProdutoID, Quantidade) VALUES
(1, 2, 1); 


