# banco de dados e-commerce desadio dio 
foi criado um modelo de banco de dados para referenciar uma loja virtual 

O modelo consiste nas seguintes entidades e seus atributos:

Cliente: id_cliente (PK), nome, email, cpf_cnpj, tipo_cliente
Fornecedor: id_fornecedor (PK), nome, email, cnpj
Estoque: id_estoque (PK), nome, quantidade, id_fornecedor (FK)
Produto: id_produto (PK), nome, descricao, preco, id_estoque (FK)
Pedido: id_pedido (PK), data_pedido, id_cliente (FK)
Pagamento: id_pagamento (PK), forma_pagamento, id_pedido (FK)
Entrega: id_entrega (PK), status_entrega, codigo_rastreio, id_pedido (FK)
As chaves estrangeiras (FKs) representam os relacionamentos entre as entidades:

Cliente.id_cliente -> Pedido.id_cliente
Pedido.id_pedido -> Pagamento.id_pedido
Pedido.id_pedido -> Entrega.id_pedido
Estoque.id_estoque -> Produto.id_estoque
Fornecedor.id_fornecedor -> Estoque.id_fornecedor
