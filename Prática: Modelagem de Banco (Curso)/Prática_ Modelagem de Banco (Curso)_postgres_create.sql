CREATE TABLE "alunos" (
	"id" serial PRIMARY KEY,
	"nome" TEXT NOT NULL,
	"cpf" varchar(11) NOT NULL,
	"email" TEXT NOT NULL
);


CREATE TABLE "turmas" (
	"id" serial PRIMARY KEY,
	"aluno_id" integer NOT NULL,
	"codigo" TEXT NOT NULL,
	"data_entrada" DATE NOT NULL,
	"data_saida" DATE
);


CREATE TABLE "projetos" (
	"id" serial PRIMARY KEY,
	"aluno_id" integer NOT NULL,
	"nome" TEXT NOT NULL,
	"data" DATE NOT NULL,
	"nota" TEXT NOT NULL,
	"modulo_id" TEXT NOT NULL
);


CREATE TABLE "modulos" (
	"id" serial PRIMARY KEY,
	"nome" TEXT NOT NULL
);



ALTER TABLE "turmas" ADD CONSTRAINT "turmas_fk0" FOREIGN KEY ("aluno_id") REFERENCES "alunos"("id");

ALTER TABLE "projetos" ADD CONSTRAINT "projetos_fk0" FOREIGN KEY ("aluno_id") REFERENCES "alunos"("id");
ALTER TABLE "projetos" ADD CONSTRAINT "projetos_fk1" FOREIGN KEY ("modulo_id") REFERENCES "modulos"("id");






