CREATE TABLE "customers" (
	"id" serial NOT NULL PRIMARY KEY,
	"fullName" varchar(255) NOT NULL,
	"cpf" varchar(11) NOT NULL,
	"email" TEXT NOT NULL,
	"password" TEXT NOT NULL
);



CREATE TABLE "customerAddresses" (
	"id" serial NOT NULL PRIMARY KEY,
	"customerId" integer NOT NULL UNIQUE,
	"street" TEXT NOT NULL,
	"number" integer NOT NULL,
	"complement" TEXT NOT NULL,
	"postalCode" TEXT NOT NULL,
	"cityId" integer NOT NULL
);



CREATE TABLE "cities" (
	"id" serial NOT NULL PRIMARY KEY,
	"name" varchar(255) NOT NULL,
	"stateId" integer NOT NULL
);



CREATE TABLE "states" (
	"id" serial NOT NULL PRIMARY KEY,
	"name" varchar(255) NOT NULL
);



CREATE TABLE "customerPhones" (
	"id" serial NOT NULL PRIMARY KEY,
	"customerId" integer NOT NULL,
	"number" integer NOT NULL,
	"type" TEXT NOT NULL
);



CREATE TABLE "bankAccount" (
	"id" serial NOT NULL PRIMARY KEY,
	"customerId" integer NOT NULL,
	"accountNumber" integer NOT NULL,
	"agency" TEXT NOT NULL,
	"openDate" DATE NOT NULL,
	"closeDate" DATE NOT NULL
);



CREATE TABLE "transactions" (
	"id" serial NOT NULL PRIMARY KEY,
	"bankAccountId" integer NOT NULL,
	"amount" integer NOT NULL,
	"type" TEXT NOT NULL,
	"time" timestamp with time zone NOT NULL,
	"description" TEXT NOT NULL,
	"cancelled" BOOLEAN NOT NULL
);



CREATE TABLE "creditCards" (
	"id" serial NOT NULL PRIMARY KEY,
	"bankAccountId" integer NOT NULL,
	"name" varchar(255) NOT NULL,
	"number" integer NOT NULL,
	"securityCode" TEXT NOT NULL,
	"expirationMounth" integer NOT NULL,
	"expirationYear" integer NOT NULL,
	"password" TEXT NOT NULL,
	"limit" integer NOT NULL
);




ALTER TABLE "customerAddresses" ADD CONSTRAINT "customerAddresses_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");
ALTER TABLE "customerAddresses" ADD CONSTRAINT "customerAddresses_fk1" FOREIGN KEY ("cityId") REFERENCES "cities"("id");

ALTER TABLE "cities" ADD CONSTRAINT "cities_fk0" FOREIGN KEY ("stateId") REFERENCES "states"("id");


ALTER TABLE "customerPhones" ADD CONSTRAINT "customerPhones_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "bankAccount" ADD CONSTRAINT "bankAccount_fk0" FOREIGN KEY ("customerId") REFERENCES "customers"("id");

ALTER TABLE "transactions" ADD CONSTRAINT "transactions_fk0" FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"("id");

ALTER TABLE "creditCards" ADD CONSTRAINT "creditCards_fk0" FOREIGN KEY ("bankAccountId") REFERENCES "bankAccount"("id");









