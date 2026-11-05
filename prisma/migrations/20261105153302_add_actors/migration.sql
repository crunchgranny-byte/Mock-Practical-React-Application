/*
  Warnings:

  - You are about to drop the column `filmId` on the `Actors` table. All the data in the column will be lost.

*/
-- DropForeignKey
ALTER TABLE "Actors" DROP CONSTRAINT "Actors_filmId_fkey";

-- AlterTable
ALTER TABLE "Actors" DROP COLUMN "filmId";

-- CreateTable
CREATE TABLE "_ActorsToFilms" (
    "A" INTEGER NOT NULL,
    "B" INTEGER NOT NULL,

    CONSTRAINT "_ActorsToFilms_AB_pkey" PRIMARY KEY ("A","B")
);

-- CreateIndex
CREATE INDEX "_ActorsToFilms_B_index" ON "_ActorsToFilms"("B");

-- AddForeignKey
ALTER TABLE "_ActorsToFilms" ADD CONSTRAINT "_ActorsToFilms_A_fkey" FOREIGN KEY ("A") REFERENCES "Actors"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_ActorsToFilms" ADD CONSTRAINT "_ActorsToFilms_B_fkey" FOREIGN KEY ("B") REFERENCES "Films"("id") ON DELETE CASCADE ON UPDATE CASCADE;
