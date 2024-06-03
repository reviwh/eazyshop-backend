import categoryController from "../controllers/category.controller.";
import productController from "../controllers/product.controller";
import express, { Request, Response } from "express";

const router = express.Router();

module.exports = (app: express.Application) => {
  router.get("/", categoryController.findAll);
  app.use("/api/category", router);
};
