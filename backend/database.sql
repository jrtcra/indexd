CREATE TABLE "users" (
  "id" serial PRIMARY KEY,
  "username" varchar UNIQUE NOT NULL,
  "password" varchar NOT NULL,
  "email" varchar UNIQUE NOT NULL,
  "bio" text,
  "profile_pic" varchar,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "users_top_four" (
  "id" serial PRIMARY KEY,
  "user_id" serial NOT NULL,
  "book_id" serial NOT NULL,
  "position" integer NOT NULL
);

CREATE TABLE "user_books" (
  "id" serial PRIMARY KEY,
  "user_id" serial NOT NULL,
  "book_id" serial NOT NULL,
  "google_id" serial NOT NULL,
  "status" varchar NOT NULL,
  "rating" float,
  "date_added" timestamp DEFAULT (now()),
  "date_read" timestamp
);

CREATE TABLE "books" (
  "id" serial PRIMARY KEY,
  "google_id" varchar UNIQUE NOT NULL,
  "title" varchar NOT NULL,
  "author" varchar NOT NULL
);

CREATE TABLE "lists" (
  "id" serial PRIMARY KEY,
  "user_id" serial NOT NULL,
  "title" varchar NOT NULL,
  "description" text,
  "is_private" boolean DEFAULT false,
  "created_at" timestamp DEFAULT (now())
);

CREATE TABLE "list_books" (
  "id" serial PRIMARY KEY,
  "list_id" serial NOT NULL,
  "book_id" integer NOT NULL
);

ALTER TABLE "users_top_four" ADD FOREIGN KEY ("book_id") REFERENCES "books" ("id");

ALTER TABLE "users_top_four" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "user_books" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "user_books" ADD FOREIGN KEY ("book_id") REFERENCES "books" ("id");

ALTER TABLE "lists" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "list_books" ADD FOREIGN KEY ("list_id") REFERENCES "lists" ("id");

ALTER TABLE "list_books" ADD FOREIGN KEY ("book_id") REFERENCES "books" ("id");
