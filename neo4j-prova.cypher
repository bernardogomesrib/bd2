//Os comandos devem ser elaboradas considerando a base de dados criada pelo script abaixo.
//Se preferir, copie e cole para um ambiente que acesse o Neo4J
//(como o Neo4J Desktop (instalado no seu computador) ou Neo4J Sandbox (online)),
//escreva suas consultas e as transcreva para o formulário posteriormente.

CREATE (h1:hobby{nome:'leitura'})
CREATE (h2:hobby{nome:'natação'})
CREATE (h3:hobby{nome:'celular'})
CREATE (h4:hobby{nome:'academia'})
CREATE (h5:hobby{nome:'volei'})
CREATE (h6:hobby{nome:'computador'})
CREATE (h7:hobby{nome:'futebol'})
CREATE (h8:hobby{nome:'FIFA'})
CREATE (h9:hobby{nome:'estudar'})
CREATE (h10:hobby{nome:'corrida'})
CREATE (h11:hobby{nome:'Netflix'})
CREATE (h12:hobby{nome:'dormir'})

CREATE (d1:Disciplina{materia:'matematica'})
CREATE (d2:Disciplina{materia:'portugues'})
CREATE (d3:Disciplina{materia:'fisica'})
CREATE (d4:Disciplina{materia:'ingles'})

CREATE (a1:Aluno{nome:'Marta Medeiros', idade:15,moracompais:True,sexo:'feminino',endereco: 'Rua não sei onde, 762. Logo ali.'})
CREATE (r1:Responsavel{nome: 'Vasco Vaz', telefone: '98275123'})
create (a1)-[:cursa{nota:9.7}]->(d1)
create (a1)-[:cursa{nota:8.4}]->(d2)
create (a1)-[:cursa{nota:9.3}]->(d3)
create (a1)-[:cursa{nota:6.9}]->(d4)
create (a1)-[:curte]->(h1)
create (a1)-[:curte]->(h2)
create (a1)-[:curte]->(h3)
create (a1)-[:tem{grau_parentesco: 'tio'}]->(r1)

CREATE (a2:Aluno{nome:'Carolina Torres',idade:14,moracompais:False,sexo:'feminino',endereco:'Rua longe, 9182. Lá acolá.'})
CREATE (r2:Responsavel{nome: 'Valentina Medeitos', telefone: '918201821'})
create (a2)-[:cursa{nota:6.7}]->(d1)
create (a2)-[:cursa{nota:9.6}]->(d2)
create (a2)-[:cursa{nota:9}]->(d3)
create (a2)-[:cursa{nota:8.3}]->(d4)
create (a2)-[:curte]->(h3)
create (a2)-[:curte]->(h4)
create (a2)-[:curte]->(h5)
create (a2)-[:tem{grau_parentesco: 'avó'}]->(r2)

CREATE (a3:Aluno{nome:'Mariana Torres',idade:15,moracompais:False,sexo:'feminino',endereco:'Rua longe, 9182. Lá acolá.'})
create (a3)-[:cursa{nota:9.6}]->(d1)
create (a3)-[:cursa{nota:5.9}]->(d2)
create (a3)-[:cursa{nota:8.1}]->(d3)
create (a3)-[:cursa{nota:7.9}]->(d4)
create (a3)-[:curte]->(h6)
create (a3)-[:tem{grau_parentesco: 'avó'}]->(r2)

CREATE (a4:Aluno{nome:'Lucas Mauro',idade:16,moracompais:True,sexo:'masculino',endereco:'Rua longe, 8172. Lá acolá.'})
CREATE (r4:Responsavel{nome: 'Arthur Bezerra', telefone: '91827134'})
create (a4)-[:cursa{nota:4.9}]->(d1)
create (a4)-[:cursa{nota:3}]->(d2)
create (a4)-[:cursa{nota:4.1}]->(d3)
create (a4)-[:cursa{nota:10}]->(d4)
create (a4)-[:curte]->(h7)
create (a4)-[:curte]->(h8)
create (a4)-[:tem{grau_parentesco: 'pai'}]->(r4)

CREATE (a5:Aluno{nome:'Heitor Vaz',idade:15,moracompais:True,sexo:'masculino',endereco:'Rua aqui do lado, 12. Aqui.'})
create (a5)-[:cursa{nota:9.9}]->(d1)
create (a5)-[:cursa{nota:9.6}]->(d2)
create (a5)-[:cursa{nota:8.4}]->(d3)
create (a5)-[:cursa{nota:8.9}]->(d4)
create (a5)-[:curte]->(h1)
create (a5)-[:curte]->(h9)
create (a5)-[:curte]->(h10)
create (a5)-[:curte]->(h11)
create (a5)-[:tem{grau_parentesco: 'pai'}]->(r1)

CREATE (a6:Aluno{nome:'Fabiana Vaz',idade:16,moracompais:False,sexo:'feminino',endereco:'Rua aqui do lado, 12. Aqui.'})
create (a6)-[:cursa{nota:10}]->(d1)
create (a6)-[:cursa{nota:10}]->(d2)
create (a6)-[:cursa{nota:10}]->(d3)
create (a6)-[:cursa{nota:10}]->(d4)
create (a6)-[:curte]->(h1)
create (a6)-[:curte]->(h9)
create (a6)-[:curte]->(h12)
create (a6)-[:tem{grau_parentesco: 'pai'}]->(r1)

//Quais os nomes dos alunos cujo pai é o responsável oficialmente? Apresentar o nome do aluno, nome e o telefone do responsável
MATCH (a:Aluno)-[t:tem{grau_parentesco:'pai'}]->(r:Responsavel) RETURN a.nome, r.nome, r.telefone, t.grau_parentesco

//Quantas alunas tem a leitura como um hobby?

MATCH (a:Aluno)-[:curte]->(h:hobby{nome:'leitura'}) RETURN count(a)

//Incluir a disciplina Geografia e colocar todos os alunos para cursarem essa disciplina inicializando a nota de cada um com 0.

create(dis:Disciplina{materia:'geografia'}) with dis
match (a:Aluno)
create (a)-[:cursa{nota:0}]->(dis)


//Qual a média das notas por matéria?

MATCH (a:Aluno)-[c:cursa]->(d:Disciplina) RETURN d.materia, avg(c.nota)

//A aluna Carolina Torres fez aniversário e agora mora com os pais,
//além disso realizou recuperação e conseguiu aumentar sua nota para 9 em matemática.
//Atualize os dados da aluna.
match (a:Aluno{nome:'Carolina Torres'})-[c:cursa]->(d:Disciplina{materia:'matematica'}) RETURN a.nome, c.nota, d.materia

match (a:Aluno{nome:'Carolina Torres'})-[c:cursa]->(d:Disciplina{materia:'matematica'})
set a.idade=15, a.moracompais=True set c.nota=9 RETURN a.nome,a.idade,a.moracompais, c.nota, d.materia

