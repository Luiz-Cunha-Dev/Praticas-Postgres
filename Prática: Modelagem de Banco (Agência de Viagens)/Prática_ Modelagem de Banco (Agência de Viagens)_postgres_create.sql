CREATE TABLE "companhias" (
	"id" serial PRIMARY KEY,
	"sigla" TEXT NOT NULL,
	"nome" TEXT NOT NULL
);


CREATE TABLE "voos" (
	"id" serial PRIMARY KEY,
	"companhia_id" integer NOT NULL,
	"sigla" TEXT NOT NULL,
	"origem_id" integer NOT NULL,
	"destino_id" integer NOT NULL,
	"horario_saida" TIMESTAMP NOT NULL,
	"horario_chegada" TIMESTAMP NOT NULL
);


CREATE TABLE "aeroportos" (
	"id" serial PRIMARY KEY,
	"sigla" TEXT NOT NULL,
	"nome" TEXT NOT NULL
);


ALTER TABLE "voos" ADD CONSTRAINT "voos_fk0" FOREIGN KEY ("companhia_id") REFERENCES "companhias"("id");
ALTER TABLE "voos" ADD CONSTRAINT "voos_fk1" FOREIGN KEY ("origem_id") REFERENCES "aeroportos"("id");
ALTER TABLE "voos" ADD CONSTRAINT "voos_fk2" FOREIGN KEY ("destino_id") REFERENCES "aeroportos"("id");





