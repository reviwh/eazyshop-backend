import productController from "../controllers/product.controller";
import express, { Request, Response } from "express";

const router = express.Router();

module.exports = (app: express.Application) => {
  router.get("/", productController.findAll);
  router.get("/:id", productController.findById);
  router.get("/category/:category", productController.findByCategory);
  // router.post("/product/create", productController.create);
  app.use("/api/product", router);
};
