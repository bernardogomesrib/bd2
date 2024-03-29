/* 1. Quantas são as músicas compostas por Djavan na década de 1980 e a média de duração delas?*/

SELECT * from musica WHERE cod_artista = (SELECT codigo FROM artista WHERE nome_artista = "Djavan") and ano_composicao BETWEEN 1980 and 1990;
/*
2. Apresentar o nome do álbum, se ele já está pronto para ser lançado e quantas músicas já tem cadastradas nele.
Álbuns sem músicas devem ser exibidos e as colunas devem ser apresentadas da seguinte maneira: ALBUM, LANÇAR? e QTDE DE MÚSICAS.
*/
SELECT nome, CASE
    WHEN pode_lancar = 1
    THEN  "Sim"
    ELSE  "Não"
END AS "Pode Lançar",(SELECT COUNT(cod_musica) FROM faz_parte WHERE faz_parte.cod_album = album.codigo) as "quantidade de musicas" FROM album WHERE pode_lancar = 1;

-- 3. Qual o comando que atualiza o salário dos artistas brasileiros para R$ 12.658,35 que tenham a letra a no nome?

UPDATE artista set salario = 12658.35 WHERE (artista.país = "Brasil") AND (nome_artista LIKE "%a%" OR nome_artista LIKE "%A%");
SELECT * FROM artista;

SELECT * from musica;
SELECT musica.titulo,musica.ano_composicao from musica WHERE duracao > 170 AND (cod_artista in (SELECT artista.codigo FROM artista WHERE artista.nome_artista IN("Lulu Santos","Djavan")))

-- 4. Apresentar o título e o ano de composição das músicas compostas por Lulu Santos ou Djavan que tenham duração maior ou igual a 170 segundos

SELECT musica.titulo,musica.ano_composicao, cod_artista, (SELECT nome_artista FROM artista where codigo = cod_artista) as "nome do artista" from musica WHERE duracao > 170 AND (cod_artista in (SELECT artista.codigo FROM artista WHERE artista.nome_artista IN("Lulu Santos","Djavan")))

-- 5. Qual a maior e menor duração das músicas que ainda não foram inserida em algum álbum?
SELECT "MENOR musica","duração" UNION
SELECT titulo,duracao from musica where duracao in (SELECT  min(duracao) from musica WHERE codigo not IN (SELECT cod_musica from faz_parte)) UNION 
SELECT "MAIOR musica","duração" UNION
SELECT titulo,duracao from musica where duracao in (SELECT  MAX(duracao) from musica WHERE codigo not IN (SELECT cod_musica from faz_parte));

-- 6. Quais os álbuns que já podem ser lançados mas não foram? Apresente os títulos dos álbuns com a lista de músicas em cada um deles, ordenados pelo nome do álbum depois pelo título da música.
SELECT nome, pode_lancar, dt_lancamento, titulo, ano_composicao from faz_parte JOIN album on cod_album = album.codigo join musica on cod_musica = musica.codigo WHERE (pode_lancar = 1) and (dt_lancamento IS NULL);


/*
7. Relacionar o nome do álbum, as faixas que fazem parte de cada álbum e o nome do artista que compôs cada música. Todos os álbuns devem ser listados.
*/


SELECT nome, pode_lancar, dt_lancamento, titulo, ano_composicao, artista.nome_artista from faz_parte right JOIN album on cod_album = album.codigo left join musica on cod_musica = musica.codigo left JOIN artista on musica.cod_artista = artista.codigo ORDER BY album.codigo;

-- SELECT codigo, nome,

SELECT * from album;