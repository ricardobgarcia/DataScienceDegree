/*
Módulo: Bando de dados
Lista: primeiros exercícios sobre banco de dados
Professor: Sandro Saorin
Data: 09/2021
*/

/*Estrutura da tabela tb_produto*/

CREATE TABLE tb_produto (
	id SERIAL NOT NULL,
	status CHAR(1) NOT NULL DEFAULT 'A',
	descricao VARCHAR(50) NULL DEFAULT NULL,
	estoque_minimo INT NULL DEFAULT NULL,
	estoque_maximo INT NULL DEFAULT NULL,
	PRIMARY KEY (id));

/*Consultar a tabela*/
SELECT * 
FROM tb_produto;

/*Inserir dados na tabela
INSERT INTO tb_produto VALUES (001, 'A', 'produto x', 30, 40 ); */
/*Inserindo 20 registros na tabela tb_produto
Campo "status" indica se o cadastro está ativo “A” ou inativo “I”*/

INSERT INTO tb_produto VALUES (0001, 'A', 'Lapis', 10, 20);
INSERT INTO tb_produto VALUES (0002, 'A', 'Lapis de cor', 12, 60);
INSERT INTO tb_produto VALUES (0003, 'A', 'Lapis de cera', 12, 50);
INSERT INTO tb_produto VALUES (0004, 'A', 'Marcadores',    10, 50);
INSERT INTO tb_produto VALUES (0005, 'A', 'Esferograficas (azul, vermelha, preta e verde)', 7, 30);
INSERT INTO tb_produto VALUES (0006, 'A', 'Etiqueta', 8, 100);
INSERT INTO tb_produto VALUES (0007, 'A', 'Borracha', 20, 70);
INSERT INTO tb_produto VALUES (0008, 'A', 'Caderno pautado', 30, 50);
INSERT INTO tb_produto VALUES (0009, 'A', 'Caderno quadriculado', 30, 50);
INSERT INTO tb_produto VALUES (0010, 'A', 'Caderno de musica', 16, 50);
INSERT INTO tb_produto VALUES (0011, 'A', 'Calculadora', 20, 30);
INSERT INTO tb_produto VALUES (0012, 'A', 'Regua de 20 cm', 13, 40);
INSERT INTO tb_produto VALUES (0013, 'I', 'Compasso    8', 40);
INSERT INTO tb_produto VALUES (0014, 'I', 'Giz de cera', 9, 30);
INSERT INTO tb_produto VALUES (0015, 'I', 'Tesoura', 11, 20);
INSERT INTO tb_produto VALUES (0016, 'I', 'Estojo',    21, 100);
INSERT INTO tb_produto VALUES (0017, 'I', 'Papel Manteiga',    15, 50);
INSERT INTO tb_produto VALUES (0018, 'I', 'Mochila', 6, 100);
INSERT INTO tb_produto VALUES (0019, 'I', 'T-shirt', 25, 120);
INSERT INTO tb_produto VALUES (0020, 'I', 'Corretivo', 16, 30);

/*Consultar a tabela*/
SELECT * FROM tb_produto;

/*Update para corrigir informações do produto 13 compasso */
UPDATE tb_produto
SET estoque_maximo = 40 
WHERE id = 13; 

/* update mandou id 13 para última linha*/
SELECT * 
FROM tb_produto
ORDER BY 3 /*ordenando segundo a terceira coluna*/

/*Update para corrigir informações do produto 13 compasso */
UPDATE tb_produto
SET estoque_minimo = 8
WHERE id = 13;

UPDATE tb_produto
SET descricao = 'Compasso'
WHERE id = 13;

SELECT DISTINCT status
FROM tb_produto;

SELECT * 
FROM tb_produto
WHERE descricao LIKE 'Caderno%';

/*Consulta com mais de uma condição*/
SELECT * 
FROM tb_produto
WHERE status = 'A' AND estoque_maximo > 50;

SELECT * 
FROM tb_produto
WHERE estoque_minimo > 30 or estoque_maximo < 50;

/*Outra interessante BETWEEN: valores numa faixa*/
SELECT * 
FROM tb_produto
WHERE estoque_maximo BETWEEN 50 AND 100;


/*Estrutura da tabela tb_entrada_produto*/

CREATE TABLE tb_entrada_produto (
	id SERIAL NOT NULL,
	id_produto INT NULL DEFAULT NULL,
	qtde INT NULL DEFAULT NULL,
	valor_unitario DECIMAL(9,2) NULL DEFAULT '0.00',
	data_entrada DATE NULL DEFAULT NULL,
	PRIMARY KEY (id));

/*Inserindo 20 registros na tabela tb_entrada_produto*/

INSERT INTO tb_entrada_produto VALUES (0001, 0001, 20, '1.00', '2000-12-31');
INSERT INTO tb_entrada_produto VALUES (0002, 0002, 60, '1.00', '2021-01-01');
INSERT INTO tb_entrada_produto VALUES (0003, 0003, 50, '2.00', '2021-01-31');
INSERT INTO tb_entrada_produto VALUES (0004, 0004, 50, '5.00', '2021-01-31');
INSERT INTO tb_entrada_produto VALUES (0005, 0005, 30, '10.00', '2021-01-22');
INSERT INTO tb_entrada_produto VALUES (0006, 0006, 100, '8.00', '2021-01-13');
INSERT INTO tb_entrada_produto VALUES (0007, 0007, 70, '9.00', '2021-03-31');
INSERT INTO tb_entrada_produto VALUES (0008, 0008, 50, '17.00', '2021-03-12');
INSERT INTO tb_entrada_produto VALUES (0009, 0009, 50, '9.00', '2021-03-09');
INSERT INTO tb_entrada_produto VALUES (0010, 0010, 50, '3.00', '2021-03-31');
INSERT INTO tb_entrada_produto VALUES (0011, 0011, 30, '2.00', '2021-02-28');
INSERT INTO tb_entrada_produto VALUES (0012, 0012, 40, '5.00', '2021-02-10');
INSERT INTO tb_entrada_produto VALUES (0013, 0013, 40, '4.00', '2021-02-28');
INSERT INTO tb_entrada_produto VALUES (0014, 0014, 30, '9.00', '2021-02-10');
INSERT INTO tb_entrada_produto VALUES (0015, 0015, 20, '3.00', '2021-02-13');
INSERT INTO tb_entrada_produto VALUES (0016, 0016, 100, '7.00', '2021-01-31');
INSERT INTO tb_entrada_produto VALUES (0017, 0017, 50, '2.00', '2021-01-25');
INSERT INTO tb_entrada_produto VALUES (0018, 0018, 100, '3.00', '2021-03-31');
INSERT INTO tb_entrada_produto VALUES (0019, 0019, 120, '8.00', '2021-03-30');
INSERT INTO tb_entrada_produto VALUES (0020, 0020, 30, '6.00', '2021-02-28');

SELECT *
FROM tb_entrada_produto;

SELECT MIN(valor_unitario) as valor_minimo
FROM tb_entrada_produto;

SELECT MAX(valor_unitario) as valor_maximo
FROM tb_entrada_produto;

SELECT COUNT(*)
FROM tb_entrada_produto;

/* SUM com GROUP BY rodando na tabela produto*/
SELECT status,
SUM(estoque_maximo) AS total_estoq_max
FROM tb_produto
GROUP BY 1;

SELECT status,
COUNT(id) AS cnt_estoques,
SUM(estoque_maximo) as estoq_max
FROM tb_produto
GROUP BY 1;

/*Estrutura da tabela tb_estoque*/

CREATE TABLE tb_estoque (
	id SERIAL NOT NULL,
	id_produto INT NULL DEFAULT NULL,
	qtde INT NULL DEFAULT NULL,
	valor_unitario DECIMAL(9,2) NULL DEFAULT '0.00',
	PRIMARY KEY (id));

/*Inserindo 20 registros na tabela tb_estoque*/
INSERT INTO tb_estoque VALUES (0001, 0001, 20, '1.00');
INSERT INTO tb_estoque VALUES (0002, 0002, 60, '1.50');
INSERT INTO tb_estoque VALUES (0003, 0003, 50, '2.00');
INSERT INTO tb_estoque VALUES (0004, 0004, 50, '5.00');
INSERT INTO tb_estoque VALUES (0005, 0005, 30, '10.00');
INSERT INTO tb_estoque VALUES (0006, 0006, 100, '8.00');
INSERT INTO tb_estoque VALUES (0007, 0007, 70, '9.00');
INSERT INTO tb_estoque VALUES (0008, 0008, 50, '17.00');
INSERT INTO tb_estoque VALUES (0009, 0009, 50, '9.00');
INSERT INTO tb_estoque VALUES (0010, 0010, 50, '3.00');
INSERT INTO tb_estoque VALUES (0011, 0011, 30, '2.00');
INSERT INTO tb_estoque VALUES (0012, 0012, 40, '5.00');
INSERT INTO tb_estoque VALUES (0013, 0013, 40, '4.00');
INSERT INTO tb_estoque VALUES (0014, 0014, 30, '9.00');
INSERT INTO tb_estoque VALUES (0015, 0015, 20, '3.00');
INSERT INTO tb_estoque VALUES (0016, 0016, 100, '7.00');
INSERT INTO tb_estoque VALUES (0017, 0017, 50, '2.00');
INSERT INTO tb_estoque VALUES (0018, 0018, 100, '3.00');
INSERT INTO tb_estoque VALUES (0019, 0019, 120, '8.00');
INSERT INTO tb_estoque VALUES (0020, 0020, 30, '6.00');


/*Estrutura da tabela tb_saida_produto*/

CREATE TABLE tb_saida_produto (
	id SERIAL NOT NULL,
	id_produto INT NULL DEFAULT NULL,
	qtde INT NULL DEFAULT NULL,
	data_saida DATE NULL DEFAULT NULL,
	valor_unitario DECIMAL(9,2) NULL DEFAULT '0.00',
	PRIMARY KEY (id));

/*Inserindo 10 registros na tabela tb_saida_produto*/

INSERT INTO tb_saida_produto VALUES (0001, 0011, 10, '2021-05-01', '2.00');
INSERT INTO tb_saida_produto VALUES (0002, 0012, 20, '2021-05-01', '5.00');
INSERT INTO tb_saida_produto VALUES (0003, 0013, 40, '2021-05-01', '4.00');
INSERT INTO tb_saida_produto VALUES (0004, 0014, 04, '2021-05-01', '9.00');
INSERT INTO tb_saida_produto VALUES (0005, 0015, 05, '2021-05-01', '3.00');
INSERT INTO tb_saida_produto VALUES (0006, 0016, 100, '2021-05-01', '7.00');
INSERT INTO tb_saida_produto VALUES (0007, 0017, 30, '2021-05-01', '2.00');
INSERT INTO tb_saida_produto VALUES (0008, 0018, 20, '2021-05-01', '3.00');
INSERT INTO tb_saida_produto VALUES (0009, 0019, 05, '2021-05-01', '8.00');
INSERT INTO tb_saida_produto VALUES (0010, 0020, 04, '2021-05-01', '6.00');

SELECT valor_unitario,
	AVG(qtde)
FROM tb_entrada_produto
group by 1
order by 1;

SELECT valor_unitario,
	ROUND(AVG(qtde),2) AS media_qtde
FROM tb_entrada_produto
group by 1
order by 1;

SELECT valor_unitario,
	COUNT(*) AS contagem
FROM tb_estoque
GROUP BY 1
HAVING COUNT(*) > 2;

SELECT valor_unitario,
	COUNT(*) AS contagem
FROM tb_entrada_produto
GROUP BY 1
HAVING COUNT(*) > 1
ORDER BY 1;