CREATE (peric:Professor {Nome: 'Eric', Sobrenome: 'Sales', Idade: 33, Formação: 'Sistemas da Informação', Titulo: 'Mestre', isCoordenador: FALSE}),
       (pviviane:Professor {Nome: 'Viviane', Sobrenome: 'Aureliano', Idade: 44, Formação: 'Ciênica da Computação', Titulo: 'Doutora', isCoordenador: FALSE}),
       (pjacinta:Professor {Nome: 'Jacinta', Sobrenome: 'Raposo', Idade: 40, Formação: 'Administração', Titulo: 'Mestre', isCoordenador: TRUE}),
       (pcarlos:Professor {Nome: 'Carlos', Sobrenome: 'Brasil', Idade: 42, Formação: 'Ciência da Computação', Titulo: 'Mestre', isCoordenador: TRUE}),
       (pnilson:Professor {Nome: 'Nilson', Sobrenome: 'Cândido', Idade: 38, Formação: 'Sistema de Informação', Titulo: 'Mestre', isCoordenador: TRUE}),
       (psostenes:Professor {Nome: 'Sóstenes', Sobrenome: 'Cruz', Idade: 35, Formação: 'Ciências Contábeis', Titulo: 'Mestre', isCoordenador: TRUE}),
       (pdjuri:Professor {Nome: 'Djuri', Sobrenome: 'Vieira', Idade: 50, Formação: 'Engenharia de Produção', Titulo: 'Mestre', isCoordenador: TRUE}),
       (pnatalia:Professor {Nome: 'Natália', Sobrenome: 'Souza', Idade: 31, Formação: 'Administração', Titulo: 'Mestre', isCoordenador: TRUE}),
       (phavana:Professor {Nome: 'Havana', Sobrenome: 'Alves', Idade: 34, Formação: 'Engenharia da Computação', Titulo: 'Mestre', isCoordenador: TRUE});;

CREATE (cadstarde:Curso {nome: 'ADS', nivel: 'superior', turno: 'tarde'})
CREATE (cadsnoite:Curso {nome: 'ADS', nivel: 'superior', turno: 'noite'})
CREATE (cipi:Curso {nome: 'INFORMÁTICA PARA INTERNET', nivel: 'técnico', turno: 'tarde'})
CREATE (cipinoite:Curso {nome: 'INFORMÁTICA PARA INTERNET', nivel: 'técnico', turno: 'noite'})
CREATE (cmids:Curso {nome: 'MIDS', nivel: 'Integrado', turno: 'manhã'})
CREATE (cadm:Curso {nome: 'TÉCNICO EM ADMINISTRAÇÃO', nivel: 'técnico', turno: 'tarde'})
CREATE (ccomerciotarde:Curso {nome: 'TÉCNICO EM COMÉCIO', nivel: 'técnico', turno: 'tarde'})
CREATE (ccomercionoite:Curso {nome: 'TÉCNICO EM COMÉCIO', nivel: 'técnico', turno: 'noite'})
CREATE (cqualidade:Curso {nome: 'TÉCNICO EM QUALIDADE', nivel: 'técnico', turno: 'tarde'})

CREATE (cadstarde)-[:TEM_COORDENADOR]->(pnilson);
CREATE (cadsnoite)-[:TEM_COORDENADOR]->(pnilson);
CREATE (cipi)-[:TEM_COORDENADOR]->(pcarlos);
CREATE (cipinoite)-[:TEM_COORDENADOR]->(pcarlos);
CREATE (cmids)-[:TEM_COORDENADOR]->(phavana);
CREATE (cadm)-[:TEM_COORDENADOR]->(pjacinta);
CREATE (cqualidade)-[:TEM_COORDENADOR]->(pnatalia);
CREATE (ccomerciotarde)-[:TEM_COORDENADOR]->(psostenes);
CREATE (ccomercionoite)-[:TEM_COORDENADOR]->(pdjuri);

CREATE (m9:Matéria {nome: 'AUDITORIAS DA QUALIDADE', ch: 40, eixo: 'Gestão e Negócios'});
       (m1:Matéria {nome: 'DESENV. WEB 1', ch: 120, eixo: 'Informática e Comunicação'}),
       (m5:Matéria {nome: 'ENGENHARIA DE SOFTWARE', ch: 60, eixo: 'Informática e Comunicação'}),
       (m2:Matéria {nome: 'Estrutura de Dados', ch: 90, eixo: 'Informática e Comunicação'}),
       (m7:Matéria {nome: 'GESTÃO DE PROCESSOS', ch: 40, eixo: 'Gestão e Negócios'}),
       (m3:Matéria {nome: 'Projeto e Prática 1', ch: 90, eixo: 'Informática e Comunicação'}),
       (m4:Matéria {nome: 'Projeto e Prática 2', ch: 90, eixo: 'Informática e Comunicação'}),
       (m6:Matéria {nome: 'LIDERANÇA E TOMADA DE DECISÃO', ch: 45, eixo: 'Gestão e Negócios'}),
       (m8:Matéria {nome: 'INTROD. A QUALIDADE', ch: 40, eixo: 'Gestão e Negócios'}),

CREATE (peric)-[:LECIONA]->(m1);
CREATE (peric)-[:LECIONA]->(m2);
CREATE (peric)-[:LECIONA]->(m4);
CREATE (pviviane)-[:LECIONA]->(m3);
CREATE (pjacinta)-[:LECIONA]->(m5)
CREATE (pjacinta)-[:LECIONA]->(m6);
CREATE (pjacinta)-[:LECIONA]->(m7);
CREATE (pjacinta)-[:LECIONA]->(m8);
CREATE (pjacinta)-[:LECIONA]->(m9);

CREATE (m1)-[:PERTENCE_A]->(cmids)
CREATE (m2)-[:PERTENCE_A]->(cipi)
CREATE (m3)-[:PERTENCE_A]->(cmids)
CREATE (m4)-[:PERTENCE_A]->(cipinoite)
CREATE (m5)-[:PERTENCE_A]->(ccomercionoite)
CREATE (m6)-[:PERTENCE_A]->(cadm)
CREATE (m7)-[:PERTENCE_A]->(cqualidade)
CREATE (m8)-[:PERTENCE_A]->(cqualidade)
CREATE (m9)-[:PERTENCE_A]->(cqualidade)



CREATE (m1)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 3', horarioInicial: '07:15', horarioFinal: '08:00', turma: 'B 2° ANO', diaDaSemana: 'quinta'});
CREATE (m1)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 3', horarioInicial: '08:00', horarioFinal: '08:45', turma: 'B 2° ANO', diaDaSemana: 'quinta'});
CREATE (m1)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 3', horarioInicial: '08:45', horarioFinal: '09:45', turma: 'B 2° ANO', diaDaSemana: 'quinta'});
CREATE (m1)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 3', horarioInicial: '10:30', horarioFinal: '11:15', turma: 'A 2° ANO', diaDaSemana: 'quinta'});
CREATE (m1)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 3', horarioInicial: '11:15', horarioFinal: '12:00', turma: 'A 2° ANO', diaDaSemana: 'quinta'});
CREATE (m1)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 3', horarioInicial: '12:00', horarioFinal: '12:45', turma: 'A 2° ANO', diaDaSemana: 'quinta'});
CREATE (m2)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 03', horarioInicial: '20:30', horarioFinal: '21:15', turma: '1° periodo', diaDaSemana: 'quarta'});
CREATE (m2)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 03', horarioInicial: '21:15', horarioFinal: '22:00', turma: '1° periodo', diaDaSemana: 'quarta'});
CREATE (m3)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 02', horarioInicial: '07:15', horarioFinal: '08:00', turma: 'A 1° ANO', diaDaSemana: 'terça'});
CREATE (m3)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 02', horarioInicial: '08:00', horarioFinal: '08:45', turma: 'A 1° ANO', diaDaSemana: 'terça'});
CREATE (m3)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 02', horarioInicial: '08:45', horarioFinal: '09:45', turma: 'A 1° ANO', diaDaSemana: 'terça'});
CREATE (m3)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 02', horarioInicial: '10:30', horarioFinal: '11:15', turma: 'B 1° ANO', diaDaSemana: 'terça'});
CREATE (m3)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 02', horarioInicial: '11:15', horarioFinal: '12:00', turma: 'B 1° ANO', diaDaSemana: 'terça'});
CREATE (m3)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 02', horarioInicial: '12:00', horarioFinal: '12:45', turma: 'B 1° ANO', diaDaSemana: 'terça'});
CREATE (m4)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 03', horarioInicial: '18:15', horarioFinal: '19:00', turma: '2° periodo', diaDaSemana: 'terça'});
CREATE (m4)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 03', horarioInicial: '19:00', horarioFinal: '19:45', turma: '2° periodo', diaDaSemana: 'terça'});
CREATE (m4)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 03', horarioInicial: '19:45', horarioFinal: '20:30', turma: '2° periodo', diaDaSemana: 'terça'});
CREATE (m4)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 03', horarioInicial: '20:30', horarioFinal: '21:15', turma: '2° periodo', diaDaSemana: 'terça'});
CREATE (m5)-[:TEM_HORARIO]->(:Horario {sala: 'SALA 06', horarioInicial: '20:30', horarioFinal: '21:15', turma: '2° periodo', diaDaSemana: 'terça'});
CREATE (m5)-[:TEM_HORARIO]->(:Horario {sala: 'SALA 06', horarioInicial: '21:15', horarioFinal: '22:00', turma: '2° periodo', diaDaSemana: 'terça'});
CREATE (m5)-[:TEM_HORARIO]->(:Horario {sala: 'SALA 06', horarioInicial: '20:30', horarioFinal: '21:15', turma: '3° periodo', diaDaSemana: 'terça'});
CREATE (m5)-[:TEM_HORARIO]->(:Horario {sala: 'SALA 06', horarioInicial: '21:15', horarioFinal: '22:00', turma: '3° periodo', diaDaSemana: 'terça'});
CREATE (m6)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 04', horarioInicial: '13:30', horarioFinal: '14:15', turma: '1° periodo', diaDaSemana: 'quarta'});
CREATE (m6)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 04', horarioInicial: '14:15', horarioFinal: '15:00', turma: '1° periodo', diaDaSemana: 'quarta'});
CREATE (m7)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 04', horarioInicial: '14:15', horarioFinal: '15:00', turma: '1° periodo', diaDaSemana: 'segunda'});
CREATE (m7)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 04', horarioInicial: '15:00', horarioFinal: '15:45', turma: '1° periodo', diaDaSemana: 'segunda'});
CREATE (m8)-[:TEM_HORARIO]->(:Horario {sala: 'SALA 06', horarioInicial: '16:00', horarioFinal: '16:45', turma: '1° periodo', diaDaSemana: 'quarta'});
CREATE (m8)-[:TEM_HORARIO]->(:Horario {sala: 'SALA 06', horarioInicial: '16:45', horarioFinal: '17:30', turma: '1° periodo', diaDaSemana: 'quarta'});
CREATE (m9)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 04', horarioInicial: '15:00', horarioFinal: '15:45', turma: '2º periodo', diaDaSemana: 'segunda'});
CREATE (m9)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 04', horarioInicial: '16:00', horarioFinal: '16:45', turma: '2º periodo', diaDaSemana: 'segunda'});
CREATE (m9)-[:TEM_HORARIO]->(:Horario {sala: 'LAB 04', horarioInicial: '16:45', horarioFinal: '17:30', turma: '2º periodo', diaDaSemana: 'segunda'});

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