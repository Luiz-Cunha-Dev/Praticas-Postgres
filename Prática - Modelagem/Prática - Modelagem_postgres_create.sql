CREATE DATABASE "banco_de_dados";

CREATE TABLE "products" (
	"id" serial PRIMARY KEY,
	"name" varchar(50) NOT NULL,
	"price" integer NOT NULL,
	"main_image" TEXT NOT NULL,
	"secondary_image" TEXT NOT NULL,
	"category" TEXT NOT NULL
);



CREATE TABLE "users" (
	"id" serial PRIMARY KEY,
	"name" varchar(50) NOT NULL,
	"email" TEXT NOT NULL,
	"password" varchar(30) NOT NULL
);



CREATE TABLE "sales" (
	"id" serial PRIMARY KEY,
	"user_id" integer NOT NULL REFERENCES "users"("id"),
	"product_id" integer NOT NULL REFERENCES "products"("id"),
	"number" integer NOT NULL,
	"status" TEXT NOT NULL,
	"date" DATE NOT NULL,
	"address" TEXT NOT NULL
);





