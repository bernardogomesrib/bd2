-- Active: 1708949357403@@localhost@5432@postgresaula0403

-- 1- Criar um relatório que mostre os nomes das músicas e dos seus criadores (nomes dos artistas) 
--que não fazem parte de um album, ou seja, músicas criadas mas que não fazem parte de um álbum ainda.
CREATE or REPLACE VIEW relatorioNaoFazParte as
SELECT musica.codigo as codigoMusica, musica.título, artista.codigo as codigoArtista, artista.nome_artista from musica left join artista on musica.cod_artista = artista.codigo where musica.codigo not in((select faz_parte.cod_musica from faz_parte));

SELECT * from relatorioNaoFazParte

--2- Criar um relatório que retorne o título dos álbuns e a quantidade de músicas que estão cadastradas em cada um.
CREATE VIEW relatorioMusicasPorAlbum as
SELECT album.nome, (SELECT count(cod_musica) FROM faz_parte WHERE cod_album = album.codigo) FROM album;

SELECT * from relatorioMusicasPorAlbum;

INSERT INTO album VALUES((SELECT max(codigo)+1 from album LIMIT 1), 'wahwhwh',FALSE,null);

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
DROP Function albumProcura;

CREATE or REPLACE FUNCTION albumProcura(var_nomeAlb VARCHAR(40))
RETURNS TABLE (nome_artista VARCHAR,quantidadeMusica BIGINT)
LANGUAGE plpgsql as $$
DECLARE var_cod INTEGER;
BEGIN
    SELECT codigo FROM album WHERE nome = var_nomeAlb LIMIT 1 INTO var_cod;
    IF var_cod IS NULL THEN
        RAISE EXCEPTION 'Album Não Existe!';
    ELSE
        RETURN QUERY SELECT artista.nome_artista, count(faz_parte.cod_musica) FROM faz_parte JOIN musica on musica.codigo =
        faz_parte.cod_musica JOIN artista ON musica.cod_artista = artista.codigo WHERE faz_parte.cod_album = var_cod GROUP BY artista.nome_artista;
    END IF;
END;
$$

SELECT albumProcura('Romântico Misto');

--tentando ver se tem erro no código
SELECT artista.nome_artista, count(faz_parte.cod_musica) AS quantidadeMusicas FROM faz_parte JOIN musica on musica.codigo =
        faz_parte.cod_musica JOIN artista ON musica.cod_artista = artista.codigo WHERE faz_parte.cod_album = 1 GROUP BY artista.nome_artista;

SELECT concat('(',artista.nome_artista,',', count(faz_parte.cod_musica),')') FROM faz_parte JOIN musica on musica.codigo =
        faz_parte.cod_musica JOIN artista ON musica.cod_artista = artista.codigo WHERE faz_parte.cod_album = 3 GROUP BY artista.nome_artista;

drop FUNCTION albumProcura;
--- IA Respondendo depois de muito apanhar
CREATE OR REPLACE FUNCTION albumProcura(var_nomeAlb VARCHAR(40))
RETURNS TABLE(artista VARCHAR(30), quantidadeMusicas BIGINT)
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
SELECT albumProcura('Romântico Misto');


--- fim resposta IA



--REGRA DO NEGÓCIO: Uma regra desse negócio é que um álbum só pode ser lançado com pelo menos 5 músicas associadas. 
--A coluna que indica se o álbum já pode ser lançado é o booleano pode_lancar, já a data de lançamento é colocada na 
--coluna dt_lancamento.
--5- Criar uma trigger que atualiza a coluna pode_lancar para true quando a quantidade mínima de músicas de 
--um álbum é atingida.


-- função do trigger
CREATE or REPLACE Function atualizaColunaAlbum()
RETURNS TRIGGER
LANGUAGE plpgsql as $$
DECLARE qnt_mus BIGINT;
BEGIN
    SELECT count(cod_musica) FROM faz_parte WHERE cod_album = NEW.cod_album INTO qnt_mus;
    IF qnt_mus >= 5 THEN
        UPDATE album set pode_lancar = TRUE WHERE album.codigo = new.cod_album;
    ELSE
        UPDATE album set pode_lancar = FALSE WHERE album.codigo = new.cod_album;
    END IF;
    RETURN NEW;
END;
$$

--trigger sendo criado
CREATE OR REPLACE TRIGGER TG_atualizaColunaAlbum
AFTER insert ON faz_parte
FOR EACH ROW
EXECUTE PROCEDURE atualizaColunaAlbum();


-- checando os albuns por quantidade de musica
SELECT count(cod_musica) FROM faz_parte WHERE cod_album = 3;

-- inserindo um valor no album 3 para confirmar o trigger
INSERT INTO faz_parte VALUES(6,3);

SELECT * from album;

-- SELECT mostrando se a musica está ou não em album
SELECT musica.codigo, musica.título, CASE 
    WHEN (SELECT count(cod_album) FROM faz_parte WHERE cod_musica = musica.codigo)>=1 THEN  TRUE
    ELSE
        FALSE
END as colun FROM musica;



-- SELECT com apenas as musicas que não estão em albuns
WITH subconsulta AS (
    SELECT cod_musica, COUNT(cod_album) >= 1 AS faz_parte_do_album
    FROM faz_parte
    GROUP BY cod_musica
)
SELECT m.codigo, m.título, sub.faz_parte_do_album
FROM musica AS m
LEFT JOIN subconsulta AS sub ON m.codigo = sub.cod_musica
WHERE sub.faz_parte_do_album is null;



--6- Criar uma trigger que não permite marcar o lançamento de um álbum 
--(preenchimento da coluna dt_lancamento em album com valor diferente de null) sem o album estar apto para ser 
--lançado (pode_lancar deve estar em true).

CREATE or REPLACE FUNCTION checaSePodeLancar()
RETURNS TRIGGER
LANGUAGE PLPGSQL AS $$
BEGIN
    IF (new.pode_lancar = FALSE) THEN
        RAISE EXCEPTION 'Album não tem quantidade suficiente de músicas';
    ELSE
        RETURN NEW;
    END IF;
    RETURN NEW;
END;
$$
CREATE Trigger TG_checaPodeLançar
BEFORE UPDATE on album for EACH row EXECUTE PROCEDURE checaSePodeLancar();

UPDATE album set dt_lancamento = '2022-12-12' WHERE codigo = 3;