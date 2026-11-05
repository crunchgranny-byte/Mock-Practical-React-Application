-- CreateTable
CREATE TABLE "Actors" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "birthYear" INTEGER NOT NULL,
    "films" TEXT[],

    CONSTRAINT "Actors_pkey" PRIMARY KEY ("id")
);
