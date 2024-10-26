CREATE TABLE "User" (
    "idUser" SERIAL PRIMARY KEY,
    "username" VARCHAR(255) UNIQUE NOT NULL,
    "password" VARCHAR(255) NOT NULL
);

CREATE TABLE "Question" (
    "idQuestion" SERIAL PRIMARY KEY,
    "title" VARCHAR(255) NOT NULL
);

CREATE TABLE "Words" (
    "idWords" SERIAL PRIMARY KEY,
    "word" VARCHAR(255) UNIQUE NOT NULL
);

CREATE TABLE "UserQuestion" (
    "idUserQuestion" SERIAL PRIMARY KEY,
    "userId" INT NOT NULL,
    "questionId" INT NOT NULL,
    FOREIGN KEY ("userId") REFERENCES "User"("idUser") ON UPDATE NO ACTION ON DELETE NO ACTION,
    FOREIGN KEY ("questionId") REFERENCES "Question"("idQuestion") ON UPDATE NO ACTION ON DELETE NO ACTION
);

CREATE TABLE "UserWords" (
    "idUserWords" SERIAL PRIMARY KEY,
    "userId" INT NOT NULL,
    "wordsId" INT NOT NULL,
    FOREIGN KEY ("userId") REFERENCES "User"("idUser") ON UPDATE NO ACTION ON DELETE NO ACTION,
    FOREIGN KEY ("wordsId") REFERENCES "Words"("idWords") ON UPDATE NO ACTION ON DELETE NO ACTION
);
