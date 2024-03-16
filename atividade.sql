-- Active: 1708949357403@@localhost@5432@postgresaula0403

-- 1- Criar um relatório que mostre os nomes das músicas e dos seus criadores (nomes dos artistas) 
--que não fazem parte de um album, ou seja, músicas criadas mas que não fazem parte de um álbum ainda.
CREATE VIEW relatorioNaoFazParte as
SELECT musica.codigo as codigoMusica, musica.título, artista.codigo as codigoArtista, artista.nome_artista from musica join artista on musica.cod_artista = artista.codigo where musica.codigo not in((select faz_parte.cod_musica from faz_parte));

SELECT * from relatorioNaoFazParte

--2- Criar um relatório que retorne o título dos álbuns e a quantidade de músicas que estão cadastradas em cada um.
CREATE VIEW relatorioMusicasPorAlbum as
SELECT album.nome, (SELECT count(cod_musica) FROM faz_parte WHERE cod_album = album.codigo) FROM album;

SELECT * from relatorioMusicasPorAlbum;


--3- Criar uma estrutura que insere uma música recebendo o título, a duração e o nome do artista. O procedimento deve 
--verificar se o artista já existe, caso não exista deve inserir ele antes. O procedimento deve gerar os códigos das tabelas, 
--preencher nulo em país e salário na tabela artista e 2020 em ano_composicao na tabela musica.

CREATE or REPLACE FUNCTION insereMusica(var_titulo varchar(40),var_duracao INTEGER, var_nomeArtista VARCHAR(30))
RETURNS VOID
LANGUAGE plpgsql as $$
DECLARE var_cod INTEGER;
DECLARE var_codMus INTEGER;
BEGIN
    SELECT codigo FROM artista WHERE nome_artista = var_nomeArtista LIMIT 1 INTO var_cod;
    IF var_cod IS NULL THEN
        SELECT MAX(codigo)+1 FROM artista INTO var_cod;
        INSERT INTO artista VALUES(var_cod,var_nomeArtista,null,null);
    END IF;
    SELECT MAX(codigo)+1 from musica LIMIT 1 INTO var_codMus;

    INSERT INTO musica(codigo,título,ano_composicao,duracao,cod_artista) VALUES(var_codMus,var_titulo,2020,var_duracao,var_cod);

END;
$$

SELECT insereMusica('a loira do txan',420,'exalta samba');
SELECT * FROM musica;
SELECT * from artista;


--4- Criar uma estrutura que retorna os nomes dos artistas e a quantidade de músicas deles que fazem parte de um álbum, 
--a partir do nome do álbum. Caso o álbum não exista, deve levantar uma exceção.


CREATE or REPLACE FUNCTION albumProcura(var_nomeAlb VARCHAR(40))
RETURNS TABLE (concatenacao VARCHAR)
LANGUAGE plpgsql as $$
DECLARE var_cod INTEGER;
BEGIN
    SELECT codigo FROM album WHERE nome = var_nomeAlb LIMIT 1 INTO var_cod;
    IF var_cod IS NULL THEN
        RAISE EXCEPTION 'Album Não Existe!';
    ELSE
        RETURN QUERY SELECT concat('(',artista.nome_artista,',', count(faz_parte.cod_musica),')') FROM faz_parte JOIN musica on musica.codigo =
        faz_parte.cod_musica JOIN artista ON musica.cod_artista = artista.codigo WHERE faz_parte.cod_album = var_cod GROUP BY artista.nome_artista;
    END IF;
END;
$$

SELECT albumProcura('Romântico Misto');


SELECT artista.nome_artista, count(faz_parte.cod_musica) AS quantidadeMusicas FROM faz_parte JOIN musica on musica.codigo =
        faz_parte.cod_musica JOIN artista ON musica.cod_artista = artista.codigo WHERE faz_parte.cod_album = 1 GROUP BY artista.nome_artista;

SELECT concat('(',artista.nome_artista,',', count(faz_parte.cod_musica),')') FROM faz_parte JOIN musica on musica.codigo =
        faz_parte.cod_musica JOIN artista ON musica.cod_artista = artista.codigo WHERE faz_parte.cod_album = 3 GROUP BY artista.nome_artista;

drop FUNCTION albumProcura;
--- IA Respondendo depois de muito apanhar
CREATE OR REPLACE FUNCTION albumProcura(var_nomeAlb VARCHAR(40))
RETURNS TABLE(artista VARCHAR(30), quantidadeMusicas INTEGER)
LANGUAGE plpgsql AS $$
DECLARE 
    var_cod INTEGER;
    result_record RECORD;
BEGIN
    SELECT codigo INTO var_cod FROM album WHERE nome = var_nomeAlb LIMIT 1;
    IF var_cod IS NULL THEN
        RAISE EXCEPTION 'Album Não Existe!';
    ELSE
        FOR result_record IN
            SELECT artista.nome_artista, count(faz_parte.cod_musica) AS quantidadeMusicas 
            FROM faz_parte 
            JOIN musica ON musica.codigo = faz_parte.cod_musica 
            JOIN artista ON musica.cod_artista = artista.codigo 
            WHERE faz_parte.cod_album = var_cod 
            GROUP BY artista.nome_artista
        LOOP
            artista := result_record.nome_artista;
            quantidadeMusicas := result_record.quantidadeMusicas;
            RETURN NEXT;
        END LOOP;
    END IF;
END;
$$;



--- fim resposta IA

CREATE OR REPLACE FUNCTION obter()
RETURNS TABLE (cod_musica INTEGER, cod_album INTEGER)
LANGUAGE plpgsql AS $$
BEGIN
    RETURN QUERY
        SELECT *
        FROM faz_parte;
END;
$$;
SELECT obter();


------ MINHA TENTATIVA COM PROCEDURE
DROP FUNCTION tentativa;

CREATE or REPLACE FUNCTION tentativa(var_nomeAlbum VARCHAR)
RETURNS TABLE (nome_artista VARCHAR(50),contagem INTEGER)
LANGUAGE plpgsql AS $$
DECLARE var_cod INTEGER;
BEGIN
    SELECT codigo FROM album WHERE nome = var_nomeAlbum LIMIT 1 INTO var_cod;
    IF var_cod IS NULL THEN
        RAISE EXCEPTION 'Album não existe';
    ELSE
        RETURN query SELECT artista.nome_artista,count(faz_parte.cod_musica) as contagem FROM faz_parte JOIN musica on musica.codigo =
        faz_parte.cod_musica JOIN artista ON musica.cod_artista = artista.codigo WHERE faz_parte.cod_album = var_cod GROUP BY artista.nome_artista;
    
    END IF;
END;
$$;


SELECT tentativa('Romântico Misto');

CREATE OR REPLACE FUNCTION minha_procedure(var_nomeAlbum VARCHAR)
RETURNS TABLE(coluna1 VARCHAR, coluna2 INT) AS $$
DECLARE var_cod INTEGER;
BEGIN
    
   SELECT codigo FROM album WHERE nome = var_nomeAlbum LIMIT 1 INTO var_cod;
    IF var_cod IS NULL THEN
        RAISE EXCEPTION 'Album não existe';
    ELSE
        RETURN query SELECT nome_artista, count(faz_parte.cod_musica) FROM faz_parte JOIN musica on musica.codigo =
        faz_parte.cod_musica JOIN artista ON musica.cod_artista = artista.codigo WHERE faz_parte.cod_album = var_cod GROUP BY artista.nome_artista;
    
    END IF;
END;
$$ LANGUAGE plpgsql;

SELECT minha_procedure('Romantico Misto');

CALL tentativa('Romântico Misto');


 SELECT artista.nome_artista, count(faz_parte.cod_musica) FROM faz_parte JOIN musica on musica.codigo =
        faz_parte.cod_musica JOIN artista ON musica.cod_artista = artista.codigo WHERE faz_parte.cod_album = 3 GROUP BY artista.nome_artista;
    SELECT codigo FROM album WHERE nome = 'Romântico Misto' LIMIT 1;


------ FIM TENTATIVA

--REGRA DO NEGÓCIO: Uma regra desse negócio é que um álbum só pode ser lançado com pelo menos 5 músicas associadas. 
--A coluna que indica se o álbum já pode ser lançado é o booleano pode_lancar, já a data de lançamento é colocada na 
--coluna dt_lancamento.
--5- Criar uma trigger que atualiza a coluna pode_lancar para true quando a quantidade mínima de músicas de 
--um álbum é atingida.
--6- Criar uma trigger que não permite marcar o lançamento de um álbum 
--(preenchimento da coluna dt_lancamento em album com valor diferente de null) sem o album estar apto para ser 
--lançado (pode_lancar deve estar em true).

