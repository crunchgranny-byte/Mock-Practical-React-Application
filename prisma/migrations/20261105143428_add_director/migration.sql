-- CreateTable
CREATE TABLE "Directors" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "nationality" TEXT NOT NULL,

    CONSTRAINT "Directors_pkey" PRIMARY KEY ("id")
);
