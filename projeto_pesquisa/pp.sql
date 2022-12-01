-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler version: 0.9.4
-- PostgreSQL version: 13.0
-- Project Site: pgmodeler.io
-- Model Author: ---

-- Database creation must be performed outside a multi lined SQL file. 
-- These commands were put in this file only as a convenience.
-- 
-- object: projeto_pesquisa | type: DATABASE --
-- DROP DATABASE IF EXISTS projeto_pesquisa;
-- CREATE DATABASE projeto_pesquisa;
-- ddl-end --


-- object: public."Professor" | type: TABLE --
-- DROP TABLE IF EXISTS public."Professor" CASCADE;
CREATE TABLE public."Professor" (
	id_professor bigserial NOT NULL,
	nome_professor varchar(100) NOT NULL,
	matricula_professor varchar(80) NOT NULL,
	"id_departamento_Departamento" bigint,
	CONSTRAINT "Professor_pk" PRIMARY KEY (id_professor)
);
-- ddl-end --
ALTER TABLE public."Professor" OWNER TO postgres;
-- ddl-end --

-- object: public."Aluno" | type: TABLE --
-- DROP TABLE IF EXISTS public."Aluno" CASCADE;
CREATE TABLE public."Aluno" (
	id_aluno bigserial NOT NULL,
	nome_aluno varchar(100) NOT NULL,
	matricula_aluno varchar(80) NOT NULL,
	"id_professor_Professor" bigint,
	"id_curso_Curso" bigint,
	CONSTRAINT "Aluno_pk" PRIMARY KEY (id_aluno)
);
-- ddl-end --
ALTER TABLE public."Aluno" OWNER TO postgres;
-- ddl-end --

-- object: public."Projeto_pesquisa" | type: TABLE --
-- DROP TABLE IF EXISTS public."Projeto_pesquisa" CASCADE;
CREATE TABLE public."Projeto_pesquisa" (
	id_projeto_pesquisa bigserial NOT NULL,
	titulo_projeto varchar(500) NOT NULL,
	data_conclusao_projeto date NOT NULL,
	"id_aluno_Aluno" bigint,
	"id_relatorio_Relatorio" bigint,
	CONSTRAINT "Projeto_pesquisa_pk" PRIMARY KEY (id_projeto_pesquisa)
);
-- ddl-end --
ALTER TABLE public."Projeto_pesquisa" OWNER TO postgres;
-- ddl-end --

-- object: public."Comissao_externa" | type: TABLE --
-- DROP TABLE IF EXISTS public."Comissao_externa" CASCADE;
CREATE TABLE public."Comissao_externa" (
	id_comissao_externa bigserial NOT NULL,
	CONSTRAINT "Comissao_externa_pk" PRIMARY KEY (id_comissao_externa)
);
-- ddl-end --
ALTER TABLE public."Comissao_externa" OWNER TO postgres;
-- ddl-end --

-- object: public."Relatorio" | type: TABLE --
-- DROP TABLE IF EXISTS public."Relatorio" CASCADE;
CREATE TABLE public."Relatorio" (
	id_relatorio bigserial NOT NULL,
	"id_aluno_Aluno" bigint,
	CONSTRAINT "Relatorio_pk" PRIMARY KEY (id_relatorio)
);
-- ddl-end --
ALTER TABLE public."Relatorio" OWNER TO postgres;
-- ddl-end --

-- object: public."Curso" | type: TABLE --
-- DROP TABLE IF EXISTS public."Curso" CASCADE;
CREATE TABLE public."Curso" (
	id_curso bigserial NOT NULL,
	nome_curso varchar(100),
	CONSTRAINT "Curso_pk" PRIMARY KEY (id_curso)
);
-- ddl-end --
ALTER TABLE public."Curso" OWNER TO postgres;
-- ddl-end --

-- object: public."Orientacao" | type: TABLE --
-- DROP TABLE IF EXISTS public."Orientacao" CASCADE;
CREATE TABLE public."Orientacao" (
	id_orientacao bigserial NOT NULL,
	"id_aluno_Aluno" bigint,
	"id_professor_Professor" bigint,
	"id_comissao_externa_Comissao_externa" bigint,
	CONSTRAINT "Orientacao_pk" PRIMARY KEY (id_orientacao)
);
-- ddl-end --
ALTER TABLE public."Orientacao" OWNER TO postgres;
-- ddl-end --

-- object: "Professor_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Aluno" DROP CONSTRAINT IF EXISTS "Professor_fk" CASCADE;
ALTER TABLE public."Aluno" ADD CONSTRAINT "Professor_fk" FOREIGN KEY ("id_professor_Professor")
REFERENCES public."Professor" (id_professor) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Aluno_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Projeto_pesquisa" DROP CONSTRAINT IF EXISTS "Aluno_fk" CASCADE;
ALTER TABLE public."Projeto_pesquisa" ADD CONSTRAINT "Aluno_fk" FOREIGN KEY ("id_aluno_Aluno")
REFERENCES public."Aluno" (id_aluno) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Aluno_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Orientacao" DROP CONSTRAINT IF EXISTS "Aluno_fk" CASCADE;
ALTER TABLE public."Orientacao" ADD CONSTRAINT "Aluno_fk" FOREIGN KEY ("id_aluno_Aluno")
REFERENCES public."Aluno" (id_aluno) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Professor_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Orientacao" DROP CONSTRAINT IF EXISTS "Professor_fk" CASCADE;
ALTER TABLE public."Orientacao" ADD CONSTRAINT "Professor_fk" FOREIGN KEY ("id_professor_Professor")
REFERENCES public."Professor" (id_professor) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public."Departamento" | type: TABLE --
-- DROP TABLE IF EXISTS public."Departamento" CASCADE;
CREATE TABLE public."Departamento" (
	id_departamento bigserial NOT NULL,
	nome_departamento varchar(100) NOT NULL,
	CONSTRAINT "Departamento_pk" PRIMARY KEY (id_departamento)
);
-- ddl-end --
ALTER TABLE public."Departamento" OWNER TO postgres;
-- ddl-end --

-- object: "Curso_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Aluno" DROP CONSTRAINT IF EXISTS "Curso_fk" CASCADE;
ALTER TABLE public."Aluno" ADD CONSTRAINT "Curso_fk" FOREIGN KEY ("id_curso_Curso")
REFERENCES public."Curso" (id_curso) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Departamento_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Professor" DROP CONSTRAINT IF EXISTS "Departamento_fk" CASCADE;
ALTER TABLE public."Professor" ADD CONSTRAINT "Departamento_fk" FOREIGN KEY ("id_departamento_Departamento")
REFERENCES public."Departamento" (id_departamento) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Comissao_externa_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Orientacao" DROP CONSTRAINT IF EXISTS "Comissao_externa_fk" CASCADE;
ALTER TABLE public."Orientacao" ADD CONSTRAINT "Comissao_externa_fk" FOREIGN KEY ("id_comissao_externa_Comissao_externa")
REFERENCES public."Comissao_externa" (id_comissao_externa) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Aluno_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Relatorio" DROP CONSTRAINT IF EXISTS "Aluno_fk" CASCADE;
ALTER TABLE public."Relatorio" ADD CONSTRAINT "Aluno_fk" FOREIGN KEY ("id_aluno_Aluno")
REFERENCES public."Aluno" (id_aluno) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: public."Atividade" | type: TABLE --
-- DROP TABLE IF EXISTS public."Atividade" CASCADE;
CREATE TABLE public."Atividade" (
	id_atividade bigserial NOT NULL,
	titulo_atividade varchar(500),
	data_conclusao_atividade date,
	"id_relatorio_Relatorio" bigint,
	CONSTRAINT "Atividade_pk" PRIMARY KEY (id_atividade)
);
-- ddl-end --
ALTER TABLE public."Atividade" OWNER TO postgres;
-- ddl-end --

-- object: "Relatorio_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Atividade" DROP CONSTRAINT IF EXISTS "Relatorio_fk" CASCADE;
ALTER TABLE public."Atividade" ADD CONSTRAINT "Relatorio_fk" FOREIGN KEY ("id_relatorio_Relatorio")
REFERENCES public."Relatorio" (id_relatorio) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Relatorio_fk" | type: CONSTRAINT --
-- ALTER TABLE public."Projeto_pesquisa" DROP CONSTRAINT IF EXISTS "Relatorio_fk" CASCADE;
ALTER TABLE public."Projeto_pesquisa" ADD CONSTRAINT "Relatorio_fk" FOREIGN KEY ("id_relatorio_Relatorio")
REFERENCES public."Relatorio" (id_relatorio) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: "Projeto_pesquisa_uq" | type: CONSTRAINT --
-- ALTER TABLE public."Projeto_pesquisa" DROP CONSTRAINT IF EXISTS "Projeto_pesquisa_uq" CASCADE;
ALTER TABLE public."Projeto_pesquisa" ADD CONSTRAINT "Projeto_pesquisa_uq" UNIQUE ("id_relatorio_Relatorio");
-- ddl-end --


