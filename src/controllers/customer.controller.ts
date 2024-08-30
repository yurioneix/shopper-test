import { Request, Response } from "express";
import { prisma } from "../server";

const createCustomer = async (req: Request, res: Response) => {
    try {
        const { 
            image, 
            customerCode, 
            measureDateTime, 
            measureType 
        } = req.body;

        const newCustomer = await prisma.customer.create({
            data: {
                image, 
                customerCode, 
                measureType, 
                measureDateTime
            },
        });
        res.status(200).json(newCustomer);

    } catch (e) {
        res.status(400).json({ error: e });
    }
}

export default {
    createCustomer
};