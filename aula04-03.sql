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



CREATE FUNCTION atualizaEmpate()
RETURNS TRIGGER
LANGUAGE plpgsql as $$
BEGIN
    IF (NEW.gols_mandante = NEW.gols_visitante) THEN
        UPDATE times SET empates = empates + 1 WHERE id = NEW.id_visitante OR id = NEW.id_mandante;
    END IF;
    RETURN NEW;
END;
$$;


CREATE TRIGGER atualizaEmpatetrigger
before insert ON jogos
FOR EACH ROW
EXECUTE PROCEDURE atualizaEmpate ( );

INSERT INTO jogos VALUES(1,2,2,2);