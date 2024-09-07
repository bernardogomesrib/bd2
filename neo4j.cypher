//trabalho de grafo Bernardo José Gomes Ribeiro e Ian Lucas Almeida


CREATE (peric:Professor {Nome: 'Eric', Sobrenome: 'Sales', Idade: 33, Formação: 'Sistemas da Informação', Titulo: 'Mestre', isCoordenador: FALSE}),
       (pviviane:Professor {Nome: 'Viviane', Sobrenome: 'Aureliano', Idade: 44, Formação: 'Ciênica da Computação', Titulo: 'Doutora', isCoordenador: FALSE}),
       (pjacinta:Professor {Nome: 'Jacinta', Sobrenome: 'Raposo', Idade: 40, Formação: 'Administração', Titulo: 'Mestre', isCoordenador: TRUE}),
       (pcarlos:Professor {Nome: 'Carlos', Sobrenome: 'Brasil', Idade: 42, Formação: 'Ciência da Computação', Titulo: 'Mestre', isCoordenador: TRUE}),
       (pnilson:Professor {Nome: 'Nilson', Sobrenome: 'Cândido', Idade: 38, Formação: 'Sistemas de Informação', Titulo: 'Mestre', isCoordenador: TRUE}),
       (psostenes:Professor {Nome: 'Sóstenes', Sobrenome: 'Cruz', Idade: 35, Formação: 'Ciências Contábeis', Titulo: 'Mestre', isCoordenador: TRUE}),
       (pdjuri:Professor {Nome: 'Djuri', Sobrenome: 'Vieira', Idade: 50, Formação: 'Engenharia de Produção', Titulo: 'Mestre', isCoordenador: TRUE}),
       (pnatalia:Professor {Nome: 'Natália', Sobrenome: 'Souza', Idade: 31, Formação: 'Administração', Titulo: 'Mestre', isCoordenador: TRUE}),
       (phavana:Professor {Nome: 'Havana', Sobrenome: 'Alves', Idade: 34, Formação: 'Engenharia da Computação', Titulo: 'Mestre', isCoordenador: TRUE})

CREATE (cadstarde:Curso {nome: 'ADS', nivel: 'superior', turno: 'tarde'})
CREATE (cadsnoite:Curso {nome: 'ADS', nivel: 'superior', turno: 'noite'})
CREATE (cipi:Curso {nome: 'INFORMÁTICA PARA INTERNET', nivel: 'técnico', turno: 'tarde'})
CREATE (cipinoite:Curso {nome: 'INFORMÁTICA PARA INTERNET', nivel: 'técnico', turno: 'noite'})
CREATE (cmids:Curso {nome: 'MIDS', nivel: 'Integrado', turno: 'manhã'})
CREATE (cadm:Curso {nome: 'TÉCNICO EM ADMINISTRAÇÃO', nivel: 'técnico', turno: 'tarde'})
CREATE (ccomerciotarde:Curso {nome: 'TÉCNICO EM COMÉCIO', nivel: 'técnico', turno: 'tarde'})
CREATE (ccomercionoite:Curso {nome: 'TÉCNICO EM COMÉCIO', nivel: 'técnico', turno: 'noite'})
CREATE (cqualidade:Curso {nome: 'TÉCNICO EM QUALIDADE', nivel: 'técnico', turno: 'tarde'})

CREATE (cadstarde)-[:TEM_COORDENADOR]->(pnilson)
CREATE (cadsnoite)-[:TEM_COORDENADOR]->(pnilson)
CREATE (cipi)-[:TEM_COORDENADOR]->(pcarlos)
CREATE (cipinoite)-[:TEM_COORDENADOR]->(pcarlos)
CREATE (cmids)-[:TEM_COORDENADOR]->(phavana)
CREATE (cadm)-[:TEM_COORDENADOR]->(pjacinta)
CREATE (cqualidade)-[:TEM_COORDENADOR]->(pnatalia)
CREATE (ccomerciotarde)-[:TEM_COORDENADOR]->(psostenes)
CREATE (ccomercionoite)-[:TEM_COORDENADOR]->(pdjuri)

CREATE (m9:Disciplina {nome: 'AUDITORIAS DA QUALIDADE', ch: 40, eixo: 'Gestão e Negócios'}),
       (m1:Disciplina {nome: 'DESENV. WEB 1', ch: 120, eixo: 'Informática e Comunicação'}),
       (m5:Disciplina {nome: 'ENGENHARIA DE SOFTWARE', ch: 60, eixo: 'Informática e Comunicação'}),
       (m2:Disciplina {nome: 'Estrutura de Dados', ch: 90, eixo: 'Informática e Comunicação'}),
       (m7:Disciplina {nome: 'GESTÃO DE PROCESSOS', ch: 40, eixo: 'Gestão e Negócios'}),
       (m4:Disciplina {nome: 'GESTÃO DA QUALIDADE', ch: 40, eixo: 'Gestão e Negócios'}),
       (m3:Disciplina {nome: 'Projeto e Prática 1', ch: 90, eixo: 'Informática e Comunicação'}),
       (m6:Disciplina {nome: 'LIDERANÇA E TOMADA DE DECISÃO', ch: 45, eixo: 'Gestão e Negócios'}),
       (m8:Disciplina {nome: 'INTROD. A QUALIDADE', ch: 40, eixo: 'Gestão e Negócios'}),
       (m10:Disciplina {nome: 'LOGICA DE PROGRAMAÇÃO', ch: 120,eixo: 'Informática e Comunicação'})

CREATE (m1)-[:faz_parte]->(cmids)
CREATE (m3)-[:faz_parte]->(cmids)
CREATE (m2)-[:faz_parte]->(cadsnoite)
CREATE (m5)-[:faz_parte]->(cipinoite)
CREATE (m6)-[:faz_parte]->(cadm)
CREATE (m7)-[:faz_parte]->(cqualidade)
CREATE (m8)-[:faz_parte]->(cqualidade)
CREATE (m9)-[:faz_parte]->(cqualidade)



CREATE (peric)-[ministra:ministra]->(m1)
CREATE (:Turno {sala: 'LAB 03', horarioInicial: '07:15', horarioFinal: '08:00', turma: 'B 2° ANO', diaDaSemana: 'quinta'})-[:horario]->(peric)
CREATE (:Turno {sala: 'LAB 03', horarioInicial: '08:00', horarioFinal: '08:45', turma: 'B 2° ANO', diaDaSemana: 'quinta'})-[:horario]->(peric)
CREATE (:Turno {sala: 'LAB 03', horarioInicial: '08:45', horarioFinal: '09:45', turma: 'B 2° ANO', diaDaSemana: 'quinta'})-[:horario]->(peric)
CREATE (:Turno {sala: 'LAB 03', horarioInicial: '10:30', horarioFinal: '11:15', turma: 'A 2° ANO', diaDaSemana: 'quinta'})-[:horario]->(peric)
CREATE (:Turno {sala: 'LAB 03', horarioInicial: '11:15', horarioFinal: '12:00', turma: 'A 2° ANO', diaDaSemana: 'quinta'})-[:horario]->(peric)
CREATE (:Turno {sala: 'LAB 03', horarioInicial: '12:00', horarioFinal: '12:45', turma: 'A 2° ANO', diaDaSemana: 'quinta'})-[:horario]->(peric)


CREATE (peric)-[mn5:ministra]->(m5)
CREATE (:Turno {sala: 'LAB 03', horarioInicial: '18:15', horarioFinal: '19:00', turma: '2° periodo', diaDaSemana: 'terça'})-[:horario]->(peric)
CREATE (:Turno {sala: 'LAB 03', horarioInicial: '19:00', horarioFinal: '19:45', turma: '2° periodo', diaDaSemana: 'terça'})-[:horario]->(peric)
CREATE (:Turno {sala: 'LAB 03', horarioInicial: '19:45', horarioFinal: '20:30', turma: '2° periodo', diaDaSemana: 'terça'})-[:horario]->(peric)
CREATE (:Turno {sala: 'LAB 03', horarioInicial: '20:30', horarioFinal: '21:15', turma: '2° periodo', diaDaSemana: 'terça'})-[:horario]->(peric)

CREATE (pjacinta)-[mn7:ministra]->(m7)
CREATE (:Turno {sala: 'LAB 04', horarioInicial: '13:30', horarioFinal: '14:15', turma: '1° periodo', diaDaSemana: 'quarta'})-[:horario]->(pjacinta)
CREATE (:Turno {sala: 'LAB 04', horarioInicial: '14:15', horarioFinal: '15:00', turma: '1° periodo', diaDaSemana: 'quarta'})-[:horario]->(pjacinta)

CREATE (pjacinta)-[mn8:ministra]->(m8)
CREATE (:Turno {sala: 'SALA 06', horarioInicial: '16:00', horarioFinal: '16:45', turma: '1° periodo', diaDaSemana: 'quarta'})-[:horario]->(pjacinta)
CREATE (:Turno {sala: 'SALA 06', horarioInicial: '16:45', horarioFinal: '17:30', turma: '1° periodo', diaDaSemana: 'quarta'})-[:horario]->(pjacinta)

CREATE (pjacinta)-[mn9:ministra]->(m9)
CREATE (:Turno {sala: 'LAB 04', horarioInicial: '15:00', horarioFinal: '15:45', turma: '2º periodo', diaDaSemana: 'segunda'})-[:horario]->(pjacinta)
CREATE (:Turno {sala: 'LAB 04', horarioInicial: '16:00', horarioFinal: '16:45', turma: '2º periodo', diaDaSemana: 'segunda'})-[:horario]->(pjacinta)
CREATE (:Turno {sala: 'LAB 04', horarioInicial: '16:45', horarioFinal: '17:30', turma: '2º periodo', diaDaSemana: 'segunda'})-[:horario]->(pjacinta)
CREATE (:Turno {sala: 'SALA 06', horarioInicial: '14:15', horarioFinal: '15:00', turma: '1° periodo', diaDaSemana: 'segunda'})-[:horario]->(pjacinta)
CREATE (:Turno {sala: 'SALA 06', horarioInicial: '15:00', horarioFinal: '15:45', turma: '1° periodo', diaDaSemana: 'segunda'})-[:horario]->(pjacinta)


CREATE (pjacinta)-[mn10:ministra]->(m4)
CREATE (:Turno {sala: 'SALA 05', horarioInicial: '15:00', horarioFinal: '15:45', turma: '3° periodo', diaDaSemana: 'terça'})-[:horario]->(pjacinta)
CREATE (:Turno {sala: 'SALA 05', horarioInicial: '16:00', horarioFinal: '16:45', turma: '3° periodo', diaDaSemana: 'terça'})-[:horario]->(pjacinta)
CREATE (:Turno {sala: 'SALA 05', horarioInicial: '16:45', horarioFinal: '17:30', turma: '3° periodo', diaDaSemana: 'terça'})-[:horario]->(pjacinta)
                                


CREATE (pjacinta)-[mn6:ministra]->(m6)
CREATE (:Turno {sala: 'SALA 06', horarioInicial: '20:30', horarioFinal: '21:15', turma: '2° periodo', diaDaSemana: 'terça'})-[:horario]->(pjacinta)
CREATE (:Turno {sala: 'SALA 06', horarioInicial: '21:15', horarioFinal: '22:00', turma: '2° periodo', diaDaSemana: 'terça'})-[:horario]->(pjacinta)
CREATE (:Turno {sala: 'SALA 06', horarioInicial: '20:30', horarioFinal: '21:15', turma: '3° periodo', diaDaSemana: 'terça'})-[:horario]->(pjacinta)
CREATE (:Turno {sala: 'SALA 06', horarioInicial: '21:15', horarioFinal: '22:00', turma: '3° periodo', diaDaSemana: 'terça'})-[:horario]->(pjacinta)


CREATE (pviviane)-[mn2:ministra]->(m2)
CREATE (:Turno {sala: 'LAB 07', horarioInicial: '18:15', horarioFinal: '19:00', turma: '2° periodo', diaDaSemana: 'segunda'})-[:horario]->(pviviane)
CREATE (:Turno {sala: 'LAB 07', horarioInicial: '19:00', horarioFinal: '19:45', turma: '2° periodo', diaDaSemana: 'segunda'})-[:horario]->(pviviane)
CREATE (:Turno {sala: 'LAB 07', horarioInicial: '19:45', horarioFinal: '20:30', turma: '2° periodo', diaDaSemana: 'segunda'})-[:horario]->(pviviane)


CREATE (pviviane)-[mn4:ministra]->(m10)
CREATE (:Turno {sala: 'LAB 07', horarioInicial: '13:30', horarioFinal: '14:15', turma: '1° periodo', diaDaSemana: 'segunda'})-[:horario]->(pviviane)
CREATE (:Turno {sala: 'LAB 07', horarioInicial: '14:15', horarioFinal: '15:00', turma: '1° periodo', diaDaSemana: 'segunda'})-[:horario]->(pviviane)
CREATE (:Turno {sala: 'LAB 07', horarioInicial: '15:00', horarioFinal: '15:45', turma: '1° periodo', diaDaSemana: 'segunda'})-[:horario]->(pviviane)
CREATE (:Turno {sala: 'LAB 07', horarioInicial: '16:00', horarioFinal: '16:45', turma: '1° periodo', diaDaSemana: 'segunda'})-[:horario]->(pviviane)
CREATE (:Turno {sala: 'LAB 07', horarioInicial: '16:45', horarioFinal: '17:30', turma: '1° periodo', diaDaSemana: 'segunda'})-[:horario]->(pviviane)


CREATE (pviviane)-[mn3:ministra]->(m3)
CREATE (:Turno {sala: 'LAB 02', horarioInicial: '07:15', horarioFinal: '08:00', turma: 'A 1° ANO', diaDaSemana: 'terça'})-[:horario]->(pviviane)
CREATE (:Turno {sala: 'LAB 02', horarioInicial: '08:00', horarioFinal: '08:45', turma: 'A 1° ANO', diaDaSemana: 'terça'})-[:horario]->(pviviane)
CREATE (:Turno {sala: 'LAB 02', horarioInicial: '08:45', horarioFinal: '09:45', turma: 'A 1° ANO', diaDaSemana: 'terça'})-[:horario]->(pviviane)
CREATE (:Turno {sala: 'LAB 02', horarioInicial: '10:30', horarioFinal: '11:15', turma: 'B 1° ANO', diaDaSemana: 'terça'})-[:horario]->(pviviane)
CREATE (:Turno {sala: 'LAB 02', horarioInicial: '11:15', horarioFinal: '12:00', turma: 'B 1° ANO', diaDaSemana: 'terça'})-[:horario]->(pviviane)
CREATE (:Turno {sala: 'LAB 02', horarioInicial: '12:00', horarioFinal: '12:45', turma: 'B 1° ANO', diaDaSemana: 'terça'})-[:horario]->(pviviane)


CREATE (al1:Aluno {nome: 'Alice Moreira da Silva', idade: 18, cidade: 'Jaboatão dos Guararapes', formacaoAnterior: 'Técnico em Administração'}),
    (al2:Aluno {nome: 'Bruno Henrique Costa', idade: 18, cidade: 'Recife', formacaoAnterior: 'Técnico em Enfermagem'}),
    (al3:Aluno {nome: 'Camila Fernanda Almeida', idade: 20, cidade: 'Olinda', formacaoAnterior: 'Técnico em Administração'}),
    (al4:Aluno {nome: 'Daniel Augusto Pereira', idade: 17, cidade: 'Cabo de Santo Agostinho', formacaoAnterior: 'Técnico em Mecânica'}),
    (al5:Aluno {nome: 'Eduardo Luiz Ribeiro', idade: 19, cidade: 'Ipojuca', formacaoAnterior: 'Técnico em Química'}),
    (al6:Aluno {nome: 'Fernanda Cristina Oliveira', idade: 32, cidade: 'Moreno', formacaoAnterior: 'Técnico em Mecânica'}),
    (al7:Aluno {nome: 'Gabriel Monteiro Santos', idade: 21, cidade: 'São Lourenço da Mata', formacaoAnterior: 'Técnico em Enfermagem'}),
    (al8:Aluno {nome: 'Helena Rodrigues Lima', idade: 22, cidade: 'Abreu e Lima', formacaoAnterior: 'Técnico em Edificações'}),
    (al9:Aluno {nome: 'Igor Matheus Andrade', idade: 20, cidade: 'Paulista', formacaoAnterior: 'Técnico em Enfermagem'}),
    (al10:Aluno {nome: 'Juliana Maria Souza', idade: 23, cidade: 'Camaragibe', formacaoAnterior: 'Técnico em Química'}),
    (al11:Aluno {nome: 'Karina Letícia Gonçalves', idade: 17, cidade: 'Igarassu', formacaoAnterior: 'Técnico em Informática'}),
    (al12:Aluno {nome: 'Leonardo César Farias', idade: 35, cidade: 'Itapissuma', formacaoAnterior: 'Técnico em Enfermagem'}),
    (al13:Aluno {nome: 'Mariana Lopes Barreto', idade: 19, cidade: 'Araçoiaba', formacaoAnterior: 'Técnico em Edificações'}),
    (al14:Aluno {nome: 'Nathalia Duarte Freitas', idade: 26, cidade: 'Vitória de Santo Antão', formacaoAnterior: 'Técnico em Química'}),
    (al15:Aluno {nome: 'Otávio Vinícius Carvalho', idade: 40, cidade: 'Escada', formacaoAnterior: 'Técnico em Administração'}),
    (al16:Aluno {nome: 'Patrícia Regina Azevedo', idade: 35, cidade: 'Pombos', formacaoAnterior: 'Técnico em Informática'}),
    (al17:Aluno {nome: 'Rafael Antunes Mendes', idade: 33, cidade: 'Chã de Alegria', formacaoAnterior: 'Técnico em Química'}),
    (al18:Aluno {nome: 'Sofia Vitória Martins', idade: 21, cidade: 'Sirinhaém', formacaoAnterior: 'Técnico em Administração'}),
    (al19:Aluno {nome: 'Thiago Felipe Nascimento', idade: 20, cidade: 'Glória do Goitá', formacaoAnterior: 'Técnico em Mecânica'}),
    (al20:Aluno {nome: 'Vanessa Teixeira Ramos', idade: 19, cidade: 'Primavera', formacaoAnterior: 'Técnico em Eletrônica'}),
    (al21:Aluno {nome: 'André Luís Peixoto', idade: 23, cidade: 'Amaraji', formacaoAnterior: 'Técnico em Informática'}),
    (al22:Aluno {nome: 'Beatriz Almeida Torres', idade: 25, cidade: 'Cortês', formacaoAnterior: 'Técnico em Enfermagem'}),
    (al23:Aluno {nome: 'Caio Eduardo Fernandes', idade: 21, cidade: 'Gravatá', formacaoAnterior: 'Técnico em Enfermagem'}),
    (al24:Aluno {nome: 'Débora Aparecida Pires', idade: 23, cidade: 'Ribeirão', formacaoAnterior: 'Técnico em Edificações'}),
    (al25:Aluno {nome: 'Felipe Henrique Sampaio', idade: 22, cidade: 'Carpina', formacaoAnterior: 'Técnico em Mecânica'}),
    (al26:Aluno {nome: 'Giovanna Luz Santana', idade: 21, cidade: 'Lagoa do Carro', formacaoAnterior: 'Técnico em Eletrônica'}),
    (al27:Aluno {nome: 'Henrique Guilherme Ribeiro', idade: 25, cidade: 'Lagoa de Itaenga', formacaoAnterior: 'Técnico em Mecânica'}),
    (al28:Aluno {nome: 'Isabela Cristine Figueiredo', idade: 26, cidade: 'Nazaré da Mata', formacaoAnterior: 'Técnico em Química'}),
    (al29:Aluno {nome: 'João Pedro Cardoso', idade: 27, cidade: 'Aliança', formacaoAnterior: 'Técnico em Administração'}),
    (al30:Aluno {nome: 'Larissa Silva Moura', idade: 28, cidade: 'Tracunhaém', formacaoAnterior: 'Técnico em Informática'}),
    (al31:Aluno {nome: 'Matheus Augusto Brito', idade: 15, cidade: 'Paudalho', formacaoAnterior: NULL}),
    (al32:Aluno {nome: 'Nicole Beatriz Dias', idade: 16, cidade: 'São Vicente Férrer', formacaoAnterior: NULL}),
    (al33:Aluno {nome: 'Pedro Henrique Amaral', idade: 18, cidade: 'Ferreiros', formacaoAnterior: NULL}),
    (al34:Aluno {nome: 'Roberta Emília Castro', idade: 15, cidade: 'Itaquitinga', formacaoAnterior: NULL}),
    (al35:Aluno {nome: 'Samuel Vinícius Gomes', idade: 20, cidade: 'Timbaúba', formacaoAnterior: NULL})

CREATE (al1)-[:ESTUDA]->(cadsnoite)
CREATE (al1)-[:PAGA]->(m2)
CREATE (al2)-[:ESTUDA]->(cadsnoite)
CREATE (al2)-[:PAGA]->(m2)
CREATE (al3)-[:ESTUDA]->(cadsnoite)
CREATE (al3)-[:PAGA]->(m2)
CREATE (al4)-[:ESTUDA]->(cadsnoite)
CREATE (al4)-[:PAGA]->(m2)
CREATE (al5)-[:ESTUDA]->(cadsnoite)
CREATE (al5)-[:PAGA]->(m2)
CREATE (al6)-[:ESTUDA]->(cadstarde)
CREATE (al6)-[:PAGA]->(m10)
CREATE (al7)-[:ESTUDA]->(cadstarde)
CREATE (al7)-[:PAGA]->(m10)
CREATE (al8)-[:ESTUDA]->(cadstarde)
CREATE (al8)-[:PAGA]->(m10)
CREATE (al9)-[:ESTUDA]->(cadstarde)
CREATE (al9)-[:PAGA]->(m10)
CREATE (al10)-[:ESTUDA]->(cadstarde)
CREATE (al10)-[:PAGA]->(m10)
CREATE (al11)-[:ESTUDA]->(cipinoite)
CREATE (al11)-[:PAGA]->(m1)
CREATE (al11)-[:PAGA]->(m5)
CREATE (al12)-[:ESTUDA]->(cipinoite)
CREATE (al12)-[:PAGA]->(m1)
CREATE (al12)-[:PAGA]->(m5)
CREATE (al13)-[:ESTUDA]->(cipinoite)
CREATE (al13)-[:PAGA]->(m1)
CREATE (al13)-[:PAGA]->(m5)
CREATE (al14)-[:ESTUDA]->(cipinoite)
CREATE (al14)-[:PAGA]->(m1)
CREATE (al14)-[:PAGA]->(m5)
CREATE (al15)-[:ESTUDA]->(cipinoite)
CREATE (al15)-[:PAGA]->(m1)
CREATE (al15)-[:PAGA]->(m5)
CREATE (al16)-[:ESTUDA]->(ccomercionoite)
CREATE (al16)-[:PAGA]->(m6)
CREATE (al17)-[:ESTUDA]->(ccomercionoite)
CREATE (al17)-[:PAGA]->(m6)
CREATE (al18)-[:ESTUDA]->(ccomercionoite)
CREATE (al18)-[:PAGA]->(m6)
CREATE (al19)-[:ESTUDA]->(ccomercionoite)
CREATE (al19)-[:PAGA]->(m6)
CREATE (al20)-[:ESTUDA]->(ccomercionoite)
CREATE (al20)-[:PAGA]->(m6)
CREATE (al21)-[:ESTUDA]->(cqualidade)
CREATE (al21)-[:PAGA]->(m7)
CREATE (al21)-[:PAGA]->(m8)
CREATE (al21)-[:PAGA]->(m9)
CREATE (al22)-[:ESTUDA]->(cqualidade)
CREATE (al22)-[:PAGA]->(m7)
CREATE (al22)-[:PAGA]->(m8)
CREATE (al22)-[:PAGA]->(m9)
CREATE (al23)-[:ESTUDA]->(cqualidade)
CREATE (al23)-[:PAGA]->(m7)
CREATE (al23)-[:PAGA]->(m8)
CREATE (al23)-[:PAGA]->(m9)
CREATE (al24)-[:ESTUDA]->(cqualidade)
CREATE (al24)-[:PAGA]->(m7)
CREATE (al24)-[:PAGA]->(m8)
CREATE (al24)-[:PAGA]->(m9)
CREATE (al25)-[:ESTUDA]->(cqualidade)
CREATE (al25)-[:PAGA]->(m7)
CREATE (al25)-[:PAGA]->(m8)
CREATE (al25)-[:PAGA]->(m9)
CREATE (al26)-[:ESTUDA]->(cadm)
CREATE (al26)-[:PAGA]->(m4)
CREATE (al26)-[:PAGA]->(m7)
CREATE (al27)-[:ESTUDA]->(cadm)
CREATE (al27)-[:PAGA]->(m4)
CREATE (al27)-[:PAGA]->(m7)
CREATE (al28)-[:ESTUDA]->(cadm)
CREATE (al28)-[:PAGA]->(m4)
CREATE (al28)-[:PAGA]->(m7)
CREATE (al29)-[:ESTUDA]->(cadm)
CREATE (al29)-[:PAGA]->(m4)
CREATE (al29)-[:PAGA]->(m7)
CREATE (al30)-[:ESTUDA]->(cadm)
CREATE (al30)-[:PAGA]->(m4)
CREATE (al30)-[:PAGA]->(m7)
CREATE (al31)-[:ESTUDA]->(cmids)
CREATE (al31)-[:PAGA]->(m1)
CREATE (al31)-[:PAGA]->(m3)
CREATE (al32)-[:ESTUDA]->(cmids)
CREATE (al32)-[:PAGA]->(m1)
CREATE (al32)-[:PAGA]->(m3)
CREATE (al33)-[:ESTUDA]->(cmids)
CREATE (al33)-[:PAGA]->(m1)
CREATE (al33)-[:PAGA]->(m3)
CREATE (al34)-[:ESTUDA]->(cmids)
CREATE (al34)-[:PAGA]->(m1)
CREATE (al34)-[:PAGA]->(m3)
CREATE (al35)-[:ESTUDA]->(cmids)





//inserts e deletes

//apagando o aluno igor e as suas relações

MATCH (a:Aluno {nome: 'Igor Matheus Andrade'})
DETACH DELETE a;



//fazendo um insert de um aluno que estuda ADS no turno da tarde
CREATE (aluana:Aluno {nome: 'Luana Gomes', idade: 22, cidade: 'Recife', formacaoAnterior: 'Técnico em Informática'})
WITH aluana
MATCH (cadstarde:Curso {nome: 'ADS', turno: 'tarde'})
CREATE (aluana)-[:ESTUDA]->(cadstarde);

//alterando a formação de um professor para Engenharia de Software

MATCH (p:Professor {Nome: 'Carlos', Sobrenome: 'Brasil'})
SET p.Formação = 'Engenharia de Software';

//alterando a carga horária de uma disciplina
MATCH (d:Disciplina {nome: 'ENGENHARIA DE SOFTWARE'})
SET d.ch = 80;

//selects e filtros

//1. Select com Projeção de Dados Simples, de Array e Subobjetos
//consulta simples Nome e Sobrenome de Professores

MATCH (p:Professor)
RETURN p.Nome, p.Sobrenome;

//Mostrando os nomes das disciplinas de um curso
MATCH(D:Disciplina)-[:faz_parte]->(C:Curso) where C.nome = "ADS" RETURN C.nome as Curso,Collect(D.nome) AS Disciplinas
MATCH(D:Disciplina)-[:faz_parte]->(C:Curso) where C.nome = "MIDS" RETURN C.nome as Curso,Collect(D.nome) AS Disciplinas


//Mostrando as disciplinas com seus eixos

MATCH (d:Disciplina)
RETURN d.nome, d.eixo;


//Select com Filtros em Dados de Diferentes Tipos
//Filtro por Texto Professores com Título "Mestre"

MATCH (p:Professor)
WHERE p.Titulo = 'Mestre'
RETURN p.Nome, p.Titulo;

//Filtro por Número Professores com idade maior que 40

MATCH (p:Professor)
WHERE p.Idade > 40
RETURN p.Nome, p.Idade;

//Filtro por Boolean Professores que são Coordenadores

MATCH (p:Professor)
WHERE p.isCoordenador = TRUE
RETURN p.Nome, p.isCoordenador;


// Select Comparando Tipos Simples Números, Textos, Datas
// Comparando Números Disciplinas com carga horária maior que 40 horas

MATCH (d:Disciplina)
WHERE d.ch > 40
RETURN d.nome, d.ch;

//Comparando Textos mostrando apenas os cursos de nível técnico":

MATCH (c:Curso)
WHERE c.nivel = 'técnico'
RETURN c.nome, c.nivel;


// Select Pesquisando em Sub-objetos e Arrays
// Pesquisar em Sub-objetos (Mostrando todas as disciplinas de um professor


MATCH (p:Professor)-[:ministra]->(d:Disciplina)
WHERE p.Nome = 'Eric'
RETURN p.Nome, collect(d.nome) AS Disciplinas;

//Pesquisar em Arrays Mostrando os cursos com disciplinas da área de "Gestão e Negócios":

MATCH (c:Curso)-[:faz_parte]->(d:Disciplina)
WHERE d.eixo = 'Gestão e Negócios'
RETURN c.nome, collect(d.nome) AS Disciplinas;

// Select com Condições com Comparadores (> , < , >= , <= , <>)
// Condições com Comparadores (Professores entre 30 e 40 anos

MATCH (p:Professor)
WHERE p.Idade >= 30 AND p.Idade <= 40
RETURN p.Nome, p.Idade;

//Condições com <> (Professores que não são coordenadores

MATCH (p:Professor)
WHERE p.isCoordenador <> TRUE
RETURN p.Nome, p.isCoordenador;

// Select com Algo Equivalente ao LIKE de SQL
// Uso de CONTAINS para buscar alunos cujo nome contenha "Maria":

MATCH (a:Aluno)
WHERE a.nome CONTAINS 'Maria'
RETURN a.nome;

//Uso de STARTS WITH para buscar professores cujo nome comece com "Ca":

MATCH (p:Professor)
WHERE p.Nome STARTS WITH 'Ca'
RETURN p.Nome;

//Uso de ENDS WITH para buscar cursos cujo nome termine com "te":

MATCH (c:Curso)
WHERE c.turno ENDS WITH 'te'
RETURN c.nome;

// Select com Aplicação de Ordenação, LIMIT, SKIP, Operadores de Agregação, DISTINCT
// Ordenar e Limitar Ordenar professores por idade e Mostrando os 3 MAIS velhos:

MATCH (p:Professor)
RETURN p.Nome, p.Idade
ORDER BY p.Idade DESC
LIMIT 3;

//Usar SKIP para pular os primeiros 2 cursos:

MATCH (c:Curso)
RETURN c.nome
ORDER BY c.nome
SKIP 2;

//Operadores de Agregação Contar o número de professores

MATCH (p:Professor)
RETURN COUNT(p) AS TotalProfessores;

//Usar DISTINCT para Mostrando as diferentes formações dos professores:

MATCH (p:Professor)
RETURN DISTINCT p.Formação;