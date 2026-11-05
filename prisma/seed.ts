import "dotenv/config";
import prisma from "../lib/prisma";

async function main() {
  // Delete existing data, so the script can be run more than once.
  await prisma.films.deleteMany();
  await prisma.directors.deleteMany();
  await prisma.actors.deleteMany();

  // Directors
  const nolan = await prisma.directors.create({
    data: { name: "Christopher Nolan", nationality: "British" },
  });

  const gerwig = await prisma.directors.create({
    data: { name: "Greta Gerwig", nationality: "American"},
  });

  const villeneuve = await prisma.directors.create({
    data: { name: "Denis Villeneuve", nationality: "Canadian"},
  });

  //Films
  const inception = await prisma.films.create({
    data: { title: "Inception", releaseYear: 2010, directorId: nolan.id },
  });

  const interstellar = await prisma.films.create({
    data: { title: "Interstellar", releaseYear: 2014, directorId: nolan.id},
  });

  const oppenheimer = await prisma.films.create({
    data: { title: "Oppenheimer", releaseYear: 2023, directorId: nolan.id},
  });

  const littlewomen = await prisma.films.create({
    data: { title: "Little Women", releaseYear: 2019, directorId: gerwig.id},
  });

  const dune = await prisma.films.create({
    data: { title: "Dune", releaseYear: 2021, directorId: villeneuve.id},
  });

  //Actors
  await prisma.actors.create({
    data: {
        name: "Leonardo DiCaprio",
        birthYear: 1974,
        film: { connect: [{id: inception.id}]},
    },
  });

   await prisma.actors.create({
    data: {
        name: "Cillian Murphy",
        birthYear: 1976,
        film: { connect: [{id: inception.id}, {id: oppenheimer.id}]},
    },
  });
   
   await prisma.actors.create({
    data: {
        name: "Matt Damon",
        birthYear: 1976,
        film: { connect: [{id: interstellar.id}, {id: oppenheimer.id}]},
    },
  });

   await prisma.actors.create({
    data: {
        name: "Timothee Chalamet",
        birthYear: 1995,
        film: { connect: [{id: inception.id}, {id: littlewomen.id}, {id: dune.id}]},
    },
  });

   await prisma.actors.create({
    data: {
        name: "Florence Pugh",
        birthYear: 1996,
        film: { connect: [{id: oppenheimer.id}, {id: littlewomen.id}]},
    },
  });

  console.log("Seeding finished.");
}

main()
  .catch((error) => {
    console.error(error);
    process.exit(1);
  })
  .finally(() => prisma.$disconnect());