db.createCollection('Filmes')
db.Filmes.insertMany([
{titulo:'O Auto da Compadecida',
  lancamento:{ano:2000,obs:'serie de tv adaptada',producao:'Globo Filmes'},
  diretor:'Guel Arraes',
  autor:'Ariano Suassuna',
  baseado_em:'O Auto da Compadecida de Ariano Suassuna',
  elenco: ['Matheus Nachtergaele','Selton Melo','Virgínia Cavendish','Denise Fraga','Fernanda Montenegro'],
  roteiro: ['Guel Arraes', 'João Falcão']
}
,
{titulo:'Central do Brasil',
  lancamento:{ano:1998,producao:'Video Filmes'},
  diretor:'Walter Salles',
  roteiro: 'João Emanuel Carneiro',
  filmado_em:'Rio de Janeiro',
  elenco: ['Vinícius de Oliveira','Fernanda Montenegro','Marília Pêra']
},
{titulo:'Carandiru: O Filme',
  lancamento:{ano:2003},
  diretor:'Héctor Babenco',
  baseado_em: 'Estação Carandiru de Drauzio Varella',
  elenco: ['Rodrigo Santoro','Maria Luísa Mendonça','Gero Camilo']
},
{titulo:'Cidade de Deus',
  lancamento:{ano:2002},
  diretor:'Fernando Meirelles',
  roteiro: 'Bráulio Mantovani',
  elenco: ['Alice Braga','Leandro Firmino','Douglas Silva','Seu Jorge']
},
{titulo:'Tropa de Elite',
  lancamento:{ano:2007,producao:'Globo Filmes'},
  diretor:'José Padilha'
}
])


/* 
1. Inserir o filme Tropa de Elite, que foi lançado em 2007 e produzido pela Globo Filmes, cujo diretor foi José Padilha
2. Apagar a informação de localização da filmagem do filme dirigido por Walter Salles.
3. Trazer apenas os nomes dos filmes ordenados pelo ano de lançamento.
4. Quantos filmes que Fernanda Montenegro participou?
5. Quais os nomes dos filmes cujo sobrenome do diretor termina com S e o filme foi lançado nos anos 2000?
6. Quais os nomes dos filmes que foram baseados em algum texto anterior ao roteiro?
7. Quais os nomes e os anos de lançamentos dos filmes produzidos pela Globo Filmes?
8. Incluir o elenco do filme 'Tropa de Elite' com os seguintes atores: Wagner Moura, André Ramiro, Maria Ribeiro. Lembre-se de obedecer o modelo dos demais documentos. */

// 1. Inserir o filme Tropa de Elite, que foi lançado em 2007 e produzido pela Globo Filmes, cujo diretor foi José Padilha
db.Filmes.insertOne({titulo:'Tropa de Elite',
  lancamento:{ano:2007,producao:'Globo Filmes'},
  diretor:'José Padilha'
})

// 2. Apagar a informação de localização da filmagem do filme dirigido por Walter Salles.
db.Filmes.updateOne({diretor:'Walter Salles'},{$unset:{filmado_em:''}})

// 3. Trazer apenas os nomes dos filmes ordenados pelo ano de lançamento.
db.Filmes.find({},{_id:0,titulo:1,lancamento:1}).sort({'lancamento.ano':1}) // cendente
db.Filmes.find({},{_id:0,titulo:1,lancamento:1}).sort({'lancamento.ano':-1}) // descendente

// 4. Quantos filmes que Fernanda Montenegro participou?
db.Filmes.find({elenco:'Fernanda Montenegro'}).count()

// 5. Quais os nomes dos filmes cujo sobrenome do diretor termina com S e o filme foi lançado nos anos 2000?
db.Filmes.find({diretor:/s$/,'lancamento.ano':{$gte:2000,$lte:2009}},{_id:0,titulo:1})

// 6. Quais os nomes dos filmes que foram baseados em algum texto anterior ao roteiro?
db.Filmes.find({baseado_em:{$exists:true}},{_id:0,titulo:1})

// 7. Quais os nomes e os anos de lançamentos dos filmes produzidos pela Globo Filmes?
db.Filmes.find({'lancamento.producao':'Globo Filmes'},{_id:0,titulo:1,'lancamento.ano':1})

// 8. Incluir o elenco do filme 'Tropa de Elite' com os seguintes atores: Wagner Moura, André Ramiro, Maria Ribeiro. Lembre-se de obedecer o modelo dos demais documentos.
db.Filmes.updateOne({titulo:'Tropa de Elite'},{$set:{elenco:['Wagner Moura','André Ramiro','Maria Ribeiro']}})