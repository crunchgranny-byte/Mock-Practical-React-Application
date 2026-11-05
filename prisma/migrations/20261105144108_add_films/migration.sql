-- CreateTable
CREATE TABLE "Films" (
    "id" SERIAL NOT NULL,
    "title" TEXT NOT NULL,
    "releaseYear" INTEGER NOT NULL,
    "director" TEXT NOT NULL,

    CONSTRAINT "Films_pkey" PRIMARY KEY ("id")
);
