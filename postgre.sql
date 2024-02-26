

CREATE OR REPLACE FUNCTION checar_igual (a1 TEXT,  a2 TEXT)
RETURNS BOOLEAN
LANGUAGE plpgsql AS $$
DECLARE igual BOOLEAN;
BEGIN
        SELECT (a1 = a2) INTO igual ; -- igual = (a1 = a2);
        RETURN igual ;
END;
$$

SELECT checar_igual('cabeça','cabeça');

CREATE OR REPLACE FUNCTION checar_numeros_iguais(a1 int, a2 int)
RETURNS INT
LANGUAGE plpgsql AS $$
DECLARE soma INT;
BEGIN
        SELECT (a1+ a2) INTO soma ;
        RETURN soma;
END;
$$

SELECT checar_numeros_iguais(2,2);

CREATE OR REPLACE FUNCTION entregar_o_maior(a1 int, a2 int)
RETURNS INT
LANGUAGE plpgsql as $$
BEGIN
    IF a1=a2 THEN
        RAISE EXCEPTION 'Numeros iguais';
    END IF;
    IF a1>a2 THEN
        RETURN a1 ;
    ELSE
        RETURN a2 ;
    END IF;
END;
$$

SELECT entregar_o_maior(200,200);


CREATE TABLE fornecedor(
    id INTEGER PRIMARY KEY,
    nome VARCHAR(40)
);
CREATE Table produto(
    id INTEGER primary KEY,
    nome varchar(40),
    id_fornecedor int,
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id)
);

insert into fornecedor VALUES(1,'unilever'),(2,'Ypê');
SELECT nome from fornecedor WHERE nome = "itapisuma";

CREATE OR REPLACE FUNCTION temFornecedor(a1 VARCHAR(40))
RETURNS int
LANGUAGE plpgsql as $$
DECLARE id_do_fornecedor int;
BEGIN
    SELECT fornecedor.id from fornecedor WHERE fornecedor.nome = a1 INTO id_do_fornecedor;
    IF id_do_fornecedor is NULL THEN
        SELECT id from fornecedor ORDER by id DESC LIMIT 1 INTO id_do_fornecedor;
        id_do_fornecedor = id_do_fornecedor+1;
        INSERT INTO fornecedor VALUES(id_do_fornecedor,a1);
    ELSE
        RAISE EXCEPTION 'Fornecedor já existe';
    END IF;
    RETURN id_do_fornecedor;

END;
$$
SELECT temFornecedor('maconha');
drop Function temfornecedor;
SELECT * from fornecedor;
