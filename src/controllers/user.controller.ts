import { Request, Response } from "express";
import prisma from "../config/db";

class UserController {
  findAll = async (req: Request, res: Response) => {
    try {
      const users = await prisma.user.findMany();
      if (users.length === 0) {
        return res.status(404).send({
          errors: [{ field: "user", error: ["User tidak ditemukan"] }],
        });
      } else {
        return res.status(200).send({ data: users });
      }
    } catch (e: Error | any) {
      return res
        .status(500)
        .send({ errors: [{ field: e.name, message: e.message }] });
    }
  };
}

export default new UserController();