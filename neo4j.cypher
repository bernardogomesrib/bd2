CREATE (:Professor {Nome: 'Eric', Sobrenome: 'Sales', Idade: 33, Formação: 'Sistemas da Informação', Titulo: 'Mestre', isCoordenador: FALSE}),
    (:Professor {Nome: 'Viviane', Sobrenome: 'Aureliano', Idade: 44, Formação: 'Ciênica da Computação', Titulo: 'Doutora', isCoordenador: FALSE}),
    (:Professor {Nome: 'Jacinta', Sobrenome: 'Raposo', Idade: 40, Formação: 'Administração', Titulo: 'Mestre', isCoordenador: TRUE}),
    (:Professor {Nome: 'Carlos', Sobrenome: 'Brasil', Idade: 42, Formação: 'Ciência da Computação', Titulo: 'Mestre', isCoordenador: TRUE}),
    (:Professor {Nome: 'Nilson', Sobrenome: 'Cândido', Idade: 38, Formação: 'Sistema de Informação', Titulo: 'Mestre', isCoordenador: TRUE}),
    (:Professor {Nome: 'Sóstenes', Sobrenome: 'Cruz', Idade: 35, Formação: 'Ciências Contábeis', Titulo: 'Mestre', isCoordenador: TRUE}),
    (:Professor {Nome: 'Djuri', Sobrenome: 'Vieira', Idade: 50, Formação: 'Engenharia de Produção', Titulo: 'Mestre', isCoordenador: TRUE}),
    (:Professor {Nome: 'Natália', Sobrenome: 'Souza', Idade: 31, Formação: 'Administração', Titulo: 'Mestre', isCoordenador: TRUE}),
    (:Professor {Nome: 'Havana', Sobrenome: 'Alves', Idade: 34, Formação: 'Engenharia da Computação', Titulo: 'Mestre', isCoordenador: TRUE});;

MATCH (p:Professor)
WHERE p.Nome = 'Nilson' AND p.Sobrenome = 'Cândido'
CREATE (c:Curso {nome: 'ADS', nivel: 'superior', turno: 'tarde'})
CREATE (c)-[:TEM_COORDENADOR]->(p);

MATCH (p1:Professor)
WHERE p1.Nome = 'Havana' AND p1.Sobrenome = 'Alves'
CREATE (d:Curso {nome: 'MIDS', nivel: 'Integrado', turno: 'manhã'})
CREATE (d)-[:TEM_COORDENADOR]->(p1);

MATCH (p2:Professor)
WHERE p2.Nome = 'Jacinta' AND p2.Sobrenome = 'Raposo'
CREATE (e:Curso {nome: 'TÉCNICO EM ADMINISTRAÇÃO', nivel: 'técnico', turno: 'tarde'})
CREATE (e)-[:TEM_COORDENADOR]->(p2);

MATCH (p3:Professor)
WHERE p3.Nome = 'Natália' AND p3.Sobrenome = 'Souza'
CREATE (f:Curso {nome: 'TÉCNICO EM QUALIDADE', nivel: 'técnico', turno: 'tarde'})
CREATE (f)-[:TEM_COORDENADOR]->(p3);

MATCH (p4:Professor)
WHERE p4.Nome = 'Sóstenes' AND p4.Sobrenome = 'Cruz'
CREATE (g:Curso {nome: 'TÉCNICO EM COMÉCIO', nivel: 'técnico', turno: 'tarde'})
CREATE (g)-[:TEM_COORDENADOR]->(p4);



MATCH (p5:Professor)
WHERE p5.Nome = 'Carlos' AND p5.Sobrenome = 'Brasil'
CREATE (h:Curso {nome: 'INFORMÁTICA PARA INTERNET', nivel: 'técnico', turno: 'tarde'})
CREATE (h)-[:TEM_COORDENADOR]->(p5);

MATCH (p6:Professor)
WHERE p6.Nome = 'Nilson' AND p6.Sobrenome = 'Cândido'
CREATE (i:Curso {nome: 'ADS', nivel: 'superior', turno: 'noite'})
CREATE (i)-[:TEM_COORDENADOR]->(p6);

MATCH (p7:Professor)
WHERE p7.Nome = 'Djuri' AND p7.Sobrenome = 'Vieira'
CREATE (g:Curso {nome: 'TÉCNICO EM COMÉCIO', nivel: 'técnico', turno: 'noite'})
CREATE (g)-[:TEM_COORDENADOR]->(p7);


CREATE (m1:Matéria {nome: 'DESENV. WEB 1', ch: 120, eixo: 'Informática e Comunicação'}),
    (m2:Matéria {nome: 'DESENV. WEB 2', ch: 120, eixo: 'Informática e Comunicação'}),
    (m3:Matéria {nome: 'Projeto e Prática 1', ch: 90, eixo: 'Informática e Comunicação'}),
    (m4:Matéria {nome: 'Projeto e Prática 2', ch: 90, eixo: 'Informática e Comunicação'}),
    (m5:Matéria {nome: 'ENGENHARIA DE SOFTWARE', ch: 60, eixo: 'Informática e Comunicação'}),
    (m6:Matéria {nome: 'LIDERANÇA E TOMADA DE DECISÃO', ch: 45, eixo: 'Gestão e Negócios'}),
    (m7:Matéria {nome: 'GESTÃO DE PROCESSOS', ch: 40, eixo: 'Gestão e Negócios'}),
    (m8:Matéria {nome: 'INTROD. A QUALIDADE', ch: 40, eixo: 'Gestão e Negócios'}),
    (m9:Matéria {nome: 'AUDITORIAS DA QUALIDADE', ch: 40, eixo: 'Gestão e Negócios'});

    
MATCH (c1:Curso {nivel: 'Integrado', turno: 'manhã', nome: 'MIDS'})with m1, c1 limit 1
CREATE (m1)-[:PERTENCE_A]->(c1)
MATCH (p1:Professor {Nome: 'Eric', Sobrenome: 'Sales'}) with m1, p1 limit 1
CREATE (p1)-[:LECIONA]->(m1);
CREATE (m1)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 3', horarioInicial: '07:15', horarioFinal: '08:00', turma: 'B 2° ANO', diaDaSemana: 'quinta'});
CREATE (m1)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 3', horarioInicial: '08:00', horarioFinal: '08:45', turma: 'B 2° ANO', diaDaSemana: 'quinta'});
CREATE (m1)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 3', horarioInicial: '08:45', horarioFinal: '09:45', turma: 'B 2° ANO', diaDaSemana: 'quinta'});
CREATE (m1)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 3', horarioInicial: '10:30', horarioFinal: '11:15', turma: 'A 2° ANO', diaDaSemana: 'quinta'});
CREATE (m1)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 3', horarioInicial: '11:15', horarioFinal: '12:00', turma: 'A 2° ANO', diaDaSemana: 'quinta'});
CREATE (m1)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 3', horarioInicial: '12:00', horarioFinal: '12:45', turma: 'A 2° ANO', diaDaSemana: 'quinta'});
return null;

CREATE (m2:Matéria {nome: 'DESENV. WEB 1', ch: 40, eixo: 'Informática e Comunicação'})
MATCH (c2:Curso {nivel: 'técnico', turno: 'noite', nome: 'INFORMÁTICA PARA INTERNET'})with m2, c2 limit 1
CREATE (m2)-[:PERTENCE_A]->(c2)
MATCH (p2:Professor {Nome: 'Eric', Sobrenome: 'Sales'}) with c2, p2 limit 1
CREATE (p2)-[:LECIONA]->(m2);
CREATE (m2)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 03', horarioInicial: '20:30', horarioFinal: '21:15', turma: '1° periodo', diaDaSemana: 'quarta'});
CREATE (m2)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 03', horarioInicial: '21:15', horarioFinal: '22:00', turma: '1° periodo', diaDaSemana: 'quarta'});
return null;

CREATE (m3:Matéria {nome: 'Projeto e Prática 1', ch: 90, eixo: 'Informática e Comunicação'})
MATCH (c3:Curso {nivel: 'Integrado', turno: 'manhã', nome: 'MIDS'}) with m3, c3 limit 1
CREATE (m3)-[:PERTENCE_A]->(c3)
MATCH (p3:Professor {Nome: 'Viviane', Sobrenome: 'Aureliano'}) with m3, p3 limit 1
CREATE (p3)-[:LECIONA]->(m3);
CREATE (m3)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 02', horarioInicial: '07:15', horarioFinal: '08:00', turma: 'A 1° ANO', diaDaSemana: 'terça'});
CREATE (m3)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 02', horarioInicial: '08:00', horarioFinal: '08:45', turma: 'A 1° ANO', diaDaSemana: 'terça'});
CREATE (m3)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 02', horarioInicial: '08:45', horarioFinal: '09:45', turma: 'A 1° ANO', diaDaSemana: 'terça'});
CREATE (m3)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 02', horarioInicial: '10:30', horarioFinal: '11:15', turma: 'B 1° ANO', diaDaSemana: 'terça'});
CREATE (m3)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 02', horarioInicial: '11:15', horarioFinal: '12:00', turma: 'B 1° ANO', diaDaSemana: 'terça'});
CREATE (m3)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 02', horarioInicial: '12:00', horarioFinal: '12:45', turma: 'B 1° ANO', diaDaSemana: 'terça'});
return null;
CREATE (m4:Matéria {nome: 'ENGENHARIA DE SOFTWARE', ch: 60, eixo: 'Informática e Comunicação'})
MATCH (c4:Curso {nivel: 'técnico', turno: 'noite', nome: 'INFORMÁTICA PARA INTERNET'}) with m4, c4 limit 1
CREATE (m4)-[:PERTENCE_A]->(c4)
MATCH (p4:Professor {Nome: 'Eric', Sobrenome: 'Sales'}) with c4, p4 limit 1
CREATE (p4)-[:LECIONA]->(m4);
CREATE (m4)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 03', horarioInicial: '18:15', horarioFinal: '19:00', turma: '2° periodo', diaDaSemana: 'terça'});
CREATE (m4)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 03', horarioInicial: '19:00', horarioFinal: '19:45', turma: '2° periodo', diaDaSemana: 'terça'});
CREATE (m4)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 03', horarioInicial: '19:45', horarioFinal: '20:30', turma: '2° periodo', diaDaSemana: 'terça'});
CREATE (m4)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 03', horarioInicial: '20:30', horarioFinal: '21:15', turma: '2° periodo', diaDaSemana: 'terça'});
return null;
CREATE (m5:Matéria {nome: 'LIDERANÇA E TOMADA DE DECISÃO', ch: 45, eixo: 'Gestão e Negócios'})
MATCH (c5:Curso {nivel: 'técnico', turno: 'noite', nome: 'TÉCNICO EM COMÉCIO'}) with m5, c5 limit 1
CREATE (m5)-[:PERTENCE_A]->(c5)
MATCH (p5:Professor {Nome: 'Jacinta', Sobrenome: 'Raposo'}) with m5, p5 limit 1
CREATE (p5)-[:LECIONA]->(m5)
CREATE (m5)-[:TEM_HORARIO]->(:Horario {sala: 'SALA 06', horarioInicial: '20:30', horarioFinal: '21:15', turma: '2° periodo', diaDaSemana: 'terça'});
CREATE (m5)-[:TEM_HORARIO]->(:Horario {sala: 'SALA 06', horarioInicial: '21:15', horarioFinal: '22:00', turma: '2° periodo', diaDaSemana: 'terça'});
CREATE (m5)-[:TEM_HORARIO]->(:Horario {sala: 'SALA 06', horarioInicial: '20:30', horarioFinal: '21:15', turma: '3° periodo', diaDaSemana: 'terça'});
CREATE (m5)-[:TEM_HORARIO]->(:Horario {sala: 'SALA 06', horarioInicial: '21:15', horarioFinal: '22:00', turma: '3° periodo', diaDaSemana: 'terça'});
return null;

CREATE (m6:Matéria {nome: 'GESTÃO DE PROCESSOS', ch: 40, eixo: 'Gestão e Negócios'})
MATCH (c6:Curso {nivel: 'técnico', turno: 'tarde', nome: 'TÉCNICO EM ADMINISTRAÇÃO'})with m6, c6 limit 1
CREATE (m6)-[:PERTENCE_A]->(c6)
MATCH (p6:Professor {Nome: 'Jacinta', Sobrenome: 'Raposo'}) with m6, p6 limit 1
CREATE (p6)-[:LECIONA]->(m6);
CREATE (m6)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 04', horarioInicial: '13:30', horarioFinal: '14:15', turma: '1° periodo', diaDaSemana: 'quarta'});
CREATE (m6)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 04', horarioInicial: '14:15', horarioFinal: '15:00', turma: '1° periodo', diaDaSemana: 'quarta'});
return null;

CREATE (m7:Matéria {nome: 'GESTÃO DE PROCESSOS', ch: 40, eixo: 'Gestão e Negócios'})
MATCH (c7:Curso {nivel: 'técnico', turno: 'tarde', nome: 'TÉCNICO EM QUALIDADE'}) with m7, c7 limit 1
CREATE (m7)-[:PERTENCE_A]->(c7)
MATCH (p7:Professor {Nome: 'Jacinta', Sobrenome: 'Raposo'}) with m7, p7 limit 1
CREATE (p7)-[:LECIONA]->(m7);
CREATE (m7)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 04', horarioInicial: '14:15', horarioFinal: '15:00', turma: '1° periodo', diaDaSemana: 'segunda'});
CREATE (m7)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 04', horarioInicial: '15:00', horarioFinal: '15:45', turma: '1° periodo', diaDaSemana: 'segunda'});
return null;

CREATE (m8:Matéria {nome: 'INTROD. A QUALIDADE', ch: 40, eixo: 'Gestão e Negócios'})
MATCH (c8:Curso {nivel: 'técnico', turno: 'tarde', nome: 'TÉCNICO EM QUALIDADE'}) with m8, c8 limit 1
CREATE (m8)-[:PERTENCE_A]->(c8)
MATCH (p8:Professor {Nome: 'Jacinta', Sobrenome: 'Raposo'}) with m8,p8 limit 1
CREATE (p8)-[:LECIONA]->(m8);
CREATE (m8)-[:TEM_HORARIO]->(:Horario {sala: 'SALA 06', horarioInicial: '16:00', horarioFinal: '16:45', turma: '1° periodo', diaDaSemana: 'quarta'});
CREATE (m8)-[:TEM_HORARIO]->(:Horario {sala: 'SALA 06', horarioInicial: '16:45', horarioFinal: '17:30', turma: '1° periodo', diaDaSemana: 'quarta'});
return null;

CREATE (m9:Matéria {nome: 'AUDITORIAS DA QUALIDADE', ch: 40, eixo: 'Gestão e Negócios'})
MATCH (c9:Curso {nivel: 'técnico', turno: 'tarde', nome: 'TÉCNICO EM QUALIDADE'}) with m9, c9 limit 1
CREATE (m9)-[:PERTENCE_A]->(c9)
MATCH (p9:Professor {Nome: 'Jacinta', Sobrenome: 'Raposo'}) with m9, p9 limit 1
CREATE (p9)-[:LECIONA]->(m9);
CREATE (m9)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 04', horarioInicial: '15:00', horarioFinal: '15:45', turma: '2º periodo', diaDaSemana: 'segunda'});
CREATE (m9)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 04', horarioInicial: '16:00', horarioFinal: '16:45', turma: '2º periodo', diaDaSemana: 'segunda'});
CREATE (m9)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 04', horarioInicial: '16:45', horarioFinal: '17:30', turma: '2º periodo', diaDaSemana: 'segunda'});
return null;



CREATE (:Aluno {nome: 'Alice Moreira da Silva', idade: 18, cidade: 'Jaboatão dos Guararapes', formacaoAnterior: 'Técnico em Administração'}),
    (:Aluno {nome: 'Bruno Henrique Costa', idade: 18, cidade: 'Recife', formacaoAnterior: 'Técnico em Enfermagem'}),
    (:Aluno {nome: 'Camila Fernanda Almeida', idade: 20, cidade: 'Olinda', formacaoAnterior: 'Técnico em Administração'}),
    (:Aluno {nome: 'Daniel Augusto Pereira', idade: 17, cidade: 'Cabo de Santo Agostinho', formacaoAnterior: 'Técnico em Mecânica'}),
    (:Aluno {nome: 'Eduardo Luiz Ribeiro', idade: 19, cidade: 'Ipojuca', formacaoAnterior: 'Técnico em Química'}),
    (:Aluno {nome: 'Fernanda Cristina Oliveira', idade: 32, cidade: 'Moreno', formacaoAnterior: 'Técnico em Mecânica'}),
    (:Aluno {nome: 'Gabriel Monteiro Santos', idade: 21, cidade: 'São Lourenço da Mata', formacaoAnterior: 'Técnico em Enfermagem'}),
    (:Aluno {nome: 'Helena Rodrigues Lima', idade: 22, cidade: 'Abreu e Lima', formacaoAnterior: 'Técnico em Edificações'}),
    (:Aluno {nome: 'Igor Matheus Andrade', idade: 20, cidade: 'Paulista', formacaoAnterior: 'Técnico em Enfermagem'}),
    (:Aluno {nome: 'Juliana Maria Souza', idade: 23, cidade: 'Camaragibe', formacaoAnterior: 'Técnico em Química'}),
    (:Aluno {nome: 'Karina Letícia Gonçalves', idade: 17, cidade: 'Igarassu', formacaoAnterior: 'Técnico em Informática'}),
    (:Aluno {nome: 'Leonardo César Farias', idade: 35, cidade: 'Itapissuma', formacaoAnterior: 'Técnico em Enfermagem'}),
    (:Aluno {nome: 'Mariana Lopes Barreto', idade: 19, cidade: 'Araçoiaba', formacaoAnterior: 'Técnico em Edificações'}),
    (:Aluno {nome: 'Nathalia Duarte Freitas', idade: 26, cidade: 'Vitória de Santo Antão', formacaoAnterior: 'Técnico em Química'}),
    (:Aluno {nome: 'Otávio Vinícius Carvalho', idade: 40, cidade: 'Escada', formacaoAnterior: 'Técnico em Administração'}),
    (:Aluno {nome: 'Patrícia Regina Azevedo', idade: 35, cidade: 'Pombos', formacaoAnterior: 'Técnico em Informática'}),
    (:Aluno {nome: 'Rafael Antunes Mendes', idade: 33, cidade: 'Chã de Alegria', formacaoAnterior: 'Técnico em Química'}),
    (:Aluno {nome: 'Sofia Vitória Martins', idade: 21, cidade: 'Sirinhaém', formacaoAnterior: 'Técnico em Administração'}),
    (:Aluno {nome: 'Thiago Felipe Nascimento', idade: 20, cidade: 'Glória do Goitá', formacaoAnterior: 'Técnico em Mecânica'}),
    (:Aluno {nome: 'Vanessa Teixeira Ramos', idade: 19, cidade: 'Primavera', formacaoAnterior: 'Técnico em Eletrônica'}),
    (:Aluno {nome: 'André Luís Peixoto', idade: 23, cidade: 'Amaraji', formacaoAnterior: 'Técnico em Informática'}),
    (:Aluno {nome: 'Beatriz Almeida Torres', idade: 25, cidade: 'Cortês', formacaoAnterior: 'Técnico em Enfermagem'}),
    (:Aluno {nome: 'Caio Eduardo Fernandes', idade: 21, cidade: 'Gravatá', formacaoAnterior: 'Técnico em Enfermagem'}),
    (:Aluno {nome: 'Débora Aparecida Pires', idade: 23, cidade: 'Ribeirão', formacaoAnterior: 'Técnico em Edificações'}),
    (:Aluno {nome: 'Felipe Henrique Sampaio', idade: 22, cidade: 'Carpina', formacaoAnterior: 'Técnico em Mecânica'}),
    (:Aluno {nome: 'Giovanna Luz Santana', idade: 21, cidade: 'Lagoa do Carro', formacaoAnterior: 'Técnico em Eletrônica'}),
    (:Aluno {nome: 'Henrique Guilherme Ribeiro', idade: 25, cidade: 'Lagoa de Itaenga', formacaoAnterior: 'Técnico em Mecânica'}),
    (:Aluno {nome: 'Isabela Cristine Figueiredo', idade: 26, cidade: 'Nazaré da Mata', formacaoAnterior: 'Técnico em Química'}),
    (:Aluno {nome: 'João Pedro Cardoso', idade: 27, cidade: 'Aliança', formacaoAnterior: 'Técnico em Administração'}),
    (:Aluno {nome: 'Larissa Silva Moura', idade: 28, cidade: 'Tracunhaém', formacaoAnterior: 'Técnico em Informática'}),
    (:Aluno {nome: 'Matheus Augusto Brito', idade: 15, cidade: 'Paudalho', formacaoAnterior: NULL}),
    (:Aluno {nome: 'Nicole Beatriz Dias', idade: 16, cidade: 'São Vicente Férrer', formacaoAnterior: NULL}),
    (:Aluno {nome: 'Pedro Henrique Amaral', idade: 18, cidade: 'Ferreiros', formacaoAnterior: NULL}),
    (:Aluno {nome: 'Roberta Emília Castro', idade: 15, cidade: 'Itaquitinga', formacaoAnterior: NULL}),
    (:Aluno {nome: 'Samuel Vinícius Gomes', idade: 20, cidade: 'Timbaúba', formacaoAnterior: NULL});


MATCH (a:Aluno {nome: 'Alice Moreira da Silva'}), (c:Curso {nome: 'ADS', turno: 'tarde'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Bruno Henrique Costa'}), (c:Curso {nome: 'ADS', turno: 'tarde'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Camila Fernanda Almeida'}), (c:Curso {nome: 'ADS', turno: 'tarde'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Daniel Augusto Pereira'}), (c:Curso {nome: 'ADS', turno: 'tarde'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Eduardo Luiz Ribeiro'}), (c:Curso {nome: 'ADS', turno: 'tarde'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Fernanda Cristina Oliveira'}), (c:Curso {nome: 'ADS', turno: 'noite'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Gabriel Monteiro Santos'}), (c:Curso {nome: 'ADS', turno: 'noite'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Helena Rodrigues Lima'}), (c:Curso {nome: 'ADS', turno: 'noite'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Igor Matheus Andrade'}), (c:Curso {nome: 'ADS', turno: 'noite'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Juliana Maria Souza'}), (c:Curso {nome: 'ADS', turno: 'noite'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Karina Letícia Gonçalves'}), (c:Curso {nome: 'INFORMÁTICA PARA INTERNET', turno: 'tarde'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Leonardo César Farias'}), (c:Curso {nome: 'INFORMÁTICA PARA INTERNET', turno: 'tarde'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Mariana Lopes Barreto'}), (c:Curso {nome: 'INFORMÁTICA PARA INTERNET', turno: 'tarde'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Nathalia Duarte Freitas'}), (c:Curso {nome: 'INFORMÁTICA PARA INTERNET', turno: 'tarde'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Otávio Vinícius Carvalho'}), (c:Curso {nome: 'INFORMÁTICA PARA INTERNET', turno: 'tarde'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Patrícia Regina Azevedo'}), (c:Curso {nome: 'TÉCNICO EM COMÉCIO', turno: 'noite'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Rafael Antunes Mendes'}), (c:Curso {nome: 'TÉCNICO EM COMÉCIO', turno: 'noite'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Sofia Vitória Martins'}), (c:Curso {nome: 'TÉCNICO EM COMÉCIO', turno: 'noite'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Thiago Felipe Nascimento'}), (c:Curso {nome: 'TÉCNICO EM COMÉCIO', turno: 'noite'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Vanessa Teixeira Ramos'}), (c:Curso {nome: 'TÉCNICO EM COMÉCIO', turno: 'noite'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'André Luís Peixoto'}), (c:Curso {nome: 'TÉCNICO EM QUALIDADE', turno: 'tarde'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Beatriz Almeida Torres'}), (c:Curso {nome: 'TÉCNICO EM QUALIDADE', turno: 'tarde'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Caio Eduardo Fernandes'}), (c:Curso {nome: 'TÉCNICO EM QUALIDADE', turno: 'tarde'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Débora Aparecida Pires'}), (c:Curso {nome: 'TÉCNICO EM QUALIDADE', turno: 'tarde'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Felipe Henrique Sampaio'}), (c:Curso {nome: 'TÉCNICO EM QUALIDADE', turno: 'tarde'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Giovanna Luz Santana'}), (c:Curso {nome: 'TÉCNICO EM ADMINISTRAÇÃO', turno: 'tarde'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Henrique Guilherme Ribeiro'}), (c:Curso {nome: 'TÉCNICO EM ADMINISTRAÇÃO', turno: 'tarde'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Isabela Cristine Figueiredo'}), (c:Curso {nome: 'TÉCNICO EM ADMINISTRAÇÃO', turno: 'tarde'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'João Pedro Cardoso'}), (c:Curso {nome: 'TÉCNICO EM ADMINISTRAÇÃO', turno: 'tarde'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Larissa Silva Moura'}), (c:Curso {nome: 'TÉCNICO EM ADMINISTRAÇÃO', turno: 'tarde'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Matheus Augusto Brito'}), (c:Curso {nome: 'MIDS', turno: 'manhã'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Nicole Beatriz Dias'}), (c:Curso {nome: 'MIDS', turno: 'manhã'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Pedro Henrique Amaral'}), (c:Curso {nome: 'MIDS', turno: 'manhã'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Roberta Emília Castro'}), (c:Curso {nome: 'MIDS', turno: 'manhã'})
CREATE (a)-[:ESTUDA]->(c);

MATCH (a:Aluno {nome: 'Samuel Vinícius Gomes'}), (c:Curso {nome: 'MIDS', turno: 'manhã'})
CREATE (a)-[:ESTUDA]->(c);