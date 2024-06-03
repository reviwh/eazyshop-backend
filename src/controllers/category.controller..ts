import { Request, Response } from "express";
import { IError } from "../interfaces/Error";
import prisma from "../config/db";

class CategoryController {
  findAll = async (req: Request, res: Response) => {
    try {
      const categories = await prisma.category.findMany({
        include: {
          _count: {
            select: { Product: true },
          },
        },
      });
      if (categories.length === 0) {
        const data: IError = {
          error: "category",
          message: ["Kategori tidak ditemukan"],
        };
        return res.status(404).send({
          errors: [data],
        });
      } else {
        return res.status(200).send({ data: categories });
      }
    } catch (error: Error | any) {
      const data: IError = {
        error: error.name,
        message: [error.message],
      };
      return res.status(500).send({ errors: [data] });
    }
  };
}

export default new CategoryController();
