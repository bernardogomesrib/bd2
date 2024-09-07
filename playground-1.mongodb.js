// Bernardo José Gomes Ribeiro e Ian Lucas Almeida

db.createCollection('faculdades')

// MongoDB Playground

db.createCollection('faculdades');
// MongoDB Playground

db.createCollection('faculdades');
// MongoDB Playground

db.createCollection('faculdades');

// Definindo os _id dos livros e dos tombos de forma consistente
const idLivroJava = ObjectId();
const idLivroPython = ObjectId();
const idLivroJavaScript = ObjectId();
const idLivroHistoria = ObjectId();
const idLivroSobotta = ObjectId();

// Definindo os _id dos tombos
const idTomboJava1 = ObjectId();
const idTomboJava2 = ObjectId();
const idTomboPython1 = ObjectId();
const idTomboPython2 = ObjectId();
const idTomboJavaScript1 = ObjectId();
const idTomboJavaScript2 = ObjectId();
const idTomboHistoria1 = ObjectId();
const idTomboHistoria2 = ObjectId();
const idTomboSobotta1 = ObjectId();
const idTomboSobotta2 = ObjectId();

db.faculdades.insertMany([
    {
        nome: 'Fatec',
        cidade: 'São Paulo',
        cursos: ['Análise e Desenvolvimento de Sistemas', 'Gestão Empresarial', 'Logística', 'Redes de Computadores','Engenharia de alimentos'],
        biblioteca: {
            _id: ObjectId(),
            nome: 'Fatec',
            livros: [
                {
                    _id: idLivroJava,
                    nome: 'Java',
                    autor: 'Deitel',
                    isbn: '978-77-352-2707-6',
                    tombos: [
                        {
                            _id: idTomboJava1,
                            disponivel: true
                        },
                        {
                            _id: idTomboJava2,
                            disponivel: true
                        }
                    ]
                },
                {
                    _id: idLivroPython,
                    nome: 'Python',
                    autor: 'Deitel',
                    isbn: '948-85-352-2707-6',
                    tombos: [
                        {
                            _id: idTomboPython1,
                            disponivel: true
                        },
                        {
                            _id: idTomboPython2,
                            disponivel: false,
                            aluno: {
                                _id: ObjectId(),
                                nome: 'Maria',
                                email: 'maria@aluno.fatec.edu.br',
                                curso: 'Gestão Empresarial',
                                dataIngresso: new Date('2021-01-01')
                            },
                            dataEmprestimo: new Date('2021-10-05')
                        }
                    ]
                },
                {
                    _id: idLivroJavaScript,
                    nome: 'JavaScript',
                    autor: 'Deitel',
                    isbn: '978-85-352-2707-6',
                    tombos: [
                        {
                            _id: idTomboJavaScript1,
                            disponivel: true
                        },
                        {
                            _id: idTomboJavaScript2,
                            disponivel: false,
                            aluno: {
                                _id: ObjectId(),
                                nome: 'José',
                                email: 'jose@aluno.fatec.edu.br',
                                curso: 'Logística',
                                dataIngresso: new Date('2021-01-01')
                            },
                            dataEmprestimo: new Date('2021-10-05')
                        }
                    ]
                }
            ]
        },
        alunos: [
            {
                _id: ObjectId(),
                nome: 'João',
                email: 'jao@aluno.fatec.edu.br',
                curso: 'Análise e Desenvolvimento de Sistemas',
                dataIngresso: new Date('2021-01-01'),
                historicoNaBiblioteca: [
                    {
                        _id: ObjectId(),
                        idLivro: idLivroJava,
                        idTombo: idTomboJava1,
                        dataEmprestimo: new Date('2021-10-05'),
                        dataDevolucao: new Date('2021-10-15'),
                        devolvido: false
                    }
                ]
            },
            {
                _id: ObjectId(),
                nome: 'Maria',
                email: 'maria@aluno.fatec.edu.br',
                curso: 'Gestão Empresarial',
                dataIngresso: new Date('2021-01-01'),
                historicoNaBiblioteca: [
                    {
                        _id: ObjectId(),
                        idLivro: idLivroPython,
                        idTombo: idTomboPython2,
                        dataEmprestimo: new Date('2021-10-05'),
                        dataDevolucao: new Date('2021-10-15'),
                        devolvido: false
                    }
                ]
            },
            {
                _id: ObjectId(),
                nome: 'José',
                email: 'jose@aluno.fatec.edu.br',
                curso: 'Logística',
                dataIngresso: new Date('2021-01-01'),
                historicoNaBiblioteca: [
                    {
                        _id: ObjectId(),
                        idLivro: idLivroJavaScript,
                        idTombo: idTomboJavaScript2,
                        dataEmprestimo: new Date('2021-10-05'),
                        dataDevolucao: new Date('2021-10-15'),
                        devolvido: false
                    }
                ]
            },
            {
                _id: ObjectId(),
                nome: 'Carlos',
                email: 'carlos@aluno.fatec.edu.br',
                curso: 'Redes de Computadores',
                dataIngresso: new Date('2021-01-01'),
                historicoNaBiblioteca: [
                    {
                        _id: ObjectId(),
                        idLivro: idLivroJava,
                        idTombo: idTomboJava1,
                        dataEmprestimo: new Date('2021-09-01'),
                        dataDevolucao: new Date('2021-09-15'),
                        devolvido: true
                    },
                    {
                        _id: ObjectId(),
                        idLivro: idLivroPython,
                        idTombo: idTomboPython1,
                        dataEmprestimo: new Date('2021-09-20'),
                        dataDevolucao: new Date('2021-10-05'),
                        devolvido: true
                    },
                    {
                        _id: ObjectId(),
                        idLivro: idLivroJavaScript,
                        idTombo: idTomboJavaScript1,
                        dataEmprestimo: new Date('2021-10-10'),
                        dataDevolucao: null, // Empréstimo atual
                        devolvido: false
                    }
                ]
            }
        ]
    },
    {
        nome: 'USP',
        cidade: 'São Paulo',
        cursos: ['Engenharia de Computação', 'Engenharia de Produção', 'Engenharia Elétrica'],
        biblioteca: {
            _id: ObjectId(),
            nome: 'Biblioteca escritor famoso',
            livros: [
                {
                    _id: idLivroHistoria,
                    nome: 'História em Curso - Vol Único',
                    autor: 'Nelson Piletti',
                    isbn: '978-85-16-07005-3',
                    tombos: [
                        {
                            _id: idTomboHistoria1,
                            disponivel: true
                        },
                        {
                            _id: idTomboHistoria2,
                            disponivel: false,
                            aluno: {
                                _id: ObjectId(),
                                nome: 'Ana',
                                email: 'ana@usp.edu.br',
                                curso: 'Engenharia de Produção',
                                dataIngresso: new Date('2021-01-01')
                            }
                        }
                    ]
                }
            ]
        },
        alunos: [
            {
                _id: ObjectId(),
                nome: 'Carlos',
                email: 'carlos@usp.edu.br',
                curso: 'Engenharia de Computação',
                dataIngresso: new Date('2021-01-01'),
                historicoNaBiblioteca: [
                    {
                        _id: ObjectId(),
                        idLivro: idLivroHistoria,
                        idTombo: idTomboHistoria1,
                        dataEmprestimo: new Date('2021-09-05'),
                        dataDevolucao: new Date('2021-09-15'),
                        devolvido: false
                    }
                ]
            },
            {
                _id: ObjectId(),
                nome: 'Ana',
                email: 'ana@usp.edu.br',
                curso: 'Engenharia de Produção',
                dataIngresso: new Date('2021-01-01'),
                historicoNaBiblioteca: [
                    {
                        _id: ObjectId(),
                        idLivro: idLivroHistoria,
                        idTombo: idTomboHistoria2,
                        dataEmprestimo: new Date('2021-09-05'),
                        dataDevolucao: new Date('2021-09-15'),
                        devolvido: true
                    }
                ]
            }
        ]
    },
    {
        nome: 'Unicamp',
        cidade: 'Campinas',
        cursos: ['Engenharia de Computação', 'Engenharia de Produção', 'Engenharia Elétrica'],
        biblioteca: {
            _id: ObjectId(),
            nome: 'Unicamp Biblioteca',
            livros: [
                {
                    _id: idLivroSobotta,
                    nome: 'SOBOTTA - Atlas de Anatomia Humana',
                    autor: 'Sobotta',
                    isbn: '778-77-352-2707-6',
                    tombos: [
                        {
                            _id: idTomboSobotta1,
                            disponivel: true
                        },
                        {
                            _id: idTomboSobotta2,
                            disponivel: false,
                            aluno: {
                                _id: ObjectId(),
                                nome: 'Lucas',
                                email: 'lucas@unicamp.edu.br',
                                curso: 'Engenharia de Computação',
                                dataIngresso: new Date('2021-01-01')
                            }
                        }
                    ]
                }
            ]
        },
        alunos: [
            {
                _id: ObjectId(),
                nome: 'Lucas',
                email: 'lucas@unicamp.edu.br',
                curso: 'Engenharia de Computação',
                dataIngresso: new Date('2021-01-01'),
                historicoNaBiblioteca: [
                    {
                        _id: ObjectId(),
                        idLivro: idLivroSobotta,
                        idTombo: idTomboSobotta2,
                        dataEmprestimo: new Date('2021-09-05'),
                        dataDevolucao: new Date('2021-09-15'),
                        devolvido: false
                    }
                ]
            }
        ]
    }
]);



/* Realizar um CRUD geral no banco de dados, com as seguintes operações: */
//Cadastro de faculdades entradas com insertOne e insertMany()
db.faculdades.insert({
    _id: ObjectId(),
    nome: 'NAP',
    cidade: 'Bahia',
    cursos: ['Análise de sono pesado', 'Gestão de Sono', 'Logística da soneca', 'Redes de dormir'],
    biblioteca: {
        _id: ObjectId(),
        nome: 'Bibliotéca NAP',
        livros: [
            {
                _id: ObjectId(),
                nome: 'Como dormir como um bebê',
                autor: 'Davi Belos Sonhos',
                isbn: '777-77-777-7777-7',
                tombos: [
                    {
                        _id: ObjectId(),
                        disponivel: true
                    },
                    {
                        _id: ObjectId(),
                        disponivel: true
                    },
                    {
                        _id: ObjectId(),
                        disponivel:true
                    },
                    {
                        _id: ObjectId(),
                        disponivel:true
                    },
                    {
                        _id: ObjectId(),
                        disponivel:true
                    }
                ]
            }
        ]
    }
});
//checando a faculdade
db.faculdades.find({nome: 'NAP'});
// insert many
db.faculdades.insertMany([
    {
        nome: 'UVA',
        cidade: 'Recife',
        cursos: ['Medicina', 'Engenharia de civil', 'Administração'],
    },
    {
        nome: 'UFPE',
        cidade: 'Recife',
        cursos: ['Análise e desenvolvimento de Sistemas', 'Biologia', 'Quimica'],
    },
    {
        nome:"FAFREEFIRE",
        cidade:"Olinda",
        cursos:["Jogos","Desenvolvimento de jogos","Jogos online"]
    }
]);

//Atualizando alguns valores no documento com updateOne,updateMany e replaceOne

db.faculdades.find({nome: 'Fatec'});

db.faculdades.updateOne(
    { nome: 'Fatec' },
    {
        $set: {
            cidade: 'Jaboatão'
        }
    }
);
// update many
db.faculdades.find({cidade: 'Recife'});
db.faculdades.updateMany(
    { cidade: 'Recife' },
    {
        $set: {
            cidade: 'Olinda'
        }
    }
);
// replace one
db.faculdades.replaceOne(
    { nome: 'UVA' },
    {
        nome: 'UNINASSAU',
        cidade: 'Olinda',
        cursos: ['Medicina', 'Engenharia de civil', 'Administração', 'Engenharia de produção'],
    }
);
db.faculdades.find({nome: 'UVA'});
db.faculdades.find({nome: 'UNINASSAU'});

//Deletando algo baseado em alguma condição(deleteOne( ) e deleteMany( ))
db.faculdades.deleteOne({ nome: 'UNINASSAU' });
// delete many
db.faculdades.deleteMany({ cidade: 'Olinda' });
//Selecionando dados (Find( ))
db.faculdades.find();

//Manipulando dados no array de tombos fazendo::atualização, inclusão e deleção
//selecionando os tombos do livro "Como dormir como um bebê" da NAP
db.faculdades.find({nome: 'NAP',cidade: 'Bahia'},{'biblioteca.livros.nome':1,'biblioteca.livros.tombos': 1});
//atualizando o campo disponível do primeiro tombo do livro "Como dormir como um bebê" da NAP
db.faculdades.updateOne({nome: 'NAP',cidade: 'Bahia'},{$set:{'biblioteca.livros.0.tombos.0.disponivel': false, }});
// inclusão de um novo tombo para a mesma NAP
//antes quero contar a quantidade de tombos do livro "Como dormir como um bebê" da NAP
db.faculdades.aggregate([{$unwind: "$biblioteca.livros"},{$match: { "biblioteca.livros.nome": "Como dormir como um bebê" }},{$match:{"nome":"NAP"}},{$project: {quantidadeTombos: { $size: "$biblioteca.livros.tombos" }}}]);
//ADICIONANDO UM NOVO TOMBO
db.faculdades.updateOne({nome: 'NAP',cidade: 'Bahia'},{$push:{'biblioteca.livros.0.tombos': { _id: ObjectId(), disponivel: true }}});
// deleção de um tombo
db.faculdades.updateOne({ "nome": "NAP", "biblioteca.livros.nome": "Como dormir como um bebê" }, { $unset: { "biblioteca.livros.$.tombos.0": 1 }});
//fazendo seleções de dados usando projeções simples, de array e subobjetos.
//selecionando apenas os nomes dos alunos de faculdades com nome "Fatec"
db.faculdades.find({ "nome": "Fatec" },{ "alunos.nome": 1,_id: 0 });
//fazendo filtros em dados de diferentes tipos
//comparando tipos simples em uma seleção (números, textos, datas...),
//selecionando o aluno que entrou em uma data que seja posterior a 2021-01-01
db.faculdades.find({ 'alunos.dataIngresso': { $gt: new Date('2020-12-31T23:59:59Z') } },{"alunos.nome":1,"alunos.dataIngresso":1,_id:0});
//Pesquisando em sub-objetos e também em arrays
//selecionando os alunos que estão com livros emprestados
db.faculdades.find({ 'alunos.historicoNaBiblioteca.devolvido': false },{"alunos.nome":1,"alunos.historicoNaBiblioteca":1,_id:0});
//fazendo uma busca de um aluno com uma data de ingresso que seja maior que 2021-01-01, que tenha entrado antes de 2021-10-01 e que tenha mais de um livro no histórico
db.faculdades.find({"alunos.dataIngresso": { $gte: new Date("2021-01-01T00:00:00Z"), $lte: new Date("2021-10-01T00:00:00Z") },$expr: { $gt: [ { $size: "$alunos.historicoNaBiblioteca" }, 1 ] }},{"alunos.nome": 1,"alunos.historicoNaBiblioteca": 1,"_id": 0});

//fazendo uma busca Equivalente ao LIKE de SQL

/* Ao resultado, aplicar: ordenação, LIMIT e SKIP, operadores de agregação, DISTINCT */
//selecionando as faculdades que tem cursos de engenharia mas pulando as duas primeiras
db.faculdades.find({ cursos:/Engenharia/ },{nome:1,cidade:1,_id:0}).skip(2)
//selecionando os cursos de todas as faculdades
db.faculdades.distinct('cursos');

//aluno com maior quantidade de livros emprestados
db.faculdades.aggregate([
{ $unwind: '$alunos' },
{ $project: { nome: '$alunos.nome', quantidadeLivros: { $size: '$alunos.historicoNaBiblioteca' } } },
{ $sort: { quantidadeLivros: -1 } },
{ $limit: 1 }
]);
