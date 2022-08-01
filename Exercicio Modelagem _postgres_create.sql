CREATE TABLE "public.users" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL,
	"email" TEXT NOT NULL UNIQUE,
	"password" TEXT NOT NULL,
	CONSTRAINT "users_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.products" (
	"id" serial NOT NULL,
	"name" TEXT NOT NULL UNIQUE,
	"price" bigint NOT NULL,
	"categoryId" integer NOT NULL,
	"Size" integer NOT NULL,
	"inStock" bigint NOT NULL DEFAULT '0',
	CONSTRAINT "products_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.ProductImages" (
	"id" serial NOT NULL,
	"images" TEXT NOT NULL,
	"isMain" BOOLEAN NOT NULL DEFAULT 'false',
	"productId" integer NOT NULL,
	CONSTRAINT "ProductImages_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.ProductCategory" (
	"id" serial NOT NULL,
	"category" TEXT NOT NULL UNIQUE,
	CONSTRAINT "ProductCategory_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.ProductSize" (
	"id" serial NOT NULL,
	"size" varchar(2) NOT NULL UNIQUE,
	CONSTRAINT "ProductSize_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);



CREATE TABLE "public.purchases" (
	"id" serial NOT NULL,
	"userId" integer NOT NULL,
	"productId" integer NOT NULL,
	"status" TEXT NOT NULL,
	"amount" bigint NOT NULL,
	"date" DATE NOT NULL,
	"time" TIME NOT NULL,
	"address" TEXT NOT NULL,
	CONSTRAINT "purchases_pk" PRIMARY KEY ("id")
) WITH (
  OIDS=FALSE
);




ALTER TABLE "products" ADD CONSTRAINT "products_fk0" FOREIGN KEY ("categoryId") REFERENCES "ProductCategory"("id");
ALTER TABLE "products" ADD CONSTRAINT "products_fk1" FOREIGN KEY ("Size") REFERENCES "ProductSize"("id");

ALTER TABLE "ProductImages" ADD CONSTRAINT "ProductImages_fk0" FOREIGN KEY ("productId") REFERENCES "products"("id");



ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk0" FOREIGN KEY ("userId") REFERENCES "users"("id");
ALTER TABLE "purchases" ADD CONSTRAINT "purchases_fk1" FOREIGN KEY ("productId") REFERENCES "products"("id");







