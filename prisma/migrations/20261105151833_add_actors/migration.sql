/*
  Warnings:

  - You are about to drop the column `films` on the `Actors` table. All the data in the column will be lost.
  - You are about to drop the column `director` on the `Films` table. All the data in the column will be lost.
  - Added the required column `filmId` to the `Actors` table without a default value. This is not possible if the table is not empty.
  - Added the required column `directorId` to the `Films` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "Actors" DROP COLUMN "films",
ADD COLUMN     "filmId" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "Films" DROP COLUMN "director",
ADD COLUMN     "directorId" INTEGER NOT NULL;

-- AddForeignKey
ALTER TABLE "Films" ADD CONSTRAINT "Films_directorId_fkey" FOREIGN KEY ("directorId") REFERENCES "Directors"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Actors" ADD CONSTRAINT "Actors_filmId_fkey" FOREIGN KEY ("filmId") REFERENCES "Films"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
