import express from "express";
import CustomerController from '../controllers/customer.controller';


const router = express.Router();

router.post("/upload", CustomerController.createCustomer);

export default router;