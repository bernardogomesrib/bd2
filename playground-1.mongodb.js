/* global use, db */
// MongoDB Playground
// Use Ctrl+Space inside a snippet or a string literal to trigger completions.

const database = 'admin';


// The current database to use.
use(database);

db.createCollection('faculdades')



db.faculdades.insertMany([
    {
        nome: 'Fatec',
        cidade: 'São Paulo',
        cursos: ['Análise e Desenvolvimento de Sistemas', 'Gestão Empresarial', 'Logística', 'Redes de Computadores'],
        biblioteca:{
            _id: ObjectId(),
            nome: 'Fatec',
            livros: [
                {
                    _id: ObjectId(),
                    nome: 'Java',
                    autor: 'Deitel',
                    isbn: '978-77-352-2707-6',
                    tombos:[
                        {
                            _id: ObjectId(),
                            disponivel: true
                        },
                        {
                            _id: ObjectId(),
                            disponivel: true,
                        }
                    ]
                },
                {
                    _id: ObjectId(),
                    nome: 'Python',
                    autor: 'Deitel',
                    isbn: '948-85-352-2707-6',
                    tombos:[
                        {
                            _id: 1,
                            disponivel: true
                        },
                        {
                            _id: 2,
                            disponivel: false,
                            idAluno: 2,
                            dataEmprestimo: new Date('2021-10-05')
                        }
                    ]
                },
                {
                    _id: ObjectId(),
                    nome: 'JavaScript',
                    autor: 'Deitel',
                    isbn: '978-85-352-2707-6',
                    tombos:[
                        {
                            _id: ObjectId(),
                            disponivel: true
                        },
                        {
                            _id: 3,
                            disponivel: false,
                            idAluno: 3,
                            dataEmprestimo: new Date('2021-10-05')
                        }
                    ]
                }
            ]
        },
        alunos:[
            {
                _id: 1,
                nome: 'João',
                email: 'jao@aluno.fatec.edu.br',
                curso: 'Análise e Desenvolvimento de Sistemas',
                dataIngresso: new Date('2021-01-01'),
                historicoNaBiblioteca:[
                    {
                        _id: ObjectId(),
                        idLivro: 1,
                        dataEmprestimo: new Date('2021-10-05'),
                        dataDevolucao: new Date('2021-10-15'),
                        devolvido: false,
                    }
                ]
            },
            {
                _id: 2,
                nome: 'Maria',
                email: 'maria@aluno.fatec.edu.br',
                curso: 'Gestão Empresarial',
                dataIngresso: new Date('2021-01-01'),
                historicoNaBiblioteca:[
                    {
                        _id: ObjectId(),
                        idLivro: 2,
                        dataEmprestimo: new Date('2021-10-05'),
                        dataDevolucao: new Date('2021-10-15'),
                        devolvido: false,
                    }
                ]
            },
            {
                _id: 3,
                nome: 'José',
                email: 'jose@aluno.fatec.edu.br',
                curso: 'Logística',
                dataIngresso: new Date('2021-01-01'),
                historicoNaBiblioteca:[
                    {
                        _id: ObjectId(),
                        idLivro: 3,
                        dataEmprestimo: new Date('2021-10-05'),
                        dataDevolucao: new Date('2021-10-15'),
                        devolvido: false,
                    }
                ]
            },
            {
                _id: 4,
                nome: 'Carlos',
                email: 'carlos@aluno.fatec.edu.br',
                curso: 'Redes de Computadores',
                dataIngresso: new Date('2021-01-01'),
                historicoNaBiblioteca:[
                    {
                        _id: ObjectId(),
                        idLivro: 1,
                        dataEmprestimo: new Date('2021-9-05'),
                        dataDevolucao: new Date('2021-9-15'),
                        devolvido: true,
                    },
                    {
                        _id: ObjectId(),
                        idLivro: 2,
                        dataEmprestimo: new Date('2021-9-05'),
                        dataDevolucao: new Date('2021-9-15'),
                        devolvido: true,
                    },
                    {
                        _id: ObjectId(),
                        idLivro: 3,
                        dataEmprestimo: new Date('2021-9-05'),
                        dataDevolucao: new Date('2021-9-15'),
                        devolvido: true,
                    }
                ]
            }
        ]
    },
    {
        nome: 'USP',
        cidade: 'São Paulo',
        cursos: ['Engenharia de Computação', 'Engenharia de Produção', 'Engenharia Elétrica'],
        biblioteca:{
            _id: ObjectId(),
            nome: 'Bibliotéca escritor famoso',
            livros:[
                {
                    _id:ObjectId(),
                    nome: 'História em Curso - Vol Único',
                    autor: 'Nelson Piletti',
                    isbn: '978-85-16-07005-3',
                    tombos:[
                        {
                            _id: 5,
                            disponivel: true
                        },
                        {
                            _id: 4,
                            disponivel: false,
                            idAluno: 5
                        }
                    ]
                }
            ]
        },
        alunos:[
            {
                _id: 4,
                nome: 'Carlos',
                email: 'carlos@usp.edu.br',
                curso: 'Engenharia de Computação',
                dataIngresso: new Date('2021-01-01'),
                historicoNaBiblioteca:[
                    {
                        _id: ObjectId(),
                        idLivro: 4,
                        dataEmprestimo: new Date('2021-9-05'),
                        dataDevolucao: new Date('2021-9-15'),
                        devolvido: false,
                    }
                ]
            },
            {
                _id: 5,
                nome: 'Ana',
                email: 'ana@usp.edu.br',
                curso: 'Engenharia de Produção',
                dataIngresso: new Date('2021-01-01'),
                historicoNaBiblioteca:[
                    {
                        _id: ObjectId(),
                        idLivro: 5,
                        dataEmprestimo: new Date('2021-9-05'),
                        dataDevolucao: new Date('2021-9-15'),
                        devolvido: true,
                    }
                ]
            },
            {
                _id: 6,
                nome: 'Pedro',
                email: 'pedro@usp.edu.br',
                curso: 'Engenharia Elétrica',
                dataIngresso: new Date('2021-01-01')
            }
        ]
    },
    {
        nome: 'Unicamp',
        cidade: 'Campinas',
        cursos: ['Engenharia de Computação', 'Engenharia de Produção', 'Engenharia Elétrica'],
        biblioteca:{
            _id: ObjectId('id'),
            nome: 'Unicamp Biblioteca',
            livros:[
                {
                    _id:ObjectId(),
                    nome: 'SOBOTTA - Atlas de Anatomia Humana',
                    autor: 'Sobotta',
                    isbn: '778-77-352-2707-6',
                    tombos:[
                        {
                            _id: 44,
                            disponivel: true
                        },
                        {
                            _id: 45,
                            disponivel: false,
                            idAluno: 8
                        }
                    ]
                }
            ],
        },
        alunos:[
            {
                _id: 8,
                nome: 'Lucas',
                email: 'lucas@unicamp.edu.br',
                curso: 'Engenharia de Computação',
                dataIngresso: new Date('2021-01-01'),
                historicoNaBiblioteca:[
                    {
                        _id: ObjectId(),
                        idLivro: 45,
                        dataEmprestimo: new Date('2021-9-05'),
                        dataDevolucao: new Date('2021-9-15'),
                        devolvido: false,
                    }
                ]
            }
        ]
    },
])