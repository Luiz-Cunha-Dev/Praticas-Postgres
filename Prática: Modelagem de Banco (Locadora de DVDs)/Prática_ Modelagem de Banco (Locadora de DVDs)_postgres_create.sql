CREATE TABLE "discos" (
	"id" serial NOT NULL PRIMARY KEY,
	"filmeId" TEXT NOT NULL,
	"numero" integer NOT NULL UNIQUE,
	"codigoDeBarras" TEXT NOT NULL UNIQUE
);


CREATE TABLE "filmes" (
	"id" serial NOT NULL PRIMARY KEY,
	"titulo" TEXT NOT NULL,
	"categoriaId" integer NOT NULL
);


CREATE TABLE "categorias" (
	"id" serial NOT NULL PRIMARY KEY,
	"nome" TEXT NOT NULL UNIQUE
);


CREATE TABLE "atores" (
	"id" serial NOT NULL PRIMARY KEY,
	"nome" TEXT NOT NULL,
	"dataNascimento" bigint NOT NULL,
	"paisId" bigint NOT NULL
);


CREATE TABLE "atoresFilmes" (
	"id" serial NOT NULL PRIMARY KEY,
	"atorId" integer NOT NULL,
	"filmeId" integer NOT NULL
);


CREATE TABLE "clientes" (
	"id" serial NOT NULL PRIMARY KEY,
	"nome" TEXT NOT NULL,
	"telefone" integer NOT NULL,
	"endereçoId" integer NOT NULL
);


CREATE TABLE "endereços" (
	"id" serial NOT NULL PRIMARY KEY,
	"clienteId" integer NOT NULL,
	"rua" TEXT NOT NULL,
	"numero" integer NOT NULL,
	"complemento" TEXT NOT NULL,
	"cep" integer NOT NULL,
	"bairroId" integer NOT NULL,
	"cpf" varchar(11) NOT NULL UNIQUE
);


CREATE TABLE "locaçoes" (
	"id" serial NOT NULL PRIMARY KEY,
	"clienteId" integer NOT NULL,
	"discoId" integer NOT NULL,
	"dataLocaçao" DATE NOT NULL,
	"dataDevoluçao" DATE NOT NULL,
	"pesquisaId" integer NOT NULL
);


CREATE TABLE "pesquisas" (
	"id" serial NOT NULL PRIMARY KEY,
	"notaSatisfaçaoId" integer NOT NULL,
	"notaAtendimentoId" integer NOT NULL
);


CREATE TABLE "notas" (
	"id" serial NOT NULL PRIMARY KEY,
	"valor" integer NOT NULL
);


CREATE TABLE "bairros" (
	"id" serial NOT NULL PRIMARY KEY,
	"nome" TEXT NOT NULL,
	"cidadeId" integer NOT NULL
);


CREATE TABLE "estados" (
	"id" serial NOT NULL PRIMARY KEY,
	"nome" TEXT NOT NULL
);


CREATE TABLE "cidades" (
	"id" serial NOT NULL PRIMARY KEY,
	"nome" TEXT NOT NULL,
	"estadoId" integer NOT NULL
);


CREATE TABLE "paises" (
	"id" serial NOT NULL PRIMARY KEY,
	"nome" TEXT NOT NULL
);



ALTER TABLE "discos" ADD CONSTRAINT "discos_fk0" FOREIGN KEY ("filmeId") REFERENCES "filmes"("id");

ALTER TABLE "filmes" ADD CONSTRAINT "filmes_fk0" FOREIGN KEY ("categoriaId") REFERENCES "categorias"("id");

ALTER TABLE "atores" ADD CONSTRAINT "atores_fk0" FOREIGN KEY ("paisId") REFERENCES "paises"("id");

ALTER TABLE "atoresFilmes" ADD CONSTRAINT "atoresFilmes_fk0" FOREIGN KEY ("atorId") REFERENCES "atores"("id");
ALTER TABLE "atoresFilmes" ADD CONSTRAINT "atoresFilmes_fk1" FOREIGN KEY ("filmeId") REFERENCES "filmes"("id");

ALTER TABLE "clientes" ADD CONSTRAINT "clientes_fk0" FOREIGN KEY ("endereçoId") REFERENCES "endereços"("id");

ALTER TABLE "endereços" ADD CONSTRAINT "endereços_fk0" FOREIGN KEY ("bairroId") REFERENCES "bairros"("id");

ALTER TABLE "locaçoes" ADD CONSTRAINT "locaçoes_fk0" FOREIGN KEY ("clienteId") REFERENCES "clientes"("id");
ALTER TABLE "locaçoes" ADD CONSTRAINT "locaçoes_fk1" FOREIGN KEY ("discoId") REFERENCES "discos"("id");
ALTER TABLE "locaçoes" ADD CONSTRAINT "locaçoes_fk2" FOREIGN KEY ("pesquisaId") REFERENCES "pesquisas"("id");

ALTER TABLE "pesquisas" ADD CONSTRAINT "pesquisas_fk0" FOREIGN KEY ("notaSatisfaçaoId") REFERENCES "notas"("id");
ALTER TABLE "pesquisas" ADD CONSTRAINT "pesquisas_fk1" FOREIGN KEY ("notaAtendimentoId") REFERENCES "notas"("id");

ALTER TABLE "bairros" ADD CONSTRAINT "bairros_fk0" FOREIGN KEY ("cidadeId") REFERENCES "cidades"("id");

ALTER TABLE "cidades" ADD CONSTRAINT "cidades_fk0" FOREIGN KEY ("estadoId") REFERENCES "estados"("id");












