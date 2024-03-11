-- Active: 1708949357403@@localhost@5432@postgresaula0403@public

create table times (
  id serial primary key,
  nome varchar(30) not null,
  num_pontos integer,
  vitorias integer,
  derrotas integer,
  empates integer,
  gols_afavor integer,
  gols_sofridos integer
);

insert into times values
(1,'Sport',0,0,0,0,0,0),
(2,'Náutico',0,0,0,0,0,0),
(3,'Santa Cruz',0,0,0,0,0,0);

create table jogos (
  id_mandante integer,
  id_visitante integer,
  gols_mandante integer,
  gols_visitante integer,
  PRIMARY key  (id_mandante, id_visitante),
  FOREIGN key (id_mandante) REFERENCES times (id),
  FOREIGN key (id_visitante) REFERENCES times (id)
);


drop FUNCTION atualizaempate;

CREATE or REPLACE FUNCTION atualizaEmpate()
RETURNS TRIGGER
LANGUAGE plpgsql as $$
BEGIN
    IF (NEW.gols_mandante = NEW.gols_visitante) THEN
        UPDATE times SET empates = empates + 1,num_pontos = num_pontos+1,gols_afavor = gols_afavor+ new.gols_mandante,gols_sofridos =gols_sofridos+new.gols_mandante WHERE id = NEW.id_visitante OR id = NEW.id_mandante;

    ELSEIF (NEW.gols_mandante > NEW.gols_visitante) THEN
        UPDATE times SET vitorias = vitorias +1, num_pontos = num_pontos+3,gols_afavor = gols_afavor+ new.gols_mandante, gols_sofridos = gols_sofridos+new.gols_visitante WHERE id = NEW.id_mandante;
        Update times set derrotas = derrotas +1,gols_afavor = gols_afavor+ new.gols_visitante, gols_sofridos = gols_sofridos + new.gols_mandante WHERE id = new.id_visitante;
    ELSEIF(NEW.gols_visitante> NEW.gols_mandante)THEN
        UPDATE times SET vitorias = vitorias +1, num_pontos = num_pontos+3,gols_afavor = gols_afavor+ new.gols_visitante, gols_sofridos = gols_sofridos + new.gols_mandante  WHERE id = new.id_visitante;
        Update times set derrotas = derrotas +1,gols_afavor = gols_afavor+ new.gols_mandante, gols_sofridos = gols_sofridos+new.gols_visitante  WHERE id = NEW.id_mandante;
    end IF;
    RETURN NEW;
END;
$$;

DROP TRIGGER atualizaEmpatetrigger on jogos;


CREATE TRIGGER atualizaEmpatetrigger
before insert ON jogos
FOR EACH ROW
EXECUTE PROCEDURE atualizaEmpate ( );
-- empate
INSERT INTO jogos VALUES(1,2,2,2);
-- vitoria
INSERT INTO jogos VALUES (1,3,3,1);
-- vitoria
INSERT INTO jogos VALUES(2,3,0,3);
INSERT INTO jogos VALUES(2,1,2,1);

CREATE VIEW vw_campeonato AS
SELECT nome, num_pontos,vitorias,gols_afavor-gols_sofridos as saldo_gols from times order by num_pontos DESC, vitorias DESC, gols_afavor - gols_sofridos DESC;

select * from vw_campeonato;

CREATE or replace function inserir_time(nome_t VARCHAR(30))
returns void
LANGUAGE plpgsql as $$
declare id_novo INTEGER;
BEGIN
  INSERT INTO times VALUES((SELECT max(id)+1 FROM times),nome_t,0,0,0,0,0,0);
END;$$;


SELECT inserir_time('time_novo');


CREATE or REPLACE FUNCTION campeonato_param(param integer)
RETURNS TABLE(nomes VARCHAR(30))
LANGUAGE plpgsql as $$
BEGIN
  IF(param =1) THEN
    SELECT NOME FROM vw_campeonato ORDER BY num_pontos DESC;
  ELSIF (PARAM = 2) THEN
  SELECT NOME FROM vw_campeonato ORDER BY vitorias DESC;
  ELSIF (PARAM = 3) THEN
  SELECT NOME FROM vw_campeonato ORDER BY saldo_gols DESC;
  ELSE
    RAISE EXCEPTION "NUMEROS ENTRE 1 E 3 POR FAVOR";
  END IF;
END;$$;
