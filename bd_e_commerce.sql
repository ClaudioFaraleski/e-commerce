#criando as tabelas 

CREATE TABLE Cliente (
    id_cliente INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    cpf_cnpj VARCHAR(14) NOT NULL,
    tipo_cliente ENUM('PF', 'PJ') NOT NULL,
    PRIMARY KEY (id_cliente)
);

CREATE TABLE Fornecedor (
    id_fornecedor INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    cnpj VARCHAR(18) NOT NULL,
    PRIMARY KEY (id_fornecedor)
);

CREATE TABLE Estoque (
    id_estoque INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    quantidade INT NOT NULL,
    id_fornecedor INT NOT NULL,
    PRIMARY KEY (id_estoque),
    FOREIGN KEY (id_fornecedor) REFERENCES Fornecedor(id_fornecedor)
);

CREATE TABLE Produto (
    id_produto INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(255) NOT NULL,
    descricao TEXT NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    id_estoque INT NOT NULL,
    PRIMARY KEY (id_produto),
    FOREIGN KEY (id_estoque) REFERENCES Estoque(id_estoque)
);

CREATE TABLE Pedido (
    id_pedido INT NOT NULL AUTO_INCREMENT,
    data_pedido DATE NOT NULL,
    id_cliente INT NOT NULL,
    PRIMARY KEY (id_pedido),
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente)
);

CREATE TABLE Pagamento (
    id_pagamento INT NOT NULL AUTO_INCREMENT,
    forma_pagamento VARCHAR(255) NOT NULL,
    id_pedido INT NOT NULL,
    PRIMARY KEY (id_pagamento),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);

CREATE TABLE Entrega (
    id_entrega INT NOT NULL AUTO_INCREMENT,
    status_entrega VARCHAR(255) NOT NULL,
    codigo_rastreio VARCHAR(255) NOT NULL,
    id_pedido INT NOT NULL,
    PRIMARY KEY (id_entrega),
    FOREIGN KEY (id_pedido) REFERENCES Pedido(id_pedido)
);


#comando para saber quantos pedidos foram feitos por cada cliente

SELECT c.nome, COUNT(p.id_pedido) AS num_pedidos
FROM Cliente c
JOIN Pedido p ON c.id_cliente = p.id_cliente
GROUP BY c.id_cliente;

# comando para saber se algum vendedor também é fornecedor

SELECT f.nome
FROM Fornecedor f
JOIN Estoque e ON f.id_fornecedor = e.id_fornecedor
JOIN Produto p ON e.id_estoque = p.id_estoque
WHERE p.preco > 0;

#comando para saber a relação de produtos fornecedores e estoques

SELECT p.nome AS produto, f.nome AS fornecedor, e.nome AS estoque, e.quantidade
FROM Produto p
JOIN Estoque e ON p.id_estoque = e.id_estoque
JOIN Fornecedor f ONe.id_fornecedor = f.id_fornecedor;

#comando para relacionamento de nomes dos fornecedores e nomes dos produtos

SELECT f.nome AS fornecedor, p.nome AS produto
FROM Fornecedor f
JOIN Estoque e ON f.id_fornecedor = e.id_fornecedor
JOIN Produto p ON e.id_estoque = p.id_estoque;