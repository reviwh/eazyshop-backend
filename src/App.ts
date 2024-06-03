import express, { Request, Response } from "express";

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use((_, res, next) => {
  res.header("Access-Control-Allow-Origin", "*");
  res.header(
    "Access-Control-Allow-Headers",
    "Origin, X-Requested-With, Content-Type, Accept"
  );
  next();
});

require("./routes/product.route")(app);
require("./routes/category.route")(app);

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server running on port http://localhost:${PORT}`);
});
