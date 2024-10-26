-- CreateTable
CREATE TABLE "User" (
    "idUser" SERIAL NOT NULL,
    "username" TEXT NOT NULL,
    "password" TEXT NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("idUser")
);

-- CreateTable
CREATE TABLE "UserQuestion" (
    "idUserQuestion" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "questionId" INTEGER NOT NULL,

    CONSTRAINT "UserQuestion_pkey" PRIMARY KEY ("idUserQuestion")
);

-- CreateTable
CREATE TABLE "UserWords" (
    "idUserWords" SERIAL NOT NULL,
    "userId" INTEGER NOT NULL,
    "wordsId" INTEGER NOT NULL,

    CONSTRAINT "UserWords_pkey" PRIMARY KEY ("idUserWords")
);

-- CreateTable
CREATE TABLE "Question" (
    "idQuestion" SERIAL NOT NULL,
    "title" TEXT NOT NULL,

    CONSTRAINT "Question_pkey" PRIMARY KEY ("idQuestion")
);

-- CreateTable
CREATE TABLE "Words" (
    "idWords" SERIAL NOT NULL,
    "word" TEXT NOT NULL,

    CONSTRAINT "Words_pkey" PRIMARY KEY ("idWords")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_username_key" ON "User"("username");

-- CreateIndex
CREATE UNIQUE INDEX "Words_word_key" ON "Words"("word");

-- AddForeignKey
ALTER TABLE "UserQuestion" ADD CONSTRAINT "UserQuestion_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("idUser") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "UserQuestion" ADD CONSTRAINT "UserQuestion_questionId_fkey" FOREIGN KEY ("questionId") REFERENCES "Question"("idQuestion") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "UserWords" ADD CONSTRAINT "UserWords_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("idUser") ON DELETE NO ACTION ON UPDATE NO ACTION;

-- AddForeignKey
ALTER TABLE "UserWords" ADD CONSTRAINT "UserWords_wordsId_fkey" FOREIGN KEY ("wordsId") REFERENCES "Words"("idWords") ON DELETE NO ACTION ON UPDATE NO ACTION;
