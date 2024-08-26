CREATE(f1:Filme{titulo:'O Auto da Compadecida', ano:2000}),
(f2:Filme{titulo:'Central do Brasil', ano:1998, filmado_em:'Rio de Janeiro'}),
(f3:Filme{titulo:'Carandiru: O Filme', ano:2003}),
(f4:Filme{titulo:'Cidade de Deus', ano:2002}),
(f5:Filme{titulo:'Tropa de Elite', ano:2007})

CREATE(pr1:Produtora{nome:'Globo Filmes'}),(pr2:Produtora{nome:'Video Filmes'})
CREATE(au1:Autor{nome:'Ariano Suassuna'}),(au2:Autor{nome:'Drauzio Varella'})

CREATE(f1)-[:lancamento]->(pr1)
CREATE(f5)-[:lancamento]->(pr1)
CREATE(f2)-[:lancamento]->(pr2)
CREATE(f1)-[:adaptacao_de{livro:'O Auto da Compadecida'}]->(au1)
CREATE(f3)-[:adaptacao_de{livro:'Estação Carandiru'}]->(au2)

CREATE(a1:Artista{nome:'Matheus Nachtergaele'}),(a2:Artista{nome:'Selton Melo'}),
(a3:Artista{nome:'Fernanda Montenegro'}),(a4:Artista{nome:'Virgínia Cavendish'}),
(a5:Artista{nome:'Denise Fraga'}),(a6:Artista{nome:'Vinícius de Oliveira'}),
(a7:Artista{nome:'Marília Pêra'}),(a8:Artista{nome:'Gero Camilo'}),
(a9:Artista{nome:'Rodrigo Santoro'}),(a10:Artista{nome:'Maria Luísa Mendonça'}),
(a11:Artista{nome:'Alice Braga'}),(a12:Artista{nome:'Leandro Firmino'}),
(a13:Artista{nome:'Douglas Silva'}),(a14:Artista{nome:'Seu Jorge'})

CREATE(a1)-[:participa{funcao:'ator'}]->(f1)
CREATE(a2)-[:participa{funcao:'ator'}]->(f1)
CREATE(a3)-[:participa{funcao:'ator'}]->(f1)
CREATE(a4)-[:participa{funcao:'ator'}]->(f1)
CREATE(a5)-[:participa{funcao:'ator'}]->(f1)
CREATE(a3)-[:participa{funcao:'ator'}]->(f2)
CREATE(a6)-[:participa{funcao:'ator'}]->(f2)
CREATE(a7)-[:participa{funcao:'ator'}]->(f2)
CREATE(a8)-[:participa{funcao:'ator'}]->(f3)
CREATE(a9)-[:participa{funcao:'ator'}]->(f3)
CREATE(a10)-[:participa{funcao:'ator'}]->(f3)
CREATE(a11)-[:participa{funcao:'ator'}]->(f4)
CREATE(a12)-[:participa{funcao:'ator'}]->(f4)
CREATE(a13)-[:participa{funcao:'ator'}]->(f4)
CREATE(a14)-[:participa{funcao:'ator'}]->(f4)

CREATE(p1:Artista{nome:'José Padilha'}),(p2:Artista{nome:'Fernando Meirelles'}),
(p3:Artista{nome:'Héctor Babenco'}),(p4:Artista{nome:'Walter Salles'}),
(p5:Artista{nome:'João Emanuel Carneiro'}),(p6:Artista{nome:'Guel Arraes'}),
(p7:Artista{nome:'João Falcão'}),(p8:Artista{nome:'Bráulio Mantovani'})

CREATE(p1)-[:participa{funcao:'diretor'}]->(f5)
CREATE(p6)-[:participa{funcao:'diretor'}]->(f1)
CREATE(p4)-[:participa{funcao:'diretor'}]->(f2)
CREATE(p3)-[:participa{funcao:'diretor'}]->(f3)
CREATE(p2)-[:participa{funcao:'diretor'}]->(f4)

CREATE(p6)-[:participa{funcao:'roteirista'}]->(f1)
CREATE(p7)-[:participa{funcao:'roteirista'}]->(f1)
CREATE(p5)-[:participa{funcao:'roteirista'}]->(f2)
CREATE(p8)-[:participa{funcao:'roteirista'}]->(f4)


//Consultas a serem resolvidas:
//1) Trazer os nomes dos filmes e os anos em que eles foram lançados ordenados pelo ano.
//2) Quais os nomes dos filmes cujo sobrenome do diretor termina com S e o filme foi lançado no ano 2000? (utilizar o comando ENDS WITH)
//3) Apagar a informação de localização da filmagem do filme dirigido por Walter Salles.
//4) Quais os nomes dos filmes que foram adaptados de algum texto anterior ao roteiro?
//5) Quais os filmes lançados pela Globo Filmes?
//6) Incluir o elenco do filme 'Tropa de Elite' com os seguintes atores: Wagner Moura, André Ramiro, Maria Ribeiro. Lembre de obedecer o modelo dos demais nós e relacionamentos.
//7) De quantos filmes Fernanda Montenegro participou? (utilizar o comando COUNT)
//8) Quais os filmes que foram lançados por alguma produtora?


//1) Trazer os nomes dos filmes e os anos em que eles foram lançados ordenados pelo ano.
MATCH (f:Filme) RETURN f.titulo, f.ano ORDER BY f.ano ASC // desc para ordem decrescente

//2) Quais os nomes dos filmes cujo sobrenome do diretor termina com S e o filme foi lançado no ano 2000? (utilizar o comando ENDS WITH)
MATCH (f:Filme)<-[part:participa{funcao:'diretor'}]-(a:Artista) WHERE f.ano = 2000 AND a.nome ENDS WITH 's' RETURN f.titulo

//3) Apagar a informação de localização da filmagem do filme dirigido por Walter Salles.
MATCH (f:Filme)<-[part:participa{funcao:'diretor'}]-(a:Artista{nome:'Walter Salles'}) SET f.filmado_em = NULL RETURN f

//4) Quais os nomes dos filmes que foram adaptados de algum texto anterior ao roteiro?
MATCH (f:Filme)-[a:adaptacao_de]->(au:Autor) RETURN f.titulo

//5) Quais os filmes lançados pela Globo Filmes?
MATCH (f:Filme)-[l:lancamento]->(p:Produtora{nome:'Globo Filmes'})  RETURN f.titulo

//6) Incluir o elenco do filme 'Tropa de Elite' com os seguintes atores: Wagner Moura, André Ramiro, Maria Ribeiro. Lembre de obedecer o modelo dos demais nós e relacionamentos.
MATCH (f:Filme) WHERE f.titulo = 'Tropa de Elite'
CREATE (a1:Artista{nome:'Wagner Moura'}),
 (a2:Artista{nome:'André Ramiro'}),
 (a3:Artista{nome:'Maria Ribeiro'})
 CREATE (a1)-[:participa{funcao:'ator'}]->(f),
        (a2)-[:participa{funcao:'ator'}]->(f),
        (a3)-[:participa{funcao:'ator'}]->(f) RETURN  f

//7) De quantos filmes Fernanda Montenegro participou? (utilizar o comando COUNT)
MATCH (f:Filme)<-[part:participa]-(a:Artista) WHERE a.nome = 'Fernanda Montenegro' RETURN COUNT(f)

//8) Quais os filmes que foram lançados por alguma produtora?
MATCH (f:Filme)-[l:lancamento]->(p:Produtora) RETURN f.titulo

