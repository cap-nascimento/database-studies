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
CREATE DATABASE new_database;
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
	"id_assento_Assento" bigint,
	CONSTRAINT "Passageiro_pk" PRIMARY KEY (cpf)
);
-- ddl-end --
ALTER TABLE public."Passageiro" OWNER TO postgres;
-- ddl-end --

-- object: public."Assento" | type: TABLE --
-- DROP TABLE IF EXISTS public."Assento" CASCADE;
CREATE TABLE public."Assento" (
	id_assento bigserial NOT NULL,
	codigo_posicao bigint,
	classe_assento varchar(20),
	"id_aviao_Aviao" bigint,
	CONSTRAINT "Assento_pk" PRIMARY KEY (id_assento)
);
-- ddl-end --
ALTER TABLE public."Assento" OWNER TO postgres;
-- ddl-end --

-- object: public."Aviao" | type: TABLE --
-- DROP TABLE IF EXISTS public."Aviao" CASCADE;
CREATE TABLE public."Aviao" (
	id_aviao bigserial NOT NULL,
	numero_serie bigint,
	modelo varchar(80),
	CONSTRAINT "Aviao_pk" PRIMARY KEY (id_aviao)
);
-- ddl-end --
ALTER TABLE public."Aviao" OWNER TO postgres;
-- ddl-end --

-- object: public."Voo" | type: TABLE --
-- DROP TABLE IF EXISTS public."Voo" CASCADE;
CREATE TABLE public."Voo" (
	id_voo bigserial NOT NULL,
	numero bigint,
	"id_aviao_Aeroporto" bigint,
	"id_aviao_Aeroporto1" bigint,
	"id_aviao_Aviao" bigint,
	CONSTRAINT "Voo_pk" PRIMARY KEY (id_voo)
);
-- ddl-end --
ALTER TABLE public."Voo" OWNER TO postgres;
-- ddl-end --

-- object: public."Aeroporto" | type: TABLE --
-- DROP TABLE IF EXISTS public."Aeroporto" CASCADE;
CREATE TABLE public."Aeroporto" (
	id_aviao bigserial NOT NULL,
	codigo bigint,
	nome varchar(300),
	endereco varchar(300),
	"id_cidade_Cidade" bigint,
	CONSTRAINT "Aeroporto_pk" PRIMARY KEY (id_aviao)
);
-- ddl-end --
ALTER TABLE public."Aeroporto" OWNER TO postgres;
-- ddl-end --

-- object: "Aeroporto_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Voo" DROP CONSTRAINT IF EXISTS "Aeroporto_fk" CASCADE;
ALTER TABLE public."Voo" ADD CONSTRAINT "Aeroporto_fk" FOREIGN KEY ("id_aviao_Aeroporto")
REFERENCES public."Aeroporto" (id_aviao) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Aeroporto_fk1" | type: CONSTRAINT --
-- ALTER TABLE public."Voo" DROP CONSTRAINT IF EXISTS "Aeroporto_fk1" CASCADE;
ALTER TABLE public."Voo" ADD CONSTRAINT "Aeroporto_fk1" FOREIGN KEY ("id_aviao_Aeroporto1")
REFERENCES public."Aeroporto" (id_aviao) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Aviao_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Assento" DROP CONSTRAINT IF EXISTS "Aviao_fk" CASCADE;
ALTER TABLE public."Assento" ADD CONSTRAINT "Aviao_fk" FOREIGN KEY ("id_aviao_Aviao")
REFERENCES public."Aviao" (id_aviao) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Assento_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Passageiro" DROP CONSTRAINT IF EXISTS "Assento_fk" CASCADE;
ALTER TABLE public."Passageiro" ADD CONSTRAINT "Assento_fk" FOREIGN KEY ("id_assento_Assento")
REFERENCES public."Assento" (id_assento) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Passageiro_uq" | type: CONSTRAINT --
-- ALTER TABLE public."Passageiro" DROP CONSTRAINT IF EXISTS "Passageiro_uq" CASCADE;
ALTER TABLE public."Passageiro" ADD CONSTRAINT "Passageiro_uq" UNIQUE ("id_assento_Assento");
-- ddl-end --

-- object: public."Tripulacao" | type: TABLE --
-- DROP TABLE IF EXISTS public."Tripulacao" CASCADE;
CREATE TABLE public."Tripulacao" (
	id_tripulacao bigserial NOT NULL,
	nome_funcionario varchar(300),
	"id_tipo_Tipo" bigint,
	CONSTRAINT "Funcionario_pk" PRIMARY KEY (id_tripulacao)
);
-- ddl-end --
ALTER TABLE public."Tripulacao" OWNER TO postgres;
-- ddl-end --

-- object: public."Cidade" | type: TABLE --
-- DROP TABLE IF EXISTS public."Cidade" CASCADE;
CREATE TABLE public."Cidade" (
	id_cidade bigserial NOT NULL,
	nome_cidade varchar(300),
	CONSTRAINT "Cidade_pk" PRIMARY KEY (id_cidade)
);
-- ddl-end --
ALTER TABLE public."Cidade" OWNER TO postgres;
-- ddl-end --

-- object: "Cidade_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Aeroporto" DROP CONSTRAINT IF EXISTS "Cidade_fk" CASCADE;
ALTER TABLE public."Aeroporto" ADD CONSTRAINT "Cidade_fk" FOREIGN KEY ("id_cidade_Cidade")
REFERENCES public."Cidade" (id_cidade) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Aviao_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Voo" DROP CONSTRAINT IF EXISTS "Aviao_fk" CASCADE;
ALTER TABLE public."Voo" ADD CONSTRAINT "Aviao_fk" FOREIGN KEY ("id_aviao_Aviao")
REFERENCES public."Aviao" (id_aviao) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public."Tipo" | type: TABLE --
-- DROP TABLE IF EXISTS public."Tipo" CASCADE;
CREATE TABLE public."Tipo" (
	id_tipo bigserial NOT NULL,
	nome_tipo smallint,
	CONSTRAINT "Tipo_pk" PRIMARY KEY (id_tipo)
);
-- ddl-end --
ALTER TABLE public."Tipo" OWNER TO postgres;
-- ddl-end --

-- object: "Tipo_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Tripulacao" DROP CONSTRAINT IF EXISTS "Tipo_fk" CASCADE;
ALTER TABLE public."Tripulacao" ADD CONSTRAINT "Tipo_fk" FOREIGN KEY ("id_tipo_Tipo")
REFERENCES public."Tipo" (id_tipo) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public."many_Voo_has_many_Tripulacao" | type: TABLE --
-- DROP TABLE IF EXISTS public."many_Voo_has_many_Tripulacao" CASCADE;
CREATE TABLE public."many_Voo_has_many_Tripulacao" (
	"id_voo_Voo" bigint NOT NULL,
	"id_tripulacao_Tripulacao" bigint NOT NULL,
	CONSTRAINT "many_Voo_has_many_Tripulacao_pk" PRIMARY KEY ("id_voo_Voo","id_tripulacao_Tripulacao")
);
-- ddl-end --

-- object: "Voo_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_Voo_has_many_Tripulacao" DROP CONSTRAINT IF EXISTS "Voo_fk" CASCADE;
ALTER TABLE public."many_Voo_has_many_Tripulacao" ADD CONSTRAINT "Voo_fk" FOREIGN KEY ("id_voo_Voo")
REFERENCES public."Voo" (id_voo) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: "Tripulacao_fk" | type: CONSTRAINT --
-- ALTER TABLE public."many_Voo_has_many_Tripulacao" DROP CONSTRAINT IF EXISTS "Tripulacao_fk" CASCADE;
ALTER TABLE public."many_Voo_has_many_Tripulacao" ADD CONSTRAINT "Tripulacao_fk" FOREIGN KEY ("id_tripulacao_Tripulacao")
REFERENCES public."Tripulacao" (id_tripulacao) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --


