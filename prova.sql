-- Active: 1708949357403@@localhost@5432@prova
-- Criar um relatório com o valor gasto em saídas por tipo de cliente e por categoria de produto.
SELECT * from cliente;

SELECT * FROM produto;
SELECT * FROM entradas;
SELECT * FROM saidas;

CREATE or REPLACE VIEW relatorioValorGastoPorCategoria as
SELECT cliente.id,cliente.nome,sum(preco_venda) as "TotalVendas" from cliente JOIN saidas on id_cliente = cliente.id join produto on cod_produto = produto.codigo GROUP BY produto.categoria, cliente.id;


SELECT * from relatorioValorGastoPorCategoria;


-- Criar um relatório que apresente o nome dos produtos, a quantidade em estoque,
--o quanto já se gastou com suas entradas e o quanto já se arrecadou com suas saídas.
--Além disso, deve calcular qual o valor do lucro/prejuízo (CÁLCULO: quanto se recebeu -
--quanto se gastou) com esse produto.



CREATE or REPLACE VIEW relatorioLucroPrejuizo as
SELECT produto.codigo,produto.descricao,produto.estoque, sum(saidas.preco_venda) as "TotalLucro", sum(entradas.preco_unitario*entradas.quantidade) as "TotalGasto", (sum(saidas.preco_venda)-sum(entradas.preco_unitario*entradas.quantidade)) as "lucroOuPrejuizo"from produto left JOIN saidas on saidas.cod_produto = produto.codigo LEFT JOIN entradas on entradas.cod_produto = produto.codigo GROUP BY produto.codigo;

SELECT * from relatoriolucroprejuizo;

CREATE or REPLACE VIEW produtosNaoVendidos as
SELECT codigo,descricao,estoque,"TotalGasto","lucroOuPrejuizo" FROM relatoriolucroprejuizo WHERE "TotalLucro" is NULL;

SELECT * FROM produtosNaoVendidos;


---- function ou procedure parte

CREATE or REPLACE FUNCTION atualizaEstoquePorCategoria(var_categoria VARCHAR(40))
RETURNS void
LANGUAGE plpgsql as $$
DECLARE var_tot NUMERIC;
DECLARE var_id_produto INTEGER;
DECLARE resultset RECORD;
BEGIN



for resultset IN
SELECT codigo FROM produto WHERE produto.categoria = var_categoria
LOOP
UPDATE produto set estoque = (

SELECT
(case when sum(entradas.quantidade) - sum(saidas.quantidade) is NULL 
THEN
    case when 
    sum(entradas.quantidade) is NULL
    THEN
    0
    else
    sum(entradas.quantidade)
    end
    else
    sum(entradas.quantidade) - sum(saidas.quantidade)
    end) as estoqueReal FROM produto left JOIN entradas ON entradas.cod_produto = produto.codigo left JOIN saidas ON saidas.cod_produto = entradas.cod_produto WHERE produto.codigo = resultset.codigo GROUP BY produto.codigo

)
WHERE produto.codigo = resultset.codigo;



END LOOP;


END;
$$
;


SELECT codigo FROM produto WHERE produto.categoria = var_categoria;


SELECT * FROM produto WHERE produto.categoria = 'Alcoólico';


select nome('Alcoólico');




CREATE or REPLACE FUNCTION catalogoNomeMarca(var_categoria VARCHAR(40))
RETURNS TABLE (descricao varchar(30),marca varchar(30),estoque integer, classificacao_etaria integer)
LANGUAGE plpgsql as $$
DECLARE var_cod INTEGER;
BEGIN

    SELECT codigo FROM produto WHERE categoria = var_categoria LIMIT 1 INTO var_cod;
    IF var_cod IS NULL THEN
        RAISE EXCEPTION 'Categoria Não Existe!';
    ELSE
        RETURN QUERY SELECT produto.descricao,produto.marca,produto.estoque,produto.classificacao_etaria from produto WHERE produto.categoria = var_categoria;
    END IF;
END;
$$;

SELECT descricao,marca,estoque,classificacao_etaria from produto;
SELECT catalogoNomeMarca('Alcoólico');


CREATE or REPLACE FUNCTION quantidadeProdutoEntradaCategoria(var_categoria VARCHAR(40),var_entrada DATE)
RETURNS INTEGER
LANGUAGE plpgsql as $$
DECLARE var_cod INTEGER;
DECLARE var_cod2 INTEGER;
DECLARE resultado BIGINT;
BEGIN
    SELECT codigo FROM produto WHERE categoria = var_categoria LIMIT 1 INTO var_cod;
    SELECT cod_produto from entradas WHERE dt_entrada = var_entrada LIMIT 1 into var_cod2;
    
    IF var_cod2 IS NULL THEN
        RAISE EXCEPTION 'Não ha entrada nesse dia!';
    END IF;

    IF var_cod IS NULL THEN
        RAISE EXCEPTION 'Categoria Não Existe!';
    ELSE
        SELECT sum(entradas.quantidade) from entradas JOIN produto on cod_produto = produto.codigo where produto.categoria = var_categoria and entradas.dt_entrada = var_entrada into resultado;
        RETURN resultado;
    END IF;
END;
$$;

SELECT sum(entradas.quantidade) from entradas JOIN produto on cod_produto = produto.codigo where produto.categoria = 'Alcoólico' and entradas.dt_entrada = '2024-03-25';

SELECT quantidadeProdutoEntradaCategoria('Alcoólico','2024-03-25');

SELECT * from entradas;
SELECT * from produto;


-- Criar uma trigger que após o registro da entrada de um produto,
---deve ser incrementar o valor do estoque com a quantidade registrada na entrada.
CREATE or REPLACE FUNCTION alteraEstoque()
RETURNS TRIGGER
LANGUAGE PLPGSQL AS $$
BEGIN
    
    UPDATE produto set estoque = estoque + new.quantidade WHERE produto.codigo = new.cod_produto;
    RETURN NEW;
END;
$$
CREATE Trigger TG_atualizaEstoque
BEFORE INSERT on entradas for EACH row EXECUTE PROCEDURE alteraEstoque();

SELECT * from produto where categoria = 'Alcoólico';

INSERT INTO entradas VALUES(8,7777,69,2.0,current_date);


CREATE or REPLACE FUNCTION checaIdade()
RETURNS TRIGGER
LANGUAGE PLPGSQL AS $$
DECLARE idade INTEGER;
DECLARE var_categoria VARCHAR(20);
BEGIN
    SELECT categoria from produto where produto.codigo = new.cod_produto limit 1 into var_categoria;
    IF var_categoria = 'Alcoólico' THEN
        SELECT extract (year from age(cliente.dt_nascimento ))- extract (year from age(current_date)) from cliente where cliente.id = new.id_cliente LIMIT 1 INTO idade;
        
        IF idade >=18 THEN
            RETURN NEW;
        ELSE
            RAISE EXCEPTION 'Proibido venda de produtos alcólicos para menores de 18 anos';
        END IF;
    ELSE
            RETURN NEW;
    END if;
    
END;
$$
CREATE Trigger TG_checaIdade
BEFORE INSERT on saidas for EACH row EXECUTE PROCEDURE checaIdade();

SELECT * from cliente;
SELECT extract (year from age(cliente.dt_nascimento ))- extract (year from age(current_date)) from cliente where cliente.id = 4;

INSERT INTO saidas VALUES(1,4,current_date,69,69);
SELECT * from produto where codigo =1;
SELECT * from cliente where id = 4;
SELECT categoria from produto where produto.codigo = 8;






    CREATE or REPLACE FUNCTION checaIdade()
    RETURNS TRIGGER
    LANGUAGE PLPGSQL AS $$
    DECLARE idade INTEGER;
    DECLARE var_categoria VARCHAR(20);
    BEGIN
        SELECT categoria from produto where produto.codigo = new.cod_produto limit 1 into var_categoria;
        IF var_categoria = 'Alcoólico' THEN
            SELECT extract (year from age(cliente.dt_nascimento ))- extract (year from age(current_date)) from cliente where cliente.id = new.id_cliente LIMIT 1 INTO idade;
            
            IF idade >=18 THEN
                RETURN NEW;
            ELSE
                RAISE EXCEPTION 'Proibido venda de produtos alcólicos para menores de 18 anos';
            END IF;
        ELSE
                RETURN NEW;
        END if;
        
    END;
    $$
    CREATE Trigger TG_checaIdade
    BEFORE INSERT on saidas for EACH row EXECUTE PROCEDURE checaIdade();



CREATE or REPLACE FUNCTION alteraEstoque()
RETURNS TRIGGER
LANGUAGE PLPGSQL AS $$
BEGIN
    
    UPDATE produto set estoque = estoque + new.quantidade WHERE produto.codigo = new.cod_produto;
    RETURN NEW;
END;
$$;
CREATE or replace Trigger TG_atualizaEstoque
BEFORE INSERT on entradas for EACH row EXECUTE PROCEDURE alteraEstoque();
