import { PrismaClient } from "@prisma/client";
import { parseArgs } from "util";

const prisma = new PrismaClient();

const options = {
  table: { type: "string" as const },
};

interface ParsedArgs {
  values: {
    table?: string;
  };
}

async function main() {
  const {
    values: { table },
  } = parseArgs({ options }) as ParsedArgs;

  switch (table) {
    case "product":
      await prisma.category.createMany({
        data: [
          { name: "Bag" },
          { name: "Shirt" },
          { name: "Shoes" },
          { name: "Jacket" },
          { name: "Tie" },
          { name: "Sweater" },
          { name: "Scarf" },
          { name: "Pants" },
          { name: "Dress" },
          { name: "Socks" },
          { name: "Sleepwear" },
          { name: "Underwear" },
          { name: "Accessories" },
        ],
      });

      await prisma.product.createMany({
        data: [
          {
            name: "Bag",
            color: "white",
            stock: 10,
            price: 10.5,
            description: "A nice bag",
            category: "Bag",
          },
          {
            name: "Shirt",
            color: "red",
            stock: 10,
            price: 20.5,
            description: "A nice shirt",
            category: "Shirt",
          },
          {
            name: "Shoes",
            color: "black",
            stock: 10,
            price: 30.5,
            description: "A nice pair of shoes",
            category: "Shoes",
          },
          {
            name: "Jacket",
            color: "brown",
            stock: 10,
            price: 40.5,
            description: "A nice jacket",
            category: "Jacket",
          },
          {
            name: "Tie",
            color: "blue",
            stock: 10,
            price: 50.5,
            description: "A nice tie",
            category: "Tie",
          },
          {
            name: "Sweater",
            color: "green",
            stock: 10,
            price: 60.5,
            description: "A nice sweater",
            category: "Sweater",
          },
          {
            name: "Scarf",
            color: "yellow",
            stock: 10,
            price: 70.5,
            description: "A nice scarf",
            category: "Scarf",
          },
          {
            name: "Pants",
            color: "purple",
            stock: 10,
            price: 80.5,
            description: "A nice pair of pants",
            category: "Pants",
          },
          {
            name: "Dress",
            color: "pink",
            stock: 10,
            price: 90.5,
            description: "A nice dress",
            category: "Dress",
          },
          {
            name: "Socks",
            color: "gray",
            stock: 10,
            price: 100.5,
            description: "A nice pair of socks",
            category: "Socks",
          },
          {
            name: "Sleepwear",
            color: "orange",
            stock: 10,
            price: 110.5,
            description: "A nice sleepwear",
            category: "Sleepwear",
          },
          {
            name: "Underwear",
            color: "brown",
            stock: 10,
            price: 120.5,
            description: "A nice pair of underwear",
            category: "Underwear",
          },
          {
            name: "Accessories",
            color: "white",
            stock: 10,
            price: 130.5,
            description: "A nice accessories",
            category: "Accessories",
          },
        ],
      });
      break;
    case "productImage":
      await prisma.productImage.createMany({
        data: [
          {
            image: "https://placehold.co/100",
            productId: 1,
          },
          {
            image: "https://placehold.co/100x200",
            productId: 1,
          },
          {
            image: "https://placehold.co/100",
            productId: 2,
          },
          {
            image: "https://placehold.co/100",
            productId: 3,
          },
          {
            image: "https://placehold.co/100",
            productId: 4,
          },
        ],
      });
      break;
  }
}

main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });
