-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler version: 0.9.4
-- PostgreSQL version: 13.0
-- Project Site: pgmodeler.io
-- Model Author: ---

-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: new_database | type: DATABASE --
-- DROP DATABASE IF EXISTS new_database;
-- CREATE DATABASE new_database;
-- ddl-end --


-- object: public."Passageiro" | type: TABLE --
-- DROP TABLE IF EXISTS public."Passageiro" CASCADE;
CREATE TABLE public."Passageiro" (
	cpf varchar(20) NOT NULL,
	nome varchar(300),
	sobrenome varchar(300),
	documento_identidade varchar(30),
	telefone varchar(20),
	idade smallint,
	data_nascimento date,
	endereco varchar(100),
	codigo bigint,
	"codigo_posicao_Assento" bigint,
	CONSTRAINT "Passageiro_pk" PRIMARY KEY (cpf)
);
-- ddl-end --
ALTER TABLE public."Passageiro" OWNER TO postgres;
-- ddl-end --

-- object: public."Assento" | type: TABLE --
-- DROP TABLE IF EXISTS public."Assento" CASCADE;
CREATE TABLE public."Assento" (
	codigo_posicao bigint NOT NULL,
	classe_assento varchar(20),
	"numero_serie_Aviao" bigint,
	CONSTRAINT "Assento_pk" PRIMARY KEY (codigo_posicao)
);
-- ddl-end --
ALTER TABLE public."Assento" OWNER TO postgres;
-- ddl-end --

-- object: public."Aviao" | type: TABLE --
-- DROP TABLE IF EXISTS public."Aviao" CASCADE;
CREATE TABLE public."Aviao" (
	numero_serie bigint NOT NULL,
	modelo varchar(80),
	CONSTRAINT "Aviao_pk" PRIMARY KEY (numero_serie)
);
-- ddl-end --
ALTER TABLE public."Aviao" OWNER TO postgres;
-- ddl-end --

-- object: public."Voo" | type: TABLE --
-- DROP TABLE IF EXISTS public."Voo" CASCADE;
CREATE TABLE public."Voo" (
	numero bigint NOT NULL,
	comissario varchar(300),
	piloto varchar(300),
	"numero_serie_Aviao" bigint,
	"codigo_Aeroporto" bigint,
	"codigo_Aeroporto1" bigint,
	CONSTRAINT "Voo_pk" PRIMARY KEY (numero)
);
-- ddl-end --
ALTER TABLE public."Voo" OWNER TO postgres;
-- ddl-end --

-- object: public."Aeroporto" | type: TABLE --
-- DROP TABLE IF EXISTS public."Aeroporto" CASCADE;
CREATE TABLE public."Aeroporto" (
	codigo bigint NOT NULL,
	nome varchar(300),
	endereco varchar(300),
	CONSTRAINT "Aeroporto_pk" PRIMARY KEY (codigo)
);
-- ddl-end --
ALTER TABLE public."Aeroporto" OWNER TO postgres;
-- ddl-end --

-- object: "Aviao_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Voo" DROP CONSTRAINT IF EXISTS "Aviao_fk" CASCADE;
ALTER TABLE public."Voo" ADD CONSTRAINT "Aviao_fk" FOREIGN KEY ("numero_serie_Aviao")
REFERENCES public."Aviao" (numero_serie) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Voo_uq" | type: CONSTRAINT --
-- ALTER TABLE public."Voo" DROP CONSTRAINT IF EXISTS "Voo_uq" CASCADE;
ALTER TABLE public."Voo" ADD CONSTRAINT "Voo_uq" UNIQUE ("numero_serie_Aviao");
-- ddl-end --

-- object: "Aeroporto_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Voo" DROP CONSTRAINT IF EXISTS "Aeroporto_fk" CASCADE;
ALTER TABLE public."Voo" ADD CONSTRAINT "Aeroporto_fk" FOREIGN KEY ("codigo_Aeroporto")
REFERENCES public."Aeroporto" (codigo) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Aeroporto_fk1" | type: CONSTRAINT --
-- ALTER TABLE public."Voo" DROP CONSTRAINT IF EXISTS "Aeroporto_fk1" CASCADE;
ALTER TABLE public."Voo" ADD CONSTRAINT "Aeroporto_fk1" FOREIGN KEY ("codigo_Aeroporto1")
REFERENCES public."Aeroporto" (codigo) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Aviao_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Assento" DROP CONSTRAINT IF EXISTS "Aviao_fk" CASCADE;
ALTER TABLE public."Assento" ADD CONSTRAINT "Aviao_fk" FOREIGN KEY ("numero_serie_Aviao")
REFERENCES public."Aviao" (numero_serie) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Assento_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Passageiro" DROP CONSTRAINT IF EXISTS "Assento_fk" CASCADE;
ALTER TABLE public."Passageiro" ADD CONSTRAINT "Assento_fk" FOREIGN KEY ("codigo_posicao_Assento")
REFERENCES public."Assento" (codigo_posicao) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Passageiro_uq" | type: CONSTRAINT --
-- ALTER TABLE public."Passageiro" DROP CONSTRAINT IF EXISTS "Passageiro_uq" CASCADE;
ALTER TABLE public."Passageiro" ADD CONSTRAINT "Passageiro_uq" UNIQUE ("codigo_posicao_Assento");
-- ddl-end --


