import { Request, Response } from "express";
import { IError } from "../interfaces/Error";
import prisma from "../config/db";

class ProductController {
  findAll = async (req: Request, res: Response) => {
    try {
      const products = await prisma.product.findMany({
        include: {
          ProductImage: {
            select: {
              image: true,
            },
          },
          ProductReview: {
            select: {
              rating: true,
            },
          },
          _count: {
            select: { ProductReview: true },
          },
        },
      });
      if (products.length === 0) {
        const data: IError = {
          error: "product",
          message: ["Produk tidak ditemukan"],
        };
        return res.status(404).send({
          errors: [data],
        });
      } else {
        return res.status(200).send({ data: products });
      }
    } catch (e: Error | any) {
      const data: IError = {
        error: e.name,
        message: [e.message],
      };
      return res.status(500).send({ errors: [data] });
    }
  };

  findById = async (req: Request, res: Response) => {
    try {
      const idError: IError = {
        error: "id",
        message: [],
      };
      const { id } = req.params;
      if (id) {
        const parsedId = Number(id);
        if (isNaN(parsedId)) {
          idError.message.push("ID harus angka");
        } else {
          const product = await prisma.product.findUnique({
            include: {
              ProductImage: {
                select: {
                  image: true,
                },
              },
              ProductReview: {
                select: {
                  rating: true,
                },
              },
              _count: {
                select: { ProductReview: true },
              },
            },
            where: { id: parsedId },
          });
          if (product) {
            return res.status(200).send({ data: product });
          } else {
            const data: IError = {
              error: "product",
              message: ["Produk tidak ditemukan"],
            };
            return res.status(404).send({
              errors: [data],
            });
          }
        }
      } else {
        idError.message.push("ID tidak boleh kosong");
      }

      return res.status(400).send({ errors: [idError] });
    } catch (e: Error | any) {
      const data: IError = {
        error: e.name,
        message: [e.message],
      };

      return res.status(500).send({ error: [data] });
    }
  };

  findByCategory = async (req: Request, res: Response) => {
    try {
      const error: IError = {
        error: "category",
        message: [],
      };
      const { category } = req.params;

      if (category) {
        const product = await prisma.product.findMany({
          include: {
            ProductImage: {
              select: {
                image: true,
              },
            },
            ProductReview: {
              select: {
                rating: true,
              },
            },
            _count: {
              select: { ProductReview: true },
            },
          },
          where: { category: category },
        });

        if (product.length > 0) {
          return res.status(200).send({ data: product });
        } else {
          const data: IError = {
            error: "product",
            message: ["Produk tidak ditemukan"],
          };
          return res.status(404).send({ errors: [data] });
        }
      } else {
        error.message.push("Category tidak boleh kosong");
      }

      return res.status(400).send({
        errors: [error],
      });
    } catch (e: IError | any) {
      const data: IError = {
        error: e.name,
        message: [e.message],
      };

      return res.status(500).send({ errors: [data] });
    }
  };

  // create = async (req: Request, res: Response) => {
  //   try {
  //     const { name, price, color, stock, category, description } = req.body;
  //     const product = await prisma.product.create({
  //       data: {
  //         name: name,
  //         price: price,
  //         category: category,
  //         description: description,
  //         stock: stock,
  //         color: color,
  //       },
  //     });
  //     return res.status(201).send({ data: product });
  //   } catch (e: Error | any) {
  //     return res
  //       .status(500)
  //       .send({ errors: [{ error: e.name, message: e.message }] });
  //   }
  // };
}

export default new ProductController();
