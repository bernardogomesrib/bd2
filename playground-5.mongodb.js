//Os comandos devem ser elaboradas considerando a base de dados criada pelo script abaixo. 
//Se preferir, copie e cole para um ambiente que acesse o MongoDB 
//(como o Robo3T, disponível em https://robomongo.org/), 
//escreva suas consultas e as transcreva para o formulário posteriormente.

db.createCollection('turma')
db.turma.insertMany(
[{
    nome: 'Marta Medeiros',
    idade: 15,
    responsavel: {nome: 'Vasco Vaz', grau_parentesco: 'tio', telefone: '98275123'},
    endereco: 'Rua não sei onde, 762. Logo ali.',
    moracompais: true,
    hobbies: ['leitura', 'natação', 'celular'],
    historico: {matematica:9.7, portugues:8.4, fisica: 9.3, ingles: 6.9},
    sexo: 'feminino'
},
{
    nome: 'Carolina Torres',
    idade: 14,
    sexo: 'feminino',
    endereco: 'Rua longe, 9182. Lá acolá.',
    moracompais: false,
    responsavel: {nome: 'Valentina Medeiros', grau_parentesco: 'avó', telefone: '918201821'},
    hobbies: ['celular', 'academia', 'volei'],
    historico: {matematica:6.7, portugues:9.6, fisica: 9, ingles: 8.3}
},
{
    nome: 'Mariana Torres',
    sexo: 'feminino',
    idade: 15,
    endereco: 'Rua longe, 9182. Lá acolá.',
    moracompais: false,
    responsavel: {nome: 'Valentina Medeiros', grau_parentesco: 'avó', telefone: '918201821'},
    hobbies: ['computador'],
    historico: {matematica:9.6, portugues:5.9, fisica: 8.1, ingles: 7.9}
},
{
    nome: 'Lucas Mauro',
    sexo: 'masculino',
    idade: 16,
    endereco: 'Rua longe, 8172. Lá acolá.',
    moracompais: true,
    responsavel: {nome: 'Arthur Bezerra', grau_parentesco: 'pai', telefone: '91827134'},
    hobbies: ['futebol','FIFA'],
    historico: {matematica:4.9, portugues:3.0, fisica: 4.1, ingles: 10}
},
{
    nome: 'Heitor Vaz',
    sexo: 'masculino',
    idade: 15,
    endereco: 'Rua aqui do lado, 12. Aqui.',
    moracompais: true,
    responsavel: {nome: 'Vasco Vaz', grau_parentesco: 'pai', telefone: '98275123'},
    hobbies: ['leitura','estudar','corrida','Netflix'],
    historico: {matematica:9.9, portugues:9.6, fisica: 8.4, ingles: 8.9}
}
,
{
    nome: 'Fabiana Vaz',
    sexo: 'feminio',
    idade: 16,
    endereco: 'Rua aqui do lado, 12. Aqui.',
    moracompais: false,
    responsavel: {nome: 'Vasco Vaz', grau_parentesco: 'pai', telefone: '98275123'},
    hobbies: ['estudar','dormir','leitura'],
    historico: {matematica:10, portugues:10, fisica: 10, ingles: 10}
}
]
)


//Quantos são os alunos que moram com os pais e tem 15 anos ou mais?
db.turma.find({moracompais: true, idade: {$gte: 15}}).count()

//Quais são os nomes, sexo e idade dos alunos que moram no bairro 'Lá acolá'?
db.turma.find({endereco: /Lá acolá/}, {nome: 1, sexo: 1, idade: 1})

//Quais os nomes, hobbies e histórico dos filhos de 'Vasco Vaz' que moram com os pais?
db.turma.find({'responsavel.nome': 'Vasco Vaz', moracompais: true}, {nome: 1, hobbies: 1, historico: 1})

//A nota da neta de Valentina Medeiros de 15 anos na disciplina portugues foi digitada errada. Deve ser atualizada para 8,9.
db.turma.find({'responsavel.nome':'Valentina Medeiros',idade:15})
db.turma.update({'responsavel.nome':'Valentina Medeiros',idade:15}, {$set: {'historico.portugues': 8.9}})


//O aluno que tem como primeiro hobby estudar, agora também gosta de tênis de mesa.
db.turma.find({'hobbies.0': 'estudar'})
db.turma.updateMany({'hobbies.0': 'estudar'}, {$push: {hobbies: 'tênis de mesa'}})

//Qual o nome e o nome do responsável dos alunos que gostam de leitura e tem nota maior que 9 em português? Não deve aparecer o id.
db.turma.find({hobbies: 'leitura', 'historico.portugues': {$gt: 9}}, {nome: 1, 'responsavel.nome': 1, _id: 0})



db.turma.updateOne({'responsavel.nome':'Valentina Medeiros',idade:15}, {$set: {'historico.portugues': 69}})
